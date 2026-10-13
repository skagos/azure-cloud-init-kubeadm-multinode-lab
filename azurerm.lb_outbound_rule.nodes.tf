resource "azurerm_lb_outbound_rule" "nodes" {
  name                    = "node-internet-egress"
  loadbalancer_id         = azurerm_lb.cluster.id
  protocol                = "All"
  backend_address_pool_id = azurerm_lb_backend_address_pool.nodes.id

  frontend_ip_configuration {
    name = "public"
  }
}

