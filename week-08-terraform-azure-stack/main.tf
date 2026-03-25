terraform {
  required_version = ">= 1.6.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

variable "subscription_id" {
  description = "Azure subscription ID"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "Central US"
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
  default     = "rg-week8-terraform-lab"
}

variable "vnet_name" {
  description = "Virtual network name"
  type        = string
  default     = "vnet-week8-lab"
}

variable "subnet_name" {
  description = "Subnet name"
  type        = string
  default     = "subnet-app"
}

variable "log_analytics_name" {
  description = "Log Analytics workspace name"
  type        = string
  default     = "law-week8-logs"
}

resource "random_string" "suffix" {
  length  = 6
  upper   = false
  special = false
}

resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_storage_account" "main" {
  name                     = "lawtf${random_string.suffix.result}"
  resource_group_name      = azurerm_resource_group.main.name
  location                 = azurerm_resource_group.main.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "lab"
    week        = "8"
  }
}

resource "azurerm_log_analytics_workspace" "main" {
  name                = var.log_analytics_name
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

resource "azurerm_virtual_network" "main" {
  name                = var.vnet_name
  address_space       = ["10.8.0.0/16"]
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
}

resource "azurerm_subnet" "main" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.8.1.0/24"]
}