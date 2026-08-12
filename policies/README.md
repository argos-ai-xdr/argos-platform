# policies/

| Carpeta | Contenido |
| --- | --- |
| [`gatekeeper/`](gatekeeper/) | `ConstraintTemplate` reutilizables (OPA/Rego) |
| [`image-verification/`](image-verification/) | `ClusterImagePolicy` — rechaza imágenes no firmadas por `argos-ai-xdr` (ADR-013) |
| [`namespace-baseline/`](namespace-baseline/) | `Constraint`: todo namespace declara plano (P1-P6) y Pod Security Standard |

Corresponde a ARG-002 (pipeline SBOM, firma, scan de licencia y policy de imágenes) y ADR-005 (OPA/Gatekeeper en el plano de admisión).
