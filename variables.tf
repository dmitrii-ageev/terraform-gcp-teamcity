// Kubernetes-related variables
variable "gke_endpoint" {
  description = "Kubernetes cluster endpoint"
  default     = ""
}

variable "gke_token" {
  description = "Kubernetes cluster token"
  default     = ""
}

variable "gke_ca_certificate" {
  description = "Kubernetes cluster CA certificate"
  default     = ""
}

// Service name
variable "service_name" {
  description = "The name of the service to create"
  default     = "teamcity"
}

// Service account name to create
variable "teamcity_sa" {
  description = "The name of the ServiceAccount to create"
  default     = "teamcity-sa"
}

// Ingress connection settings
variable "ingress_enabled" {
  description = "If true, TeamCity Ingress will be created"
  default     = true
}

variable "ingress_host" {
  description = "TeamCity Ingress hostname"
  default     = ""
}

// DNS-related settings
variable "dns_managed_zone" {
  description = "The managed DNS zone name where a record will be added"
  default = ""
}

variable "dns_zone_name" {
  description = "The FQDN of the zone where a record will be added"
  default = ""
}
