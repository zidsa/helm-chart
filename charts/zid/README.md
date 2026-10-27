# zid

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.16.0](https://img.shields.io/badge/AppVersion-1.16.0-informational?style=flat-square)

A Helm chart for Kubernetes

**Homepage:** <https://github.com/zidsa/helm-chart>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| DevOps | <devops@zid.sa> |  |

## Source Code

* <https://github.com/zidsa/helm-chart>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
<<<<<<< HEAD
| dnsConfig.dnsConfig.dnsConfig.nameservers[0] | string | `"169.254.20.10"` |  |
| dnsConfig.dnsConfig.dnsConfig.options[0].name | string | `"attempts"` |  |
| dnsConfig.dnsConfig.dnsConfig.options[0].value | string | `"3"` |  |
| dnsConfig.dnsConfig.dnsConfig.options[1].name | string | `"ndots"` |  |
| dnsConfig.dnsConfig.dnsConfig.options[1].value | string | `"5"` |  |
| dnsConfig.dnsConfig.dnsConfig.searches[0] | string | `"prod.svc.cluster.local"` |  |
| dnsConfig.dnsConfig.dnsConfig.searches[1] | string | `"svc.cluster.local"` |  |
| dnsConfig.dnsConfig.dnsConfig.searches[2] | string | `"cluster.local"` |  |
| dnsConfig.dnsConfig.dnsConfig.searches[3] | string | `"eu-west-1.compute.internal"` |  |
| dnsConfig.dnsConfig.dnsPolicy | string | `"None"` |  |
| dnsConfig.enabled | bool | `false` |  |
=======
| dnsConfig.enabled | bool | `false` | Render Pod.spec.dnsPolicy/dnsConfig from the keys below. Only enable when the cluster really serves that nameserver. |
| dnsConfig.nameservers[0] | string | `"169.254.20.10"` |  |
| dnsConfig.options[0].name | string | `"attempts"` |  |
| dnsConfig.options[0].value | string | `"3"` |  |
| dnsConfig.options[1].name | string | `"ndots"` |  |
| dnsConfig.options[1].value | string | `"5"` |  |
| dnsConfig.policy | string | `"None"` | Pod.spec.dnsPolicy |
| dnsConfig.searches[0] | string | `"prod.svc.cluster.local"` |  |
| dnsConfig.searches[1] | string | `"svc.cluster.local"` |  |
| dnsConfig.searches[2] | string | `"cluster.local"` |  |
| dnsConfig.searches[3] | string | `"eu-west-1.compute.internal"` |  |
>>>>>>> f3a64c9 (zid chart v0.2.0: central chart with hardened defaults + Actions-Pages release)
| fullnameOverride | string | `""` |  |
| grpc.affinity | object | `{}` |  |
| grpc.autoscaling.enabled | bool | `false` |  |
| grpc.autoscaling.maxReplicas | int | `100` |  |
| grpc.autoscaling.minReplicas | int | `1` |  |
| grpc.autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
<<<<<<< HEAD
| grpc.create | bool | `false` |  |
| grpc.deploymentLabels | object | `{}` |  |
| grpc.limits.cpu | string | `"100m"` |  |
| grpc.limits.memory | string | `"128Mi"` |  |
=======
| grpc.command[0] | string | `"rr"` |  |
| grpc.command[1] | string | `"serve"` |  |
| grpc.command[2] | string | `"-p"` |  |
| grpc.command[3] | string | `"-w"` |  |
| grpc.command[4] | string | `"/var/www"` |  |
| grpc.command[5] | string | `"-c"` |  |
| grpc.command[6] | string | `".rr.yaml"` |  |
| grpc.create | bool | `false` |  |
| grpc.deploymentLabels | object | `{}` |  |
| grpc.initContainers | list | `[]` |  |
>>>>>>> f3a64c9 (zid chart v0.2.0: central chart with hardened defaults + Actions-Pages release)
| grpc.livenessProbe.failureThreshold | int | `4` |  |
| grpc.livenessProbe.initialDelaySeconds | int | `5` |  |
| grpc.livenessProbe.periodSeconds | int | `10` |  |
| grpc.livenessProbe.successThreshold | int | `1` |  |
| grpc.livenessProbe.tcpSocket.port | int | `50051` |  |
| grpc.nodeSelector | object | `{}` |  |
| grpc.podLabels | object | `{}` |  |
<<<<<<< HEAD
=======
| grpc.podSecurityContext.runAsNonRoot | bool | `true` |  |
| grpc.podSecurityContext.seccompProfile.type | string | `"RuntimeDefault"` |  |
| grpc.preStopCommand[0] | string | `"/bin/sh"` |  |
| grpc.preStopCommand[1] | string | `"-c"` |  |
| grpc.preStopCommand[2] | string | `"rr stop; sleep 6;"` |  |
>>>>>>> f3a64c9 (zid chart v0.2.0: central chart with hardened defaults + Actions-Pages release)
| grpc.readinessProbe.exec.command[0] | string | `"/bin/grpc_health_probe"` |  |
| grpc.readinessProbe.exec.command[1] | string | `"-addr=:50051"` |  |
| grpc.readinessProbe.failureThreshold | int | `5` |  |
| grpc.readinessProbe.initialDelaySeconds | int | `3` |  |
| grpc.readinessProbe.periodSeconds | int | `10` |  |
| grpc.readinessProbe.successThreshold | int | `1` |  |
| grpc.readinessProbe.timeoutSeconds | int | `10` |  |
| grpc.replicaCount | int | `1` |  |
<<<<<<< HEAD
| grpc.requests.cpu | string | `"100m"` |  |
| grpc.requests.memory | string | `"128Mi"` |  |
| grpc.resources | string | `nil` |  |
| grpc.rollingStrategy | string | `"RollingUpdate"` | Specify deployment rolling strategy: https://kubernetes.io/docs/concepts/workloads/controllers/deployment/#strategy |
=======
| grpc.resources.limits.cpu | string | `"1"` |  |
| grpc.resources.limits.memory | string | `"512Mi"` |  |
| grpc.resources.requests.cpu | string | `"100m"` |  |
| grpc.resources.requests.memory | string | `"128Mi"` |  |
| grpc.rollingStrategy | string | `"RollingUpdate"` | Specify deployment rolling strategy: https://kubernetes.io/docs/concepts/workloads/controllers/deployment/#strategy |
| grpc.secretName | string | `""` | Existing Secret loaded via envFrom. Empty = no secretRef. |
| grpc.securityContext.allowPrivilegeEscalation | bool | `false` |  |
| grpc.securityContext.capabilities.drop[0] | string | `"ALL"` |  |
| grpc.securityContext.runAsNonRoot | bool | `true` |  |
>>>>>>> f3a64c9 (zid chart v0.2.0: central chart with hardened defaults + Actions-Pages release)
| grpc.startupProbe | object | `{}` |  |
| grpc.tolerations | list | `[]` |  |
| grpcService.port | int | `50051` |  |
| grpcService.type | string | `"ClusterIP"` |  |
| http.affinity | object | `{}` |  |
| http.autoscaling.enabled | bool | `false` |  |
| http.autoscaling.maxReplicas | int | `100` |  |
| http.autoscaling.minReplicas | int | `1` |  |
| http.autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| http.create | bool | `true` |  |
| http.deploymentLabels | object | `{}` |  |
<<<<<<< HEAD
| http.limits.cpu | string | `"100m"` |  |
| http.limits.memory | string | `"128Mi"` |  |
| http.livenessProbe | object | `{}` |  |
| http.nodeSelector | object | `{}` |  |
| http.podLabels | object | `{}` |  |
| http.readinessProbe | object | `{}` |  |
| http.replicaCount | int | `1` |  |
| http.requests.cpu | string | `"100m"` |  |
| http.requests.memory | string | `"128Mi"` |  |
| http.resources | string | `nil` |  |
| http.rollingStrategy | string | `"RollingUpdate"` | Specify deployment rolling strategy: https://kubernetes.io/docs/concepts/workloads/controllers/deployment/#strategy |
| http.startupProbe | object | `{}` |  |
| http.tolerations | list | `[]` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"nginx"` |  |
=======
| http.initContainers | list | `[]` |  |
| http.livenessProbe | object | `{}` |  |
| http.nodeSelector | object | `{}` |  |
| http.podAnnotations | object | `{}` |  |
| http.podLabels | object | `{}` |  |
| http.podSecurityContext.runAsNonRoot | bool | `true` |  |
| http.podSecurityContext.seccompProfile.type | string | `"RuntimeDefault"` |  |
| http.readinessProbe | object | `{}` |  |
| http.replicaCount | int | `1` |  |
| http.resources.limits.cpu | string | `"1"` |  |
| http.resources.limits.memory | string | `"512Mi"` |  |
| http.resources.requests.cpu | string | `"100m"` |  |
| http.resources.requests.memory | string | `"128Mi"` |  |
| http.rollingStrategy | string | `"RollingUpdate"` | Specify deployment rolling strategy: https://kubernetes.io/docs/concepts/workloads/controllers/deployment/#strategy |
| http.securityContext.allowPrivilegeEscalation | bool | `false` |  |
| http.securityContext.capabilities.drop[0] | string | `"ALL"` |  |
| http.securityContext.readOnlyRootFilesystem | bool | `false` |  |
| http.securityContext.runAsNonRoot | bool | `true` |  |
| http.sidecars | list | `[]` |  |
| http.startupProbe | object | `{}` |  |
| http.tolerations | list | `[]` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"nginxinc/nginx-unprivileged"` |  |
>>>>>>> f3a64c9 (zid chart v0.2.0: central chart with hardened defaults + Actions-Pages release)
| image.tag | string | `""` |  |
| imagePullSecrets | list | `[]` |  |
| ingress.annotations | object | `{}` |  |
| ingress.className | string | `""` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts[0].host | string | `"chart-example.local"` |  |
| ingress.hosts[0].paths[0].path | string | `"/"` |  |
| ingress.hosts[0].paths[0].pathType | string | `"ImplementationSpecific"` |  |
| ingress.tls | list | `[]` |  |
| nameOverride | string | `""` |  |
<<<<<<< HEAD
| podAnnotations | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| securityContext | object | `{}` |  |
| service.port | int | `80` |  |
=======
| service.port | int | `8080` |  |
>>>>>>> f3a64c9 (zid chart v0.2.0: central chart with hardened defaults + Actions-Pages release)
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `false` |  |
| serviceAccount.name | string | `""` |  |
<<<<<<< HEAD
=======
| worker.affinity | object | `{}` |  |
| worker.nodeSelector | object | `{}` |  |
| worker.podSecurityContext.runAsNonRoot | bool | `true` |  |
| worker.podSecurityContext.seccompProfile.type | string | `"RuntimeDefault"` |  |
| worker.secretName | string | `""` | Existing Secret loaded via envFrom for every worker. Empty = no secretRef. |
| worker.securityContext.allowPrivilegeEscalation | bool | `false` |  |
| worker.securityContext.capabilities.drop[0] | string | `"ALL"` |  |
| worker.securityContext.runAsNonRoot | bool | `true` |  |
| worker.tolerations | list | `[]` |  |
| workers | list | `[]` | Opt-in worker Deployments; each entry needs a name. |
>>>>>>> f3a64c9 (zid chart v0.2.0: central chart with hardened defaults + Actions-Pages release)

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
