# Keycloak

* **Decisión**: ADR-004 (`argos-control/adr/ADR-004-identity-separation.md`) — identidad de **usuarios humanos** (SmartOps, aprobación HITL). Workloads usan SPIRE (`../spire/`), secretos cortos usan OpenBao (`../openbao/`).
* **Admisión**: rotación, audiences y scopes mínimos.
* **Namespace**: `argos-smartops` (consumido también por `argos-mcp`/`argos-policy` para OIDC de aprobadores).
* **Instalación**: chart `bitnami/keycloak` (declarado en `../../helm/argos-services/Chart.yaml`, `keycloak.enabled`).

## Realms y roles esperados (S1)

Roles OIDC deben mapear 1:1 con las siglas RACI de `argos-control/governance/raci/raci.md` (`poa-architecture`, `delivery-lead`, `platform-sre`, `xdr-data`, `cyber-range`, `ai-evaluation`, `soar-mcp`, `smartops`, `soc-approver`, `qa-security-observer`) para que la aprobación HITL (`Approval.role`) y `CODEOWNERS` usen el mismo vocabulario.

## Pendiente

* Fijar versión/digest del chart.
* Definir el realm `argos-ai-xdr` y los clientes OIDC (`argos-smartops`, `argos-mcp-gateway`).
* MFA obligatoria para el rol `soc-approver` (ver contrato `Approval`, AC10).
