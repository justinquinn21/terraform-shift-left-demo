terraform {
  required_providers {
    kubernetes = {
      version = "~> 2.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.7"
    }
    wiz = {
      version = "~> 1.1"
      source  = "tf.app.wiz.io/wizsec/wiz"
    }
  }
}
