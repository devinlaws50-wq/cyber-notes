variable "location" {
  default = "eastus"
}

variable "resource_group_name" {
  default = "rg-wk17-hub-spoke-devin"
}

variable "admin_username" {
  type    = string
  default = "azureuser"
}

variable "vm_size" {
  type    = string
  default = "Standard_D2s_v3"
}