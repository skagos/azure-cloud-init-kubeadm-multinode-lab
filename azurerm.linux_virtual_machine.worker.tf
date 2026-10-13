resource "azurerm_linux_virtual_machine" "worker" {
  count               = var.worker_count
  name                = "k8s-worker-${count.index + 1}-${var.name_suffix}"
  computer_name       = "k8s-worker-${count.index + 1}"
  location            = azurerm_resource_group.lab.location
  resource_group_name = azurerm_resource_group.lab.name
  size                = var.vm_size
  admin_username      = var.admin_username

  disable_password_authentication = true
  network_interface_ids           = [azurerm_network_interface.worker[count.index].id]

  admin_ssh_key {
    username   = var.admin_username
    public_key = var.admin_ssh_public_key
  }

  identity {
    type = "SystemAssigned"
  }

  os_disk {
    name                 = "osdisk-k8s-worker-${count.index + 1}-${var.name_suffix}"
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

  custom_data = base64encode(templatefile("${path.module}/cloud-init/worker.yaml.tftpl", {
    admin_username           = var.admin_username
    key_vault_name           = azurerm_key_vault.cluster.name
    kubernetes_minor_version = var.kubernetes_minor_version
  }))

  boot_diagnostics {}
  tags = merge(local.common_tags, { role = "worker" })

  depends_on = [
    azurerm_subnet_network_security_group_association.nodes,
    azurerm_lb_outbound_rule.nodes,
    azurerm_network_interface_backend_address_pool_association.worker
  ]
}
