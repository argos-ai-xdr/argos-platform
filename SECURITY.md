# Política de seguridad — argos-platform

Ver la política transversal en `argos-control/SECURITY.md`. Específico de este repositorio:

* Todo namespace aplica Pod Security Standards `restricted`, `NetworkPolicy` default-deny, cuotas y service accounts dedicadas (ver `architecture/logical/planos.md` de `argos-control`).
* El namespace `argos-cyber-range` es de máximo aislamiento: egress denegado salvo allowlist versionada (`cyber-range/targets/`). Ver `argos-control/architecture/trust-zones/trust-zones.md`.
* Ninguna imagen se admite sin firma Cosign verificada y SBOM adjunto (`policies/image-verification/`, ADR-013).
* Credenciales de plataforma (NATS, Keycloak, OpenBao) nunca en Git; se gestionan como secretos de corta duración (ADR-004).

## Reporte

Reportar vulnerabilidades o hallazgos vía el issue template `risk.yaml` o `exception.yaml` de `argos-control`, notificando al rol `qa-security-observer`.
