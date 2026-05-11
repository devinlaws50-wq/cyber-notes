resource "azurerm_public_ip" "app" {
  name                = "pip-app-${var.your_name}"
  location            = azurerm_resource_group.workloads.location
  resource_group_name = azurerm_resource_group.workloads.name
  allocation_method   = "Static"
  sku                 = "Standard"

  tags = {
    env   = var.environment_tag
    owner = var.owner_tag
  }
}

resource "azurerm_network_interface" "app" {
  name                = "nic-app-${var.your_name}"
  location            = azurerm_resource_group.workloads.location
  resource_group_name = azurerm_resource_group.workloads.name

  ip_configuration {
    name                          = "ipconfig-app"
    subnet_id                     = azurerm_subnet.app.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.app.id
  }

  tags = {
    env   = var.environment_tag
    owner = var.owner_tag
  }
}

resource "azurerm_linux_virtual_machine" "app" {
  name                = "vm-app-${var.your_name}"
  location            = azurerm_resource_group.workloads.location
  resource_group_name = azurerm_resource_group.workloads.name
  size                = "Standard_D2s_v3"

  admin_username = var.admin_username
  admin_password = var.admin_password

  disable_password_authentication = false

  network_interface_ids = [
    azurerm_network_interface.app.id
  ]

  os_disk {
    name                 = "osdisk-app-${var.your_name}"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }

  tags = {
    env   = var.environment_tag
    owner = var.owner_tag
  }
}