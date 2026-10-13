resource "azurerm_role_assignment" "control_plane_secrets_officer" {
  scope                = azurerm_key_vault.cluster.id
  role_definition_name = "Key Vault Secrets Officer"
  principal_id         = azurerm_linux_virtual_machine.control_plane.identity[0].principal_id
  principal_type       = "ServicePrincipal"
}

