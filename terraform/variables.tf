# Root Variables

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "k8s-cluster-rg"
}

variable "ssh_public_key" {
  description = "SSH public key content"
  type        = string
  sensitive   = true
}

variable "location" {
  description = "Azure region for resources"
  type        = string
  default     = "centralindia"
}

variable "admin_username" {
  description = "Admin username for VMs"
  type        = string
  default     = "azureuser"
}

variable "ssh_public_key_path" {
  description = "Path to SSH public key"
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default = {
    Environment = "dev"
    Provisioned = "Terraform"
    Project     = "K8s-Cluster"
  }
}

# VM Definitions
variable "vms" {
  description = "Virtual machine configurations"
  type = map(object({
    name            = string
    size            = string
    image_publisher = string
    image_offer     = string
    image_sku       = string
    image_version   = string
  }))
  default = {
    master = {
      name            = "master-node"
      size            = "Standard_B1s"
      image_publisher = "Canonical"
      image_offer     = "0001-com-ubuntu-server-jammy"
      image_sku       = "22_04-lts"
      image_version   = "latest"
    }
    worker1 = {
      name            = "worker-node-1"
      size            = "Standard_B1s"
      image_publisher = "Canonical"
      image_offer     = "0001-com-ubuntu-server-jammy"
      image_sku       = "22_04-lts"
      image_version   = "latest"
    }
    worker2 = {
      name            = "worker-node-2"
      size            = "Standard_B1s"
      image_publisher = "Canonical"
      image_offer     = "0001-com-ubuntu-server-jammy"
      image_sku       = "22_04-lts"
      image_version   = "latest"
    }
  }
}

# Security Rules
variable "security_rules" {
  description = "Security rules for Network Security Group"
  type = list(object({
    name                       = string
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefixes    = list(string)
    destination_address_prefix = string
  }))
  default = [
    {
      name                       = "SSH"
      priority                   = 1001
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "22"
      source_address_prefixes    = ["0.0.0.0/0"]
      destination_address_prefix = "*"
    },
    {
      name                       = "K8sAPI"
      priority                   = 1002
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "6443"
      source_address_prefixes    = ["0.0.0.0/0"]
      destination_address_prefix = "*"
    }
  ]
}
