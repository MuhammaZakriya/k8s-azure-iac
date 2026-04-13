# Terraform configuration for Azure Kubernetes Infrastructure
# Milestone 2: Basic structure with no resources yet

terraform {
  required_version = ">= 1.0"
  
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

# Provider configuration (will be configured via GitHub Actions)
provider "azurerm" {
  features {}
}

# Backend configuration for storing state (to be added later)
# backend "azurerm" {
#   resource_group_name  = "terraform-state-rg"
#   storage_account_name = "terraformstate"
#   container_name       = "tfstate"
#   key                  = "k8s-cluster.tfstate"
# }

# Resource Group - Will be added in Milestone 3
# Virtual Network - Will be added in Milestone 3
# VMs - Will be added in Milestone 3