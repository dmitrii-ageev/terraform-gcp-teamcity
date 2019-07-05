provider "helm" {
  version        = "0.9.0"
  install_tiller = false
}

provider "kubernetes" {
  version                = "1.6.0"
  token                  = "${var.gke_token}"
  host                   = "${var.gke_endpoint}"
  cluster_ca_certificate = "${base64decode(var.gke_ca_certificate)}"
}
