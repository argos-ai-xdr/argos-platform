# TODO (ARG-002): implementar el provisionamiento real del registry.
# Placeholder intencional: el registry concreto (Harbor/Zot self-hosted vs.
# registry provisto por OSC) depende de DEP-02, no resuelto todavía.
# Este módulo documenta la interfaz esperada (ver outputs.tf) para que
# reusable-container-build.yaml / reusable-sbom-sign.yaml de argos-control
# puedan apuntar a `module.registry.registry_url` sin cambiar el CI cuando
# se resuelva la implementación.

terraform {
  required_version = ">= 1.7.0"
}
