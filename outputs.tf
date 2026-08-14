output "key_vault_name" {
  description = "Azure Key Vault name"
  value       = azurerm_key_vault.key_vault.name
}
output "key_vault_id" {
  description = "Resource ID of the Azure Key Vault."
  value       = azurerm_key_vault.key_vault.id
}