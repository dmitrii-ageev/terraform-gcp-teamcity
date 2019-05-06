resource "google_dns_record_set" "teamcity" {
  count = "${var.dns_managed_zone != "" ? 1 : 0}"

  name = "${var.service_name}.${data.google_dns_managed_zone.teamcity.dns_name}"
  type = "A"
  ttl  = 60

  managed_zone = "${var.dns_managed_zone}"
  rrdatas      = ["${google_compute_global_address.teamcity.address}"]
}
