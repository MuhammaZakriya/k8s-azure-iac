# Variables for Azure Kubernetes Infrastructure
# These will be used in Milestone 3

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "k8s-cluster-rg"
}

variable "location" {
  description = "Azure region for resources"
  type        = string
  default     = "East US"
}

variable "vm_size" {
  description = "Size of the VMs"
  type        = string
  default     = "Standard_B1s"
}

variable "admin_username" {
  description = "Admin username for VMs"
  type        = string
  default     = "azureuser"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

# Tags for all resources
variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default = {
    Environment = "dev"
    Provisioned = "Terraform"
    Project     = "K8s-Cluster"
  }
}