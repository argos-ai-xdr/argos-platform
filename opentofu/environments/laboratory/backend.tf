terraform {
  backend "local" {
    path = "terraform.tfstate"
  }
}

# TODO: migrar a backend remoto (p. ej. OpenSearch/S3-compatible sobre Ceph RGW,
# ver ADR-006) una vez ARG-002 defina dónde vive el state compartido del equipo.
