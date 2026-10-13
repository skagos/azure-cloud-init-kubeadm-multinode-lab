resource "azurerm_network_interface_backend_address_pool_association" "worker" {
  count                   = var.worker_count
  network_interface_id    = azurerm_network_interface.worker[count.index].id
  ip_configuration_name   = "primary"
  backend_address_pool_id = azurerm_lb_backend_address_pool.nodes.id
}

