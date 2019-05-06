data "google_dns_managed_zone" "teamcity" {
  name = "${var.dns_managed_zone}"
}
