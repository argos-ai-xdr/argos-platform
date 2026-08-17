# OpenBao

* **Decisión**: ADR-004 — secretos de **corta duración** (tokens, credenciales de conectores). No sustituye a Keycloak (usuarios) ni a SPIRE (workloads).
* **Namespace**: `argos-observability` (ADR-018 — sin namespace `argos-secrets` dedicado, conjunto de 10 namespaces sin ampliar); acceso vía Kubernetes auth method ligado a las ServiceAccounts de `../../kubernetes/service-accounts/`.
* **Instalación**: no tiene chart umbrella en `../../helm/argos-services/` (proyecto OpenBao mantiene su propio chart — evaluar versión en ARG-002/003).

## Regla

Ningún servicio de `argos-core`/`argos-cyber-tools` almacena una credencial estática en `values.yaml`, `ConfigMap` ni variable de entorno versionada: todo secreto se resuelve en tiempo de arranque desde OpenBao con TTL corto y rotación (ver `argos-control/ADR-004` y `SECURITY.md`).

## Pendiente

* Definir políticas OpenBao por servicio (least privilege, un path por dominio).
* Fijar TTL por defecto y proceso de rotación.
* Unseal/auto-unseal para `laboratory`/`osc` (documentar decisión, no dejarlo manual en producción).
