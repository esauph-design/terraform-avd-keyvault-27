data "terraform_remote_state" "avd" {
  backend = "azurerm"

  config = {

    resource_group_name  = "rg-tfstate"
    storage_account_name = "sttfstateesau12345"
    container_name       = "tfstate"

    key = "terraform-avd-hostpool-19.tfstate"
  }
}
data "terraform_remote_state" "fslogix" {
  backend = "azurerm"

  config = {
    resource_group_name  = "rg-tfstate"
    storage_account_name = "sttfstateesau12345"
    container_name       = "tfstate"
    key                  = "terraform-avd-fslogix-23.tfstate"
  }
}
