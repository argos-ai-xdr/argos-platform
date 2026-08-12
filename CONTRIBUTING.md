# Contribuir a argos-platform

1. Toda historia debe existir como issue `ARG-###` (ver `argos-control/project/backlog/backlog.yaml`) antes de abrir una rama. Primeras historias: ARG-002 (pipeline SBOM/firma/policy de imágenes), ARG-003 (cyber-range base/default-deny/reset/kill switch).
2. Rama de trabajo: `feat/ARG-###-descripcion-corta`, `fix/...`.
3. Pull request obligatorio contra `main`. Sin push directo, force-push ni borrado de `main`.
4. Todo PR debe enlazar la historia `ARG-###`, pasar CI (`reusable-iac-ci`, `reusable-container-build`, `reusable-sbom-sign`) y respetar `CODEOWNERS`.
5. Ningún cambio de infraestructura se aplica manualmente (`kubectl apply`, `tofu apply` ad hoc) contra `laboratory` u `osc`: todo despliegue pasa por Argo CD (GitOps, ADR-015). `local` es la única excepción para desarrollo individual.
6. No incluir secretos, credenciales, PII ni datasets sensibles (ver `SECURITY.md`).

Ver `docs/development.md` para comandos y flujo local.
