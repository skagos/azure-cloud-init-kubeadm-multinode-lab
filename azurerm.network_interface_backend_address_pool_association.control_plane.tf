resource "azurerm_network_interface_backend_address_pool_association" "control_plane" {
  network_interface_id    = azurerm_network_interface.control_plane.id
  ip_configuration_name   = "primary"
  backend_address_pool_id = azurerm_lb_backend_address_pool.nodes.id
}

