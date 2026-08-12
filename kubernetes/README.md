# kubernetes/

| Carpeta | Contenido |
| --- | --- |
| [`namespaces/`](namespaces/) | Los 10 namespaces mínimos, cada uno con Pod Security Standard `restricted` |
| [`network-policies/`](network-policies/) | `default-deny` base + regla de cómo añadir excepciones |
| [`rbac/`](rbac/) | Plantilla de `Role`/`RoleBinding` de mínimo privilegio |
| [`service-accounts/`](service-accounts/) | Plantilla de ServiceAccount dedicada por servicio |
| [`quotas/`](quotas/) | `ResourceQuota`/`LimitRange` base |
| [`pod-security/`](pod-security/) | Documentación del enforcement `restricted` y proceso de excepción |

Estos manifiestos son la **base** (namespace, policy, RBAC genérico); el despliegue real de cada servicio (imagen, réplicas, config) vive en `../helm/` y se promueve vía `../argocd/`.
