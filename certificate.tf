resource "google_compute_managed_ssl_certificate" "teamcity" {
  count    = "${var.dns_managed_zone != "" ? 1 : 0}"
  provider = "google-beta"

  name = "teamcity-ssl-certificate"

  managed {
    domains = ["${local.hostname}"]
  }
}
