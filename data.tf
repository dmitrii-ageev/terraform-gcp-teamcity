data "google_container_cluster" "this" {
  count    = "${var.gke_name == "" ? 0 : 1}"
  name     = "${var.gke_name}"
  location = "${var.gke_location}"
}
