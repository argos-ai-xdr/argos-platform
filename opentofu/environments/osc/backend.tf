terraform {
  backend "local" {
    path = "terraform.tfstate"
  }
}

# TODO (DEP-02): backend remoto real de OSC, pendiente de confirmación en S1.
