# argos-platform

Despliega y opera la plataforma ARGOS AI-XDR en `local`, `laboratory` y `osc` mediante infraestructura y configuración declarativas (OpenTofu, Kubernetes, Helm/Kustomize, Argo CD). No contiene lógica de negocio del XDR — esa vive en `argos-core` y `argos-cyber-tools`.

Parte de la organización [`argos-ai-xdr`](https://github.com/argos-ai-xdr). Arquitectura autoritativa y ADR en [`argos-control`](https://github.com/argos-ai-xdr/argos-control).

## Contenido

| Carpeta | Contenido |
| --- | --- |
| `opentofu/` | Módulos e infraestructura declarativa por entorno (`local`, `laboratory`, `osc`) |
| `kubernetes/` | Namespaces, NetworkPolicy default-deny, RBAC, service accounts, cuotas, Pod Security Standards |
| `argocd/` | Proyectos, aplicaciones y ApplicationSets (GitOps, ADR-015) |
| `helm/` | Charts de plataforma y de servicios |
| `kustomize/` | Base + overlays por entorno |
| `platform/` | NATS, Keycloak, SPIRE, OpenBao, OpenSearch, Ceph RGW, Wazuh, MISP, registry |
| `observability/` | OTel Collector, Prometheus, Grafana, dashboards, alertas (ADR-009) |
| `policies/` | Gatekeeper, verificación de imágenes, baseline de namespace |
| `cyber-range/` | Bootstrap, targets, reset, kill switch y validación del cyber-range aislado (ARG-003) |
| `tests/` | Conformidad, despliegue, seguridad y recuperación |

## Namespaces mínimos

`argos-xdr`, `argos-cti`, `argos-ai`, `argos-policy`, `argos-mcp`, `argos-soar`, `argos-smartops`, `argos-observability`, `argos-evidence`, `argos-cyber-range`. Ver `argos-control/architecture/logical/planos.md`.

## Reglas comunes de la organización

* Rama principal: `main`. Sin rama permanente `develop`.
* Pull request obligatorio; revisión de `CODEOWNERS`; checks de CI obligatorios.
* Prohibido push directo, force-push y borrado de `main`.
* Versionado SemVer; imágenes OCI referenciadas por digest; SBOM CycloneDX/SPDX; firma con Cosign.
* Ningún secreto, evidencia generada o dataset sensible en Git (ADR-016).
* Todo cambio arquitectónico enlaza un ADR (en `argos-control`); todo PR enlaza una historia `ARG-###`.

Ver `docs/development.md` para cómo trabajar en este repositorio.
