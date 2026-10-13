resource "azurerm_lb_backend_address_pool" "nodes" {
  name            = "nodes"
  loadbalancer_id = azurerm_lb.cluster.id
}

