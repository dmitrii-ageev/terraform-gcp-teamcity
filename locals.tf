locals {
  host_ip          = "${google_compute_global_address.teamcity.address}"
  hostname         = "${var.dns_zone_name != "" ? format("%s.%s", var.service_name, replace(var.dns_zone_name, "/.$/", "")) : local.host_ip}"
  service_name     = "${helm_release.teamcity.name}-${var.service_name}"
  ingress_host     = "${var.dns_zone_name == "" ? "" : local.hostname}"
  cluster_token    = "${var.gke_token}"
  cluster_endpoint = "${var.gke_endpoint}"
  cluster_ca_certificate = "${var.gke_ca_certificate}"
}
