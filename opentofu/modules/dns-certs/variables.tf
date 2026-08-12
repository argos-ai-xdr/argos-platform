variable "environment" {
  description = "local | laboratory | osc"
  type        = string
}

variable "base_domain" {
  description = "Dominio base para los servicios de argos-ai-xdr en este entorno"
  type        = string
  default     = "argos.local"
}

# TODO (DEP-02): fijar proveedor DNS/PKI real de OSC en S1. Para local/laboratory,
# usar cert-manager con una CA propia autogestionada (self-signed) por defecto.
