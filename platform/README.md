# platform/

Un README (y `values.yaml` cuando aplica) por servicio de plataforma con estado, cada uno referenciando el ADR que lo decidió y su condición de admisión (`argos-control/compatibility/components.yaml`).

| Servicio | ADR | Instalado vía |
| --- | --- | --- |
| [`nats/`](nats/) | ADR-002 | `helm/argos-services` (`nats.enabled`) |
| [`keycloak/`](keycloak/) | ADR-004 | `helm/argos-services` (`keycloak.enabled`) |
| [`spire/`](spire/) | ADR-004 | Chart propio SPIFFE (TODO ARG-003) |
| [`openbao/`](openbao/) | ADR-004 | Chart propio OpenBao (TODO ARG-002/003) |
| [`opensearch/`](opensearch/) | ADR-006 | `helm/argos-services` (`opensearch.enabled`) |
| [`ceph-rgw/`](ceph-rgw/) | ADR-006 | Rook-Ceph o servicio OSC (TODO DEP-02) |
| [`wazuh/`](wazuh/) | ADR-010 | Chart propio Wazuh (TODO ARG-015) |
| [`misp/`](misp/) | ADR-007 | Chart/compose propio MISP (TODO ARG-016) |
| [`registry/`](registry/) | ADR-013 | Harbor/Zot o registry OSC (TODO DEP-02) |

Ninguna versión ni digest está fijada todavía — cada README lista explícitamente qué falta decidir y en qué historia `ARG-###`.
