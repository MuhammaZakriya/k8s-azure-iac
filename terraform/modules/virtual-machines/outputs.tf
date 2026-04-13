output "vm_ids" {
  description = "Map of VM IDs"
  value = {
    for k, vm in azurerm_linux_virtual_machine.this : k => vm.id
  }
}

output "public_ips" {
  description = "Map of public IP addresses"
  value = {
    for k, ip in azurerm_public_ip.this : k => ip.ip_address
  }
}

output "private_ips" {
  description = "Map of private IP addresses"
  value = {
    for k, nic in azurerm_network_interface.this : k => nic.private_ip_address
  }
}