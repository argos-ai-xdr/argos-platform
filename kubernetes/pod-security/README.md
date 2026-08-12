# Pod Security Standards

El enforcement vive en las labels del propio namespace (`pod-security.kubernetes.io/enforce: restricted`, ver `../namespaces/`), no en un admission controller aparte — Kubernetes Pod Security Admission es nativo desde 1.25+.

`restricted` implica, entre otros: `runAsNonRoot: true`, sin `privileged`, sin `hostNetwork`/`hostPID`/`hostIPC`, `seccompProfile: RuntimeDefault`, capacidades Linux reducidas a las mínimas. Todo `Deployment`/`Pod` de `helm/` o `kustomize/` debe declarar explícitamente un `securityContext` compatible; si no lo hace, el namespace lo rechaza (no hay modo "warn only" en `laboratory` u `osc`).

## Excepciones

Ninguna excepción a `restricted` se concede sin pasar por `../../governance/exceptions/` de `argos-control` (caducidad obligatoria, aprobador distinto del solicitante).
