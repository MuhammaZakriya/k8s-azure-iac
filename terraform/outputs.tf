# Root Outputs

output "resource_group_name" {
  description = "Name of the resource group"
  value       = module.resource_group.name
}

output "location" {
  description = "Azure region"
  value       = module.resource_group.location
}

output "master_public_ip" {
  description = "Public IP of master node"
  value       = module.virtual_machines.public_ips["master"]
}

output "worker1_public_ip" {
  description = "Public IP of worker node 1"
  value       = module.virtual_machines.public_ips["worker1"]
}

output "worker2_public_ip" {
  description = "Public IP of worker node 2"
  value       = module.virtual_machines.public_ips["worker2"]
}

output "all_public_ips" {
  description = "All VM public IPs"
  value       = module.virtual_machines.public_ips
}

output "ssh_master_command" {
  description = "SSH command for master node"
  value       = "ssh ${var.admin_username}@${module.virtual_machines.public_ips["master"]}"
}