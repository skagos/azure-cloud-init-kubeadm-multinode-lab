resource "azurerm_network_interface_nat_rule_association" "ssh" {
  network_interface_id  = azurerm_network_interface.control_plane.id
  ip_configuration_name = "primary"
  nat_rule_id           = azurerm_lb_nat_rule.ssh.id
}

