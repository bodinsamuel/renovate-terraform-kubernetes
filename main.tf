terraform {
  required_version = ">= 1.1.2"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.5.0"
    }

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
      metadata {
        labels = {
          app = "test"
        }
      }

      spec {
        restart_policy                   = "Always"
        termination_grace_period_seconds = 60

        container {
          name              = "test"
          image             = "busybox:latest"
          image_pull_policy = "IfNotPresent"
          command           = ["chown", "-R", "65534:65534", "/data"]
        }
      }
    }
  }
}

