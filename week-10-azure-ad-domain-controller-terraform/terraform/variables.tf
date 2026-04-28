variable "yourname" {
  description = "Your name — used to make resource names unique."
  type        = string
}

variable "location" {
  description = "Azure region."
  type        = string
  default     = "eastus"
}

variable "admin_password" {
  description = "Local admin password for the VM."
  type        = string
  sensitive   = true
}

variable "dsrm_password" {
  description = "Directory Services Restore Mode password for AD DS."
  type        = string
  sensitive   = true
}

variable "domain_name" {
  description = "Fully qualified domain name (e.g. corp.example.com)."
  type        = string
  default     = "corp.example.com"
}

variable "domain_netbios" {
  description = "NetBIOS name for the domain (max 15 characters)."
  type        = string
  default     = "CORP"
}

variable "tags" {
  description = "Tags to apply to all resources."
  type        = map(string)

  default = {
    project = "ad-lab"
  }
}