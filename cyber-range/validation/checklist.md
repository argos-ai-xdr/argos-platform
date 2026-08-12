# Checklist de validación del cyber-range

Ejecutar tras `bootstrap/bootstrap.sh` o `reset/reset.sh`, y como evidencia de entrada del gate G3 (S4) — ver `argos-control/governance/gates/gates.md`.

- [ ] El namespace `argos-cyber-range` existe con Pod Security Standard `restricted` (ver `../../kubernetes/namespaces/argos-cyber-range.yaml`).
- [ ] `default-deny-all` está presente y es la única `NetworkPolicy` salvo las excepciones declaradas en `../targets/allowlist.yaml`.
- [ ] Un intento de conexión a un destino fuera de la allowlist produce `DENY` (probar al menos un caso negativo, no solo el positivo).
- [ ] `reset/reset.sh` deja el namespace en un estado limpio y reproducible (dos resets consecutivos producen el mismo resultado — ver AC01).
- [ ] `kill-switch/kill-switch.sh` corta el egress y escala a cero en menos de lo que indique el timeout acordado (ARG-003).
- [ ] Ningún target de emulación tiene acceso a activos productivos ni a namespaces fuera de `argos-cyber-range`.
- [ ] La ejecución queda registrada con `run_id` (ver `argos-control/architecture/data-flows/end-to-end-flow.md`).

Evidencia de entrada de G3: baseline hash, network map y authorization record (`argos-control/project/sprint-definitions/S4.md`).
