terraform {
  required_version = ">= 1.1.2"

  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.7.1"
    }
  }
}

resource "kubernetes_stateful_set" "test" {
  metadata {
    name = "test"
  }

  spec {

    template {
      spec {
        container {
          name              = "test"
          image             = "busybox:latest"
        }
      }
    }
  }
}


resource "kubernetes_deployment" "test" {
  metadata {
    name = "test"
  }

  spec {

    template {
      spec {
        container {
          name = "example"
          image = "nginx:1.7.8"
        }
      }
    }
  }
}
