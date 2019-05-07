locals {
  hostname         = "${var.dns_zone_name != "" ? format("%s.%s", var.service_name, replace(var.dns_zone_name, "/.$/", "")) : local.ingress_host}"
  service_name     = "${helm_release.teamcity.name}-${var.service_name}"
  ingress_host     = "${var.ingress_host == "" ? google_compute_global_address.teamcity.address : var.ingress_host}"
}
