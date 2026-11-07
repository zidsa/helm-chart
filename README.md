# helm-chart

The **central `zid` Helm chart** used by every zid service. Public repo, published as a Helm repository at `https://zidsa.github.io/helm-chart`.

## Role in the platform

One generic chart renders Deployment / Service / Ingress / HPA / worker workloads from values. No service-specific config or secrets live here — those come from `zidsa/gitops` values + Secrets Manager.

## What the chart provides

- `http`, `grpc`, and `worker` workloads (replicas, resources, probes, securityContext — non-root + drop-all-capabilities by default).
- Secret injection: `http.secretName` renders an `envFrom` from an existing K8s Secret (synced by ESO). Empty = no `envFrom`.
- Plain env vars: `http.env` — a list of `{name, value}` (or `{name, valueFrom}`).
- Ingress with **shared-ALB defaults baked in** (scheme `internet-facing`, `group.name: testing`, `load-balancer-name: zid-platform-testing`, wildcard `*.zid.dev` cert, `pathType: Prefix`) — a service only sets `enabled: true` + `host`.

## How to publish a new version

1. Bump `charts/zid/Chart.yaml` `version`.
2. Merge to `main` → GitHub Actions Pages republishes the gh-pages Helm repo (`index.yaml` + `.tgz`).
3. Bump `chartVersion` in `platform-gitops` so Argo CD resolves the new chart.

## Contributing

- Generic templates only — no service names, no secrets, no account-specific values.
- Run `helm lint charts/zid` and `helm template` before pushing (a real render catches bad defaults).
- The template files contain Go templates — edit them with a plain editor; a strict YAML linter rejects `{{ ... }}` at column 0.
- A catch-all ingress route must use `pathType: Prefix` + `path: /` (never `ImplementationSpecific`), or the ALB only matches the root and every other path 404s.
