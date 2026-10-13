resource "azurerm_lb_rule" "http" {
  name                           = "http"
  loadbalancer_id                = azurerm_lb.cluster.id
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 30080
  frontend_ip_configuration_name = "public"
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.nodes.id]
  probe_id                       = azurerm_lb_probe.http.id
  disable_outbound_snat          = true
}

