locals {
  hostname         = "${var.dns_managed_zone != "" ? format("%s.%s", var.service_name, replace(data.google_dns_managed_zone.teamcity.dns_name, "/.$/", "")) : var.ingress_host}"
  service_name     = "${helm_release.teamcity.name}-${var.service_name}"
  load_balancer_ip = "${data.kubernetes_service.teamcity.load_balancer_ingress.0.ip}"
}
