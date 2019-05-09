resource "helm_release" "teamcity" {
  depends_on = [
    "kubernetes_cluster_role_binding.tiller",
  ]

  name       = "unimarket-teamcity"
  chart      = "https://github.com/Unimarket/unimarket-helm-teamcity/archive/1.0.1.tar.gz"
  timeout    = 300

  // Enable Ingress connections
  set {
    name  = "ingress.enabled"
    value = "${var.ingress_enabled}"
  }

  // Set the ingress hostname
  set {
    name  = "ingress.hosts[0]"
    value = "${local.ingress_host}"
  }

  // TeamCity service type
  set {
    name = "service.type"
    value = "${var.service_type}"
  }

  // Configure Ingress Annotations
  set {
    name  = "ingress.annotations.ingress\\.gcp\\.kubernetes\\.io/pre-shared-cert"
    value = "${var.dns_managed_zone != "" ? "teamcity-ssl-certificate" : "" }"
  }

  // Set the name of a TLS certificate to use
  set {
    name  = "ingress.annotations.ingress\\.kubernetes\\.io/ssl-cert"
    value = "${var.dns_managed_zone != "" ? "teamcity-ssl-certificate" : "" }"
  }

  // Set the public IP address
  set {
    name  = "ingress.annotations.kubernetes\\.io/ingress\\.global-static-ip-name"
    value = "teamcity"
  }

  // Disable HTTP access in favour of HTTPS
  set {
    name  = "ingress.annotations.kubernetes\\.io/ingress\\.allow-http"
    value = "${var.dns_managed_zone != "" ? false : true }"
  }
}
