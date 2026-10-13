resource "azurerm_linux_virtual_machine" "control_plane" {
  name                = "k8s-control-${var.name_suffix}"
  computer_name       = "k8s-control"
  location            = azurerm_resource_group.lab.location
  resource_group_name = azurerm_resource_group.lab.name
  size                = var.vm_size
  admin_username      = var.admin_username

  disable_password_authentication = true
  network_interface_ids           = [azurerm_network_interface.control_plane.id]

  admin_ssh_key {
    username   = var.admin_username
    public_key = var.admin_ssh_public_key
  }

  identity {
    type = "SystemAssigned"
  }

  os_disk {
    name                 = "osdisk-k8s-control-${var.name_suffix}"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    disk_size_gb         = 32
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }

  custom_data = base64encode(templatefile("${path.module}/cloud-init/control-plane.yaml.tftpl", {
    admin_username           = var.admin_username
    control_plane_ip         = local.control_plane_ip
    public_ip                = azurerm_public_ip.load_balancer.ip_address
    key_vault_name           = azurerm_key_vault.cluster.name
    kubernetes_minor_version = var.kubernetes_minor_version
  }))

  boot_diagnostics {}
  tags = merge(local.common_tags, { role = "control-plane" })

  depends_on = [
    azurerm_subnet_network_security_group_association.nodes,
    azurerm_lb_outbound_rule.nodes,
    azurerm_network_interface_backend_address_pool_association.control_plane,
    azurerm_network_interface_nat_rule_association.ssh,
    azurerm_network_interface_nat_rule_association.api
  ]
}
