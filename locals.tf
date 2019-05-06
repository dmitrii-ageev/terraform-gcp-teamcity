locals {
  hostname         = "${var.dns_managed_zone != "" ? format("%s.%s", var.service_name, replace(var.dns_zone_name, "/.$/", "")) : var.ingress_host}"
  service_name     = "${helm_release.teamcity.name}-${var.service_name}"
}
