data "azurerm_resource_group" "avd" {
  name = data.terraform_remote_state.avd.outputs.resource_group_name
}
#This Moved block is because we first created the diagnostic setting in the host pool module, but now we are moving it to a separate module for better organization and reusability.
moved {
  from = azurerm_monitor_diagnostic_setting.host_pool
  to   = module.host_pool_diagnostics.azurerm_monitor_diagnostic_setting.diagnostic_setting
}
resource "azurerm_log_analytics_workspace" "log_analytics_workspace" {

  name = var.log_analytics_workspace_name

  # Deploy into the existing AVD Resource Group
  resource_group_name = data.azurerm_resource_group.avd.name
  location            = data.azurerm_resource_group.avd.location

  # Pay-as-you-go pricing
  sku = var.sku

  # Retain logs for 30 days
  retention_in_days = var.retention_in_days

  tags = var.tags
}

module "host_pool_diagnostics" {
  source = "./modules/diagnostic-setting"

  name                       = "diag-hostpool"
  target_resource_id         = data.terraform_remote_state.avd.outputs.host_pool_id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.log_analytics_workspace.id

  log_categories = [
    "Checkpoint",
    "Error",
    "Management",
    "Connection",
    "HostRegistration",
    "AgentHealthStatus",
    "NetworkData",
    "ConnectionGraphicsData",
    "SessionHostManagement",
    "AutoscaleEvaluationPooled",
    "MultiLinkAdd"
  ]
}

module "application_group_diagnostics" {
  source = "./modules/diagnostic-setting"

  name                       = "diag-applicationgroup"
  target_resource_id         = data.terraform_remote_state.avd.outputs.application_group_id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.log_analytics_workspace.id

  log_categories = [
    "Checkpoint",
    "Error",
    "Management",

  ]
}
module "workspace_diagnostics" {
  source = "./modules/diagnostic-setting"

  name                       = "diag-workspace"
  target_resource_id         = data.terraform_remote_state.avd.outputs.workspace_id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.log_analytics_workspace.id

  log_categories = [
    "Checkpoint",
    "Error",
    "Management",
    "Feed",

  ]
}
module "storage_account_diagnostics" {
  source = "./modules/diagnostic-setting"

  name                       = "diag-storageaccount"
  target_resource_id         = data.terraform_remote_state.fslogix.outputs.storage_account_id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.log_analytics_workspace.id

  metric_categories = [
    "Capacity",
    "Transaction",

  ]
}