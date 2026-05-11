resource "azurerm_resource_group" "management" {
  name     = "rg-landing-mgmt-${var.your_name}"
  location = var.location

  tags = {
    env   = var.environment_tag
    owner = var.owner_tag
  }
}

resource "azurerm_resource_group" "network" {
  name     = "rg-landing-network-${var.your_name}"
  location = var.location

  tags = {
    env   = var.environment_tag
    owner = var.owner_tag
  }
}

resource "azurerm_resource_group" "workloads" {
  name     = "rg-landing-workloads-${var.your_name}"
  location = var.location

  tags = {
    env   = var.environment_tag
    owner = var.owner_tag
  }
}

resource "azurerm_virtual_network" "landing" {
  name                = "vnet-landing-${var.your_name}"
  location            = azurerm_resource_group.network.location
  resource_group_name = azurerm_resource_group.network.name
  address_space       = ["10.60.0.0/16"]

  tags = {
    env   = var.environment_tag
    owner = var.owner_tag
  }
}

resource "azurerm_subnet" "mgmt" {
  name                 = "snet-mgmt"
  resource_group_name  = azurerm_resource_group.network.name
  virtual_network_name = azurerm_virtual_network.landing.name
  address_prefixes     = ["10.60.1.0/24"]
}

resource "azurerm_subnet" "app" {
  name                 = "snet-app"
  resource_group_name  = azurerm_resource_group.network.name
  virtual_network_name = azurerm_virtual_network.landing.name
  address_prefixes     = ["10.60.2.0/24"]
}

resource "azurerm_network_security_group" "app" {
  name                = "nsg-app-${var.your_name}"
  location            = azurerm_resource_group.network.location
  resource_group_name = azurerm_resource_group.network.name

  security_rule {
    name                       = "allow-ssh-from-home"
    priority                   = 1000
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = var.allowed_ip
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "deny-all-inbound"
    priority                   = 4096
    direction                  = "Inbound"
    access                     = "Deny"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = {
    env   = var.environment_tag
    owner = var.owner_tag
  }
}

resource "azurerm_subnet_network_security_group_association" "app" {
  subnet_id                 = azurerm_subnet.app.id
  network_security_group_id = azurerm_network_security_group.app.id
}