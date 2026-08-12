# Ceph RGW

* **Decisión**: ADR-006 — almacenamiento de objetos (payloads nativos, capturas, snapshots, evidencia). Complementa a OpenSearch (índice).
* **Admisión**: cifrado, object lock si aplica y backup probado.
* **Namespace**: `argos-evidence`.
* **Instalación**: fuera del alcance de `../../helm/argos-services/` (Ceph suele desplegarse vía Rook-Ceph o consumirse como servicio gestionado de OSC — decisión pendiente de DEP-02).

## Buckets esperados

| Bucket | Contenido | Retención |
| --- | --- | --- |
| `argos-evidence-artifacts` | Objetos referenciados por `EvidenceManifest.object_ref` | Según `governance/policies` de `argos-control` |
| `argos-cti-snapshots` | Snapshots MISP/ATT&CK/KEV/EPSS/CVE fijados | Versionado, sin sobrescritura |

WORM lógico cuando la capacidad de `osc` lo permita (ADR-006); el agente (LangGraph/vLLM) nunca tiene credenciales de escritura sobre estos buckets — solo `evidence-writer` (`argos-core`).

## Pendiente

* Decidir Rook-Ceph (self-hosted) vs. servicio S3-compatible provisto por OSC.
* Política de cifrado en reposo y en tránsito.
* Prueba de restore documentada (ver `../../tests/recovery/`).
