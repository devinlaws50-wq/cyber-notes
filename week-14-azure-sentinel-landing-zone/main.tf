terraform {
  required_version = ">= 1.5.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

provider "azurerm" {
  features {}
}

data "azurerm_resource_group" "mgmt" {
  name = var.resource_group_name
}

data "azurerm_log_analytics_workspace" "existing" {
  name                = var.log_analytics_workspace_name
  resource_group_name = data.azurerm_resource_group.mgmt.name
}

resource "azurerm_sentinel_log_analytics_workspace_onboarding" "week14" {
  workspace_id = data.azurerm_log_analytics_workspace.existing.id
}