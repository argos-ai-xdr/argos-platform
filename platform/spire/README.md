# SPIFFE/SPIRE

* **Decisión**: ADR-004 — identidad de **workload** (mTLS entre servicios). Complementa a Keycloak (usuarios) y OpenBao (secretos cortos).
* **Namespace**: server en `argos-observability` (ADR-018 — sin namespace dedicado nuevo, conjunto de 10 namespaces sin ampliar); agente como DaemonSet en cada nodo.
* **Instalación**: no tiene chart umbrella en `../../helm/argos-services/` (proyecto SPIFFE mantiene su propio chart `spiffe/spire` — evaluar en ARG-003 si se consume tal cual o se ajusta vía `../../kustomize/`).

## Qué identifica

Cada Deployment de `argos-core`, `argos-cyber-tools` y `argos-smartops` recibe un SVID (SPIFFE Verifiable Identity Document) por ServiceAccount (ver `../../kubernetes/service-accounts/service-account-template.yaml`), usado para mTLS en las conexiones listadas en `argos-control/architecture/trust-zones/trust-zones.md`.

## Pendiente

* Decidir topología del SPIRE Server (HA para `osc`, single-node para `local`/`laboratory`).
* Definir `trust domain` (`argos-ai-xdr.internal` o equivalente).
* Registration entries por ServiceAccount — automatizar en ARG-003, no crear a mano en `osc`.
