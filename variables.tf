variable "subscription_id" {
  type      = string
  sensitive = true
}

variable "tenant_id" {
  type      = string
  sensitive = true
}

variable "name_suffix" {
  description = "Globally unique lowercase suffix, 3-8 characters."
  type        = string
  validation {
    condition     = can(regex("^[a-z0-9]{3,8}$", var.name_suffix))
    error_message = "Use 3-8 lowercase letters or numbers."
  }
}

variable "location" {
  type    = string
  default = "Denmark East"
}

variable "operator_cidr" {
  description = "Your public IPv4 address with /32 for SSH and Kubernetes API access."
  type        = string
}

variable "admin_username" {
  type    = string
  default = "azureadmin"
}

variable "admin_ssh_public_key" {
  type      = string
  sensitive = true
}

variable "vm_size" {
  description = "Two-vCPU Basv2 size; three nodes consume the six-vCPU regional quota."
  type        = string
  default     = "Standard_B2as_v2"
}

variable "worker_count" {
  type    = number
  default = 2
  validation {
    condition     = var.worker_count == 2
    error_message = "This student-quota lab is designed for exactly two workers."
  }
}

variable "kubernetes_minor_version" {
  type    = string
  default = "v1.37"
}

