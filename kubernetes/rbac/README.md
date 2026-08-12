# RBAC

Principio: mínimo privilegio por service account, sin roles compartidos entre planos (ver `argos-control/architecture/logical/planos.md`). `role-template.yaml` es el punto de partida para cada nuevo servicio: copiar, renombrar y restringir `resources`/`verbs` a lo estrictamente necesario.

Ningún `Role`/`ClusterRole` de este repositorio otorga `verbs: ["*"]` ni `resources: ["*"]`. Excepciones (p. ej. el ejecutor de `argos-soar` sobre `argos-cyber-range`) requieren justificarse contra ADR-011 (nivel de autonomía L3) y ADR-003 (segregación gateway/ejecutor).
