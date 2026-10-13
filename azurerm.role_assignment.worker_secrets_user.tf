resource "azurerm_role_assignment" "worker_secrets_user" {
  count                = var.worker_count
  scope                = azurerm_key_vault.cluster.id
  role_definition_name = "Key Vault Secrets User"
  principal_id         = azurerm_linux_virtual_machine.worker[count.index].identity[0].principal_id
  principal_type       = "ServicePrincipal"
}

