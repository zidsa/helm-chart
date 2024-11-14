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
| fullnameOverride | string | `""` |  |
| grpc.affinity | object | `{}` |  |
| grpc.autoscaling.enabled | bool | `false` |  |
| grpc.autoscaling.maxReplicas | int | `100` |  |
| grpc.autoscaling.minReplicas | int | `1` |  |
| grpc.autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| grpc.create | bool | `false` |  |
| grpc.deploymentLabels | object | `{}` |  |
| grpc.limits.cpu | string | `"100m"` |  |
| grpc.limits.memory | string | `"128Mi"` |  |
| grpc.livenessProbe.failureThreshold | int | `4` |  |
| grpc.livenessProbe.initialDelaySeconds | int | `5` |  |
| grpc.livenessProbe.periodSeconds | int | `10` |  |
| grpc.livenessProbe.successThreshold | int | `1` |  |
| grpc.livenessProbe.tcpSocket.port | int | `50051` |  |
| grpc.nodeSelector | object | `{}` |  |
| grpc.podLabels | object | `{}` |  |
| grpc.readinessProbe.exec.command[0] | string | `"/bin/grpc_health_probe"` |  |
| grpc.readinessProbe.exec.command[1] | string | `"-addr=:50051"` |  |
| grpc.readinessProbe.failureThreshold | int | `5` |  |
| grpc.readinessProbe.initialDelaySeconds | int | `3` |  |
| grpc.readinessProbe.periodSeconds | int | `10` |  |
| grpc.readinessProbe.successThreshold | int | `1` |  |
| grpc.readinessProbe.timeoutSeconds | int | `10` |  |
| grpc.replicaCount | int | `1` |  |
| grpc.requests.cpu | string | `"100m"` |  |
| grpc.requests.memory | string | `"128Mi"` |  |
| grpc.resources | string | `nil` |  |
| grpc.rollingStrategy | string | `"RollingUpdate"` | Specify deployment rolling strategy: https://kubernetes.io/docs/concepts/workloads/controllers/deployment/#strategy |
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
| podAnnotations | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| securityContext | object | `{}` |  |
| service.port | int | `80` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `false` |  |
| serviceAccount.name | string | `""` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
