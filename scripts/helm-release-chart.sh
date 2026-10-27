#!/usr/bin/env bash
#
# Publish the `zid` chart to the chart archive branch (gh-pages) and leave the
# Pages site buildable from it.
#
# Contract (see plans/gitops-repos-plan.md §2 / A-01):
#   * package charts/zid explicitly - never guess the chart directory
#   * fail loudly - a failed checkout, index build, commit or push fails the job
#     (the old script swallowed every error with `|| echo`)
#   * additive only - previous .tgz packages are NEVER deleted (no rm -rf)
#   * bootstrap the archive branch when it does not exist yet
#   * refuse to overwrite an already published version: bump Chart.yaml instead
#
# The Pages site itself is deployed by .github/workflows/chart-release.yml from
# a GitHub Actions Pages artifact, not by pushing a branch.
set -euo pipefail

CHART_DIR="charts/zid"
ARCHIVE_DIR="charts"
ARCHIVE_BRANCH="gh-pages"
PAGES_BASE_URL="${HELM_REPO_URL:-https://zidsa.github.io/helm-chart}"

log() { printf '\n==> %s\n' "$*"; }
fail() {
  printf '\nERROR: %s\n' "$*" >&2
  exit 1
}

command -v helm >/dev/null 2>&1 || fail "helm is not installed"
command -v git >/dev/null 2>&1 || fail "git is not installed"
[ -f "${CHART_DIR}/Chart.yaml" ] || fail "${CHART_DIR}/Chart.yaml not found (run from the repository root)"

# A release must be reproducible from a committed tree.
if [ -n "$(git status --porcelain --untracked-files=no)" ]; then
  fail "git working tree is not clean, aborting"
fi

CHART_META="$(helm show chart "${CHART_DIR}")"
CHART_NAME="$(printf '%s\n' "${CHART_META}" | awk '$1=="name:"{print $2; exit}')"
CHART_VERSION="$(printf '%s\n' "${CHART_META}" | awk '$1=="version:"{print $2; exit}')"
[ -n "${CHART_NAME}" ] || fail "could not read 'name' from ${CHART_DIR}/Chart.yaml"
[ -n "${CHART_VERSION}" ] || fail "could not read 'version' from ${CHART_DIR}/Chart.yaml"

ARCHIVE="${CHART_NAME}-${CHART_VERSION}.tgz"
log "Packaging ${CHART_DIR} as ${CHART_NAME} ${CHART_VERSION}"
helm package "${CHART_DIR}" -d "${ARCHIVE_DIR}"
[ -f "${ARCHIVE_DIR}/${ARCHIVE}" ] || fail "helm package did not produce ${ARCHIVE_DIR}/${ARCHIVE}"

BRANCH_EXISTS=0
if git ls-remote --exit-code --heads origin "${ARCHIVE_BRANCH}" >/dev/null 2>&1; then
  BRANCH_EXISTS=1
  git fetch --quiet origin "${ARCHIVE_BRANCH}"
fi

# ---------------------------------------------------------------------------
# Never overwrite a published version.
# ---------------------------------------------------------------------------
if [ "${BRANCH_EXISTS}" -eq 1 ]; then
  if git cat-file -e "origin/${ARCHIVE_BRANCH}:${ARCHIVE}" 2>/dev/null; then
    fail "version ${CHART_VERSION} is already published as ${ARCHIVE}. Bump 'version' in ${CHART_DIR}/Chart.yaml (and the chartVersion pin in platform-gitops/bootstrap/eks-prod/argocd/applicationset.yaml) instead of overwriting a released version."
  fi
  if git cat-file -e "origin/${ARCHIVE_BRANCH}:index.yaml" 2>/dev/null \
    && git show "origin/${ARCHIVE_BRANCH}:index.yaml" \
      | grep -E "^[[:space:]]+version:[[:space:]]*[\"']?${CHART_VERSION}[\"']?[[:space:]]*$" >/dev/null; then
    fail "index.yaml on ${ARCHIVE_BRANCH} already lists version ${CHART_VERSION}. Bump 'version' in ${CHART_DIR}/Chart.yaml instead of re-releasing it."
  fi
fi

# ---------------------------------------------------------------------------
# Additive commit on the archive branch.
# ---------------------------------------------------------------------------
WORKDIR="$(mktemp -d)"
cleanup() {
  git worktree remove --force "${WORKDIR}" >/dev/null 2>&1 || rm -rf "${WORKDIR}"
  rm -f "${ARCHIVE_DIR}/${ARCHIVE}"
}
trap cleanup EXIT

log "Preparing ${ARCHIVE_BRANCH}"
if [ "${BRANCH_EXISTS}" -eq 1 ]; then
  git worktree add --force --detach "${WORKDIR}" "origin/${ARCHIVE_BRANCH}"
  git -C "${WORKDIR}" checkout -B "${ARCHIVE_BRANCH}"
else
  log "${ARCHIVE_BRANCH} does not exist yet - bootstrapping it"
  git worktree add --force --detach "${WORKDIR}" HEAD
  git -C "${WORKDIR}" checkout --orphan "${ARCHIVE_BRANCH}"
  git -C "${WORKDIR}" rm -rf --quiet . >/dev/null 2>&1 || true
fi

# Copy ONLY the new archive in. Existing packages stay untouched.
cp "${ARCHIVE_DIR}/${ARCHIVE}" "${WORKDIR}/${ARCHIVE}"

log "Regenerating index.yaml from every retained archive"
helm repo index "${WORKDIR}" --url "${PAGES_BASE_URL}"

GIT_AUTHOR_NAME="${GIT_AUTHOR_NAME:-${GITHUB_ACTOR:-helm-chart-release}}"
GIT_AUTHOR_EMAIL="${GIT_AUTHOR_EMAIL:-${GITHUB_ACTOR:-helm-chart-release}@users.noreply.github.com}"

git -C "${WORKDIR}" add -- "${ARCHIVE}" index.yaml
git -C "${WORKDIR}" \
  -c "user.name=${GIT_AUTHOR_NAME}" \
  -c "user.email=${GIT_AUTHOR_EMAIL}" \
  commit -m "Publish ${CHART_NAME} ${CHART_VERSION}"

log "Pushing ${ARCHIVE_BRANCH} (a push failure fails the job)"
git -C "${WORKDIR}" push origin "HEAD:${ARCHIVE_BRANCH}"

log "Published ${CHART_NAME} ${CHART_VERSION}"
printf 'Archive: %s/%s\nIndex:   %s/index.yaml\n' "${PAGES_BASE_URL}" "${ARCHIVE}" "${PAGES_BASE_URL}"
