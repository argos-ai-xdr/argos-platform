# opentofu/

OpenTofu gestiona la infraestructura que está **fuera** del alcance de GitOps/Argo CD: el clúster en sí (o su bootstrap mínimo), el registry de imágenes, DNS y certificados. El estado *dentro* del clúster (namespaces, cargas de trabajo, políticas) se declara en `../kubernetes/`, `../helm/` y `../kustomize/`, y se promueve vía `../argocd/` — no con `tofu apply`.

| Carpeta | Contenido |
| --- | --- |
| `modules/` | Módulos reutilizables entre entornos |
| `environments/local/` | Backend local, clúster equivalente reducido (p. ej. kind/k3d) |
| `environments/laboratory/` | Cyber-range y validación de escenarios |
| `environments/osc/` | Entorno objetivo del cliente (DEP-02); fallback: usar `laboratory` |

Cada entorno es independiente (`tofu init` por carpeta, sin backend compartido salvo que se decida explícitamente). Ver `argos-control/architecture/deployment/environments.md`.
