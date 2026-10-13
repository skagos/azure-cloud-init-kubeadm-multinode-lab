resource "azurerm_public_ip" "load_balancer" {
  name                = "pip-kubeadm-${var.name_suffix}"
  location            = azurerm_resource_group.lab.location
  resource_group_name = azurerm_resource_group.lab.name
  allocation_method   = "Static"
  sku                 = "Standard"
  tags                = local.common_tags
}

