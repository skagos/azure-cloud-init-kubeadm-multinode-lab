resource "azurerm_subnet" "nodes" {
  name                 = "snet-kubernetes-nodes"
  resource_group_name  = azurerm_resource_group.lab.name
  virtual_network_name = azurerm_virtual_network.cluster.name
  address_prefixes     = ["10.50.1.0/24"]
}

