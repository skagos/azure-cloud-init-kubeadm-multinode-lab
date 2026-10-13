resource "azurerm_lb_nat_rule" "api" {
  name                           = "kubernetes-api"
  resource_group_name            = azurerm_resource_group.lab.name
  loadbalancer_id                = azurerm_lb.cluster.id
  protocol                       = "Tcp"
  frontend_port                  = 6443
  backend_port                   = 6443
  frontend_ip_configuration_name = "public"
}

