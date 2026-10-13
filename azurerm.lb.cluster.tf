resource "azurerm_lb" "cluster" {
  name                = "lb-kubeadm-${var.name_suffix}"
  location            = azurerm_resource_group.lab.location
  resource_group_name = azurerm_resource_group.lab.name
  sku                 = "Standard"

  frontend_ip_configuration {
    name                 = "public"
    public_ip_address_id = azurerm_public_ip.load_balancer.id
  }

  tags = local.common_tags
}

