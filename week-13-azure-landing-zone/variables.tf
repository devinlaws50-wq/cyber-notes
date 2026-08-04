variable "your_name" {
  description = "Your name for resource naming"
  type        = string
}

variable "location" {
  description = "Azure region for deployment"
  type        = string
  default     = "eastus"
}

variable "admin_username" {
  description = "Admin username for the lab VM"
  type        = string
}

variable "ssh_public_key" {
  description = "SSH public key used to access the Linux VM"
  type        = string
}

variable "allowed_ip" {
  description = "Your public IP in CIDR format for SSH access"
  type        = string
}

variable "environment_tag" {
  description = "Environment tag value"
  type        = string
  default     = "lab"
}

variable "owner_tag" {
  description = "Owner tag value"
  type        = string
}