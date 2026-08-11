data "terraform_remote_state" "avd" {
  backend = "azurerm"

  config = {

    resource_group_name  = "rg-tfstate"
    storage_account_name = "sttfstateesau12345"
    container_name       = "tfstate"

    key = "terraform-avd-hostpool-19.tfstate"
  }
}
#retrieves information about the currently authenticated Azure identity
data "azurerm_client_config" "current" {}
