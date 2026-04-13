# Root Terraform Configuration
# This file orchestrates all modules

terraform {
  required_version = ">= 1.0"

  backend "azurerm" {}

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

# Module 1: Resource Group
module "resource_group" {
  source = "./modules/resource-group"

  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = var.tags
}

# Module 2: Networking
module "networking" {
  source = "./modules/networking"

  resource_group_name = module.resource_group.name
  location            = module.resource_group.location
  vnet_name           = "${var.resource_group_name}-vnet"
  subnet_name         = "${var.resource_group_name}-subnet"
  nsg_name            = "${var.resource_group_name}-nsg"

  security_rules = var.security_rules
  tags           = var.tags
}

# Module 3: Virtual Machines
module "virtual_machines" {
  source = "./modules/virtual-machines"

  resource_group_name = module.resource_group.name
  location            = module.resource_group.location
  subnet_id           = module.networking.subnet_id
  vms                 = var.vms
  admin_username      = var.admin_username
  ssh_public_key_path = var.ssh_public_key
  tags                = var.tags
}