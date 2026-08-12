# argocd/

GitOps (ADR-015): único mecanismo de despliegue contra `laboratory` y `osc`.

1. `projects/argos-ai-xdr.yaml` — se aplica una vez al bootstrap del clúster (fuera de sync automático).
2. `applications/root-app.yaml` — app-of-apps; también se aplica una vez, manualmente, y a partir de ahí Argo CD se autogestiona.
3. `application-sets/` — generan un `Application` por entorno/servicio; esto es lo que se edita en el día a día.

`local` puede desplegarse sin Argo CD (`tofu`/`kustomize build | kubectl apply` directo) para desarrollo individual; `laboratory` y `osc` no.
