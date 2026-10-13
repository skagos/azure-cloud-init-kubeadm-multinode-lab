resource "azurerm_network_interface" "worker" {
  count               = var.worker_count
  name                = "nic-k8s-worker-${count.index + 1}-${var.name_suffix}"
  location            = azurerm_resource_group.lab.location
  resource_group_name = azurerm_resource_group.lab.name
  ip_configuration {
    name                          = "primary"
    subnet_id                     = azurerm_subnet.nodes.id
    private_ip_address_allocation = "Static"
    private_ip_address            = local.worker_ips[count.index]
  }
  tags = local.common_tags
}

