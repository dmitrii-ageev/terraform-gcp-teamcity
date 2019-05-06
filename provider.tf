provider "helm" {
  install_tiller  = true
  tiller_image    = "gcr.io/kubernetes-helm/tiller:v2.11.0"
  service_account = "tiller"

  kubernetes {
    host                   = "${var.gke_endpoint}"
    token                  = "${var.gke_token}"
    cluster_ca_certificate = "${base64decode(var.gke_ca_certificate)}"
  }
}

provider "kubernetes" {
  host                   = "${var.gke_endpoint}"
  token                  = "${var.gke_token}"
  cluster_ca_certificate = "${base64decode(var.gke_ca_certificate)}"
}
