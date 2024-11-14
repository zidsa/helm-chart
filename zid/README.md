# zid

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.16.0](https://img.shields.io/badge/AppVersion-1.16.0-informational?style=flat-square)

A Helm chart for Kubernetes

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| dnsConfig.dnsConfig.dnsConfig.nameservers[0] | string | `"169.254.20.10"` | if you want to use the internal DNS, set this to `169.254.20.10` |
| dnsConfig.dnsConfig.dnsConfig.options[0].name | string | `"attempts"` | |
| dnsConfig.dnsConfig.dnsConfig.options[0].value | string | `"3"` | |
| dnsConfig.dnsConfig.dnsConfig.options[1].name | string | `"ndots"` | |
| dnsConfig.dnsConfig.dnsConfig.options[1].value | string | `"5"` |  |
| dnsConfig.dnsConfig.dnsConfig.searches[0] | string | `"prod.svc.cluster.local"` |  |
| dnsConfig.dnsConfig.dnsConfig.searches[1] | string | `"svc.cluster.local"` |  |
| dnsConfig.dnsConfig.dnsConfig.searches[2] | string | `"cluster.local"` |  |
| dnsConfig.dnsConfig.dnsConfig.searches[3] | string | `"eu-west-1.compute.internal"` |  |
| dnsConfig.dnsConfig.dnsPolicy | string | `"None"` |  |
| dnsConfig.enabled | bool | `false` | if you want to use the internal DNS, set this to `true` |
| fullnameOverride | string | `""` | the full name of the chart |
| grpc.affinity | object | `{}` | the affinity for the grpc service |
| grpc.autoscaling.enabled | bool | `false` | if you want to enable autoscaling for the grpc service, set this to `true` |
| grpc.autoscaling.maxReplicas | int | `100` | the max number of replicas for the grpc service |
| grpc.autoscaling.minReplicas | int | `1` | the min number of replicas for the grpc service |
| grpc.autoscaling.targetCPUUtilizationPercentage | int | `80` | the target CPU utilization percentage for the grpc service |
| grpc.create | bool | `false` | if you want to create the grpc service, set this to `true` |
| grpc.deploymentLabels | object | `{}` | the labels for the grpc service |
| grpc.livenessProbe.failureThreshold | int | `4` | the number of consecutive failures for the liveness probe |
| grpc.livenessProbe.initialDelaySeconds | int | `5` | the initial delay for the liveness probe |
| grpc.livenessProbe.periodSeconds | int | `10` | the period for the liveness probe |
| grpc.livenessProbe.successThreshold | int | `1` | the number of consecutive successes for the liveness probe |
| grpc.livenessProbe.tcpSocket.port. | string | `nil` | the port for the liveness probe |
| grpc.nodeSelector | object | `{}` | the node selector for the grpc service |
| grpc.podLabels | object | `{}` | the pod labels for the grpc service |
| grpc.readinessProbe.exec.command[0] | string | `"/bin/grpc_health_probe"` | the command for the readiness probe |
| grpc.readinessProbe.exec.command[1] | string | `"-addr=:{{ .Values.grpcService.port }}"` | the address for the readiness probe |
| grpc.readinessProbe.failureThreshold | int | `5` | the number of consecutive failures for the readiness probe |
| grpc.readinessProbe.initialDelaySeconds | int | `3` | the initial delay for the readiness probe |
| grpc.readinessProbe.periodSeconds | int | `10` | the period for the readiness probe |
| grpc.readinessProbe.successThreshold | int | `1` | the number of consecutive successes for the readiness probe |
| grpc.readinessProbe.timeoutSeconds | int | `10` | the timeout for the readiness probe |
| grpc.replicaCount | int | `1` | the number of replicas for the grpc service |
| grpc.resources.limits.cpu | string | `"100m"` | the CPU limit for the grpc service |
| grpc.resources.limits.memory | string | `"128Mi"` | the memory limit for the grpc service |
| grpc.resources.requests.cpu | string | `"100m"` | the CPU request for the grpc service |
| grpc.resources.requests.memory | string | `"128Mi"` | the memory request for the grpc service |
| grpc.rollingStrategy | string | `"RollingUpdate"` | the rolling strategy for the grpc service |
| grpc.startupProbe | object | `{}` | the startup probe for the grpc service |
| grpc.tolerations | list | `[]` | the tolerations for the grpc service |
| grpcService.port | int | `50051` | the port for the grpc service |
| grpcService.type | string | `"ClusterIP"` | the type for the grpc service |
| http.affinity | object | `{}` | the affinity for the http service |
| http.autoscaling.enabled | bool | `false` | if you want to enable autoscaling for the http service, set this to `true` |
| http.autoscaling.maxReplicas | int | `100` |  |
| http.autoscaling.minReplicas | int | `1` | the min number of replicas for the http service |
| http.autoscaling.targetCPUUtilizationPercentage | int | `80` | the target CPU utilization percentage for the http service |
| http.create | bool | `true` | if you want to create the http service, set this to `true` |
| http.deploymentLabels | object | `{}` | the labels for the http service |
| http.livenessProbe | object | `{}` |  |
| http.nodeSelector | object | `{}` | the node selector for the http service |
| http.podLabels | object | `{}` | the pod labels for the http service |
| http.readinessProbe | object | `{}` | the readiness probe for the http service |
| http.replicaCount | int | `1` | the number of replicas for the http service |
| http.resources.limits.cpu | string | `"100m"` | the CPU limit for the http service |
| http.resources.limits.memory | string | `"128Mi"` | the memory limit for the http service |
| http.resources.requests.cpu | string | `"100m"` | the CPU request for the http service |
| http.resources.requests.memory | string | `"128Mi"` | the memory request for the http service |
| http.rollingStrategy | string | `"RollingUpdate"` | the rolling strategy for the http service |
| http.startupProbe | object | `{}` | the startup probe for the http service |
| http.tolerations | list | `[]` | the tolerations for the http service |
| image.pullPolicy | string | `"IfNotPresent"` | the pull policy for the image |
| image.repository | string | `"nginx"` | the repository for the image |
| image.tag | string | `""` | the tag for the image |
| imagePullSecrets | list | `[]` | the image pull secrets |
| ingress.annotations | object | `{}` | the annotations for the ingress |
| ingress.className | string | `""` | the class name for the ingress |
| ingress.enabled | bool | `false` | if you want to create the ingress, set this to `true` |
| ingress.hosts[0].host | string | `"chart-example.local"` |  |
| ingress.hosts[0].paths[0].path | string | `"/"` |  |
| ingress.hosts[0].paths[0].pathType | string | `"ImplementationSpecific"` |  |
| ingress.tls | list | `[]` | the TLS for the ingress |
| nameOverride | string | `""` | the name override for the chart |
| podAnnotations | object | `{}` | the pod annotations |
| podSecurityContext | object | `{}` | the pod security context |
| securityContext | object | `{}` | the security context |
| service.port | int | `80` | the port for the service |
| service.type | string | `"ClusterIP"` | the type for the service |
| serviceAccount.annotations | object | `{}` | the annotations for the service account |
| serviceAccount.create | bool | `false` | if you want to create the service account, set this to `true` |
| serviceAccount.name | string | `""` | the name for the service account |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
