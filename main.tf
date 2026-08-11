#Reads the resource group
data "azurerm_resource_group" "avd" {
  name = data.terraform_remote_state.avd.outputs.resource_group_name
}
#This Moved block is because we first created the diagnostic setting in the host pool module, but now we are moving it to a separate module for better organization and reusability.

resource "azurerm_key_vault" "key_vault" {
  name = var.key_vault_name

  #Reuse the existing resource group
  resource_group_name = data.azurerm_resource_group.avd.name

  #Deploy to the same location as the resource group
  location = data.azurerm_resource_group.avd.location

  #Azure tenant where the key Vault will be created
  tenant_id = data.azurerm_client_config.current.tenant_id

  #pricing tier of the key vault
  sku_name = "standard"

  #Use Azure rbac
  rbac_authorization_enabled = true

  #protect the key vault from accidental deletion
  soft_delete_retention_days = 90

  #protect the keyvault against purging
  purge_protection_enabled = true

  #Enable public network access to the key vault for now
  # It will be disabled in Module 30 after a Private Endpoint is deployed.
  public_network_access_enabled = true

  tags = var.tags

}

resource "azurerm_role_assignment" "key_vault_secrets_officer" {
  scope                = azurerm_key_vault.key_vault.id
  role_definition_name = "Key Vault Secrets Officer"
  principal_id         = data.azurerm_client_config.current.object_id
}

resource "azurerm_key_vault_secret" "sample_secret" {
  name         = "sample-secret"
  value        = var.sample_secret
  key_vault_id = azurerm_key_vault.key_vault.id

#Depends on the role assignment to ensure that the secret is created after the role assignment is in place
  depends_on = [
    azurerm_role_assignment.key_vault_secrets_officer
  ]
}