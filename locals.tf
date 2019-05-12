locals {
  helm_chart_name    = "unimarket-helm-teamcity"
  helm_chart_version = "1.0.2"
  helm_chart         = "${local.helm_chart_name}-${local.helm_chart_version}"
  helm_chart_file    = "${path.root}/../helm-charts/${local.helm_chart}.tar.gz"
  host_ip            = "${google_compute_global_address.teamcity.address}"
  hostname           = "${var.dns_zone_name != "" ? format("%s.%s", var.service_name, replace(var.dns_zone_name, "/.$/", "")) : local.host_ip}"
  service_name       = "${helm_release.teamcity.name}-${var.service_name}"
  ingress_host       = "${var.dns_zone_name == "" ? "" : local.hostname}"
}
