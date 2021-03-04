provider "kubernetes" {
  config_path = "~/.kube/config"
}

resource "kubernetes_ingress" "wordpress_ingress" {
  metadata {
    name = "wordpress-ingress"
  }

  spec {
    backend {
      service_name = "wordpress"
      service_port = 8080
    }
  }
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

resource "helm_release" "wordpress" {
  name       = "wordpress"

  repository = "bitnami"
  chart      = "bitnami/wordpress"

  set {
    name = "service.port"
    value = "8080"
  }

  set {
    name = "service.httpsPort"
    value = "4433"
  }

  set {
    name = "wordpressUsername"
    value = "admin"
  }

  set {
    name = "wordpressPassword"
    value = "admin"
  }
}