provider "helm" {
  install_tiller  = true
  tiller_image    = "gcr.io/kubernetes-helm/tiller:v2.11.0"
  service_account = "tiller"

  kubernetes {
    host                   = "${local.cluster_endpoint}"
    token                  = "${local.cluster_token}"
    cluster_ca_certificate = "${local.cluster_ca_certificate}"
  }
}

provider "kubernetes" {
  host                   = "${local.cluster_endpoint}"
  token                  = "${local.cluster_token}"
  cluster_ca_certificate = "${local.cluster_ca_certificate}"
}
