// Kubernetes-related variables
// Note: you must provide either cluster name + location OR cluster endpoint + CA certificate + token
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

variable "service_type" {
  description = "The type of the service to use"
  default     = "NodePort"
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
