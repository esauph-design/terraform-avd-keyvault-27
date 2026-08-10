terraform {
  backend "azurerm" {
    resource_group_name  = "rg-tfstate"
    storage_account_name = "sttfstateesau12345"
    container_name       = "tfstate"
    key                  = "terraform-avd-monitoring-26.tfstate"
  }
}