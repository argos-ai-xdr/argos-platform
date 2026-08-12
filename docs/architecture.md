# Arquitectura de argos-platform

Este repositorio implementa la infraestructura declarativa de los seis planos definidos en `argos-control/architecture/logical/planos.md`:

| Plano | Responsabilidad de argos-platform |
| --- | --- |
| P1 Edge/telemetría | Despliegue de agents (Falco, Hubble, Wazuh Agent, Kubernetes Audit) en `kube-system` |
| P2-P5 | Provisión de namespaces, identidad, red y almacenamiento base que consumen `argos-core`, `argos-cyber-tools` y `argos-smartops` |
| P6 Evidencia/plataforma | OpenTelemetry, Prometheus/Grafana, OpenSearch + Ceph RGW |

## Entornos

Ver `argos-control/architecture/deployment/environments.md`. `local` y `laboratory` deben ser reproducibles desde cero; `osc` depende de DEP-02 con fallback a `local`/`laboratory`.

## Despliegue

GitOps con Argo CD (ADR-015): ningún cambio se aplica manualmente contra `laboratory` u `osc`. `argocd/` es la única vía de promoción de `helm/` y `kustomize/overlays/`.

## Componentes y ADR asociados

Ver `argos-control/compatibility/components.yaml` para la tabla completa. Resumen: NATS JetStream (ADR-002), Keycloak/SPIRE/OpenBao (ADR-004), OPA/Gatekeeper (ADR-005), OpenSearch/Ceph RGW (ADR-006), MISP (ADR-007), OpenTelemetry/Prometheus/Grafana (ADR-009), toolchain P0 (ADR-010).
