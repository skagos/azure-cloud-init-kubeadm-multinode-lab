resource "azurerm_virtual_network" "cluster" {
  name                = "vnet-kubeadm-${var.name_suffix}"
  location            = azurerm_resource_group.lab.location
  resource_group_name = azurerm_resource_group.lab.name
  address_space       = ["10.50.0.0/16"]
  tags                = local.common_tags
}

