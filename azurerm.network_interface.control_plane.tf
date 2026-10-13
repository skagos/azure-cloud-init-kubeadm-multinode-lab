resource "azurerm_network_interface" "control_plane" {
  name                = "nic-k8s-control-${var.name_suffix}"
  location            = azurerm_resource_group.lab.location
  resource_group_name = azurerm_resource_group.lab.name
  ip_configuration {
    name                          = "primary"
    subnet_id                     = azurerm_subnet.nodes.id
    private_ip_address_allocation = "Static"
    private_ip_address            = local.control_plane_ip
  }
  tags = local.common_tags
}

