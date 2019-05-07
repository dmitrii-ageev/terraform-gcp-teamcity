/*
resource "helm_repository" "this" {
  name = "teamcity"
  url  = "https://github.com/dmitrii-ageev/helm-teamcity-chart.git"
}
*/

resource "helm_release" "teamcity" {
  depends_on = [
    "kubernetes_cluster_role_binding.tiller",
  ]

  name       = "unimarket-teamcity"
  chart      = "https://github.com/dmitrii-ageev/helm-teamcity-chart/archive/0.1.5.tar.gz"
  timeout    = 180

  // Configure a service account
  set {
    name  = "serviceAccount.name"
    value = "${var.teamcity_sa}"
  }

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

  // Enable teamcity backend
  set {
    name  = "ingress.defaultBackend.enabled"
    value = "true"
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

  // Set the ingress class to GCE
  set {
    name  = "ingress.annotations.kubernetes\\.io/ingress\\.class"
    value = "gce"
  }
}
