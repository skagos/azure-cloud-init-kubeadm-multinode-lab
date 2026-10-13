resource "azurerm_resource_group" "lab" {
  name     = "rg-kubeadm-${var.name_suffix}"
  location = var.location
  tags     = local.common_tags
}

