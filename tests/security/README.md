# security

Pruebas de `policies/image-verification/` (una imagen no firmada debe ser rechazada), `policies/gatekeeper/` (un namespace sin las labels obligatorias debe ser rechazado) y del allowlist de `cyber-range/targets/` (un destino fuera de la allowlist debe producir DENY — ver `cyber-range/validation/checklist.md`).
