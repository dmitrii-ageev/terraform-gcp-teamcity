locals {
  hostname         = "${var.dns_zone_name != "" ? format("%s.%s", var.service_name, replace(var.dns_zone_name, "/.$/", "")) : local.ingress_host}"
  service_name     = "${helm_release.teamcity.name}-${var.service_name}"
  ingress_host     = "${var.ingress_host == "" ? "*/*" : var.ingress_host}"
}
