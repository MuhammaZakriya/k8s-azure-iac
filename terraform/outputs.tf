# Outputs for Azure Kubernetes Infrastructure
# These will be populated in Milestone 3

output "resource_group_name" {
  description = "Name of the resource group"
  value       = var.resource_group_name
}

output "location" {
  description = "Azure region"
  value       = var.location
}

# Future outputs for Milestone 3:
# output "master_vm_public_ip" {
#   value = azurerm_public_ip.master_ip.ip_address
# }
#
# output "worker_vm_public_ips" {
#   value = azurerm_public_ip.worker_ips[*].ip_address
# }