resource "azurerm_lb_nat_rule" "ssh" {
  name                           = "ssh-control-plane"
  resource_group_name            = azurerm_resource_group.lab.name
  loadbalancer_id                = azurerm_lb.cluster.id
  protocol                       = "Tcp"
  frontend_port                  = 22
  backend_port                   = 22
  frontend_ip_configuration_name = "public"
}

