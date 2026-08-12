variable "registry_name" {
  description = "Nombre del registry de imágenes OCI para argos-ai-xdr"
  type        = string
  default     = "argos-registry"
}

variable "environment" {
  description = "local | laboratory | osc"
  type        = string
}

# TODO (ARG-002/DEP-02): fijar el proveedor real de registry (self-hosted
# Harbor/Zot, o el registry gestionado por OSC) una vez decidido en S1.
