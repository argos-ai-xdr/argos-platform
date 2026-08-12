# Registry de imágenes

* **Decisión**: ADR-013 (`argos-control/adr/ADR-013-oss-dependency-policy.md`) — ninguna imagen se admite sin SBOM, digest y firma Cosign.
* **Namespace**: `argos-observability` o namespace dedicado `argos-registry` (a confirmar en S1); consumido por todos los planos.
* **Relación con OpenTofu**: la interfaz esperada (`registry_url`) se declara en `../../opentofu/modules/registry/` — la implementación real (Harbor/Zot self-hosted vs. registry de OSC) está pendiente de DEP-02.

## Flujo de imágenes

1. CI construye la imagen (`reusable-container-build.yaml` de `argos-control`) y la publica en este registry.
2. `reusable-sbom-sign.yaml` genera el SBOM (CycloneDX) y firma con Cosign (identidad OIDC de GitHub Actions, `argos-ai-xdr/*`).
3. `../../policies/image-verification/cluster-image-policy.yaml` rechaza en el clúster cualquier imagen no firmada por esa identidad.
4. El release manifest de `argos-control` referencia la imagen siempre por digest (`registry/argos/<servicio>@sha256:...`), nunca por tag.

## Pendiente

* Elegir e instalar el registry real (Harbor/Zot vs. gestionado por OSC).
* Configurar retención/garbage collection de imágenes no referenciadas por ninguna release.
