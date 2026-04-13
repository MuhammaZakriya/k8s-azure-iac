# Virtual Machines Module

# Public IPs
resource "azurerm_public_ip" "this" {
  for_each = var.vms

  name                = "${each.value.name}-public-ip"
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = "Static"
  sku                 = "Standard"
  tags                = var.tags
}

# Network Interfaces
resource "azurerm_network_interface" "this" {
  for_each = var.vms

  name                = "${each.value.name}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.this[each.key].id
  }
}

# Virtual Machines
resource "azurerm_linux_virtual_machine" "this" {
  for_each = var.vms

  name                = each.value.name
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = each.value.size
  admin_username      = var.admin_username
  network_interface_ids = [azurerm_network_interface.this[each.key].id]
  tags                = var.tags
  disable_password_authentication = true

  admin_ssh_key {
    username   = var.admin_username
    public_key = var.ssh_public_key_path
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = each.value.image_publisher
    offer     = each.value.image_offer
    sku       = each.value.image_sku
    version   = each.value.image_version
  }
}