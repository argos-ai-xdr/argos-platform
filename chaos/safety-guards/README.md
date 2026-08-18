# safety-guards/

No hay lógica de autorización de caos en `argos-platform` — vive en `argos-validation/chaos.ChaosSafetyGuard` (Python, probado, `IMPLEMENTED_LOCALLY_AND_TESTED`), no duplicada aquí. Este archivo documenta el contrato que un orquestador de caos real debería respetar contra la infraestructura de este directorio.

```text
ChaosSafetyGuard.authorize(ChaosExperimentRequest)
        │
        ▼
   allowed == True?
        │
    ┌───┴───┐
   NO      SÍ
    │       │
  DENY   aplicar CR de Chaos Mesh (PodChaos/NetworkChaos/...)
          SOLO dentro de argos-cyber-range
          (impuesto por ../rbac/chaos-target-scope.yaml,
          no por el propio orquestador)
```

Dos capas independientes, a propósito (defensa en profundidad, mismo criterio que `mcp_gateway`+`policies/target_allowlists` en `argos-cyber-tools`): el guard de `argos-validation` decide SI se autoriza; el RBAC de este repositorio limita DÓNDE puede actuar Chaos Mesh incluso si algo se saltara el guard. Ninguna de las dos capas sustituye a la otra.
