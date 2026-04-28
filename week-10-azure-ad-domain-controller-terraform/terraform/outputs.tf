output "public_ip" {
  description = "Public IP — use this to RDP into the domain controller"
  value       = azurerm_public_ip.main.ip_address
}

output "domain_name" {
  description = "Active Directory domain name"
  value       = var.domain_name
}

output "admin_username" {
  description = "Local admin username"
  value       = "adadmin"
}