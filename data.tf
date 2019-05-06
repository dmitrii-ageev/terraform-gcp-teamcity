data "google_dns_managed_zone" "teamcity" {
  name = "${var.dns_managed_zone}"
}

data "kubernetes_service" "teamcity" {
  provider = "kubernetes"

  metadata {
    name = "${local.service_name}"
  }
}
