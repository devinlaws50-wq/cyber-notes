output "resource_group_name" {
  value = data.azurerm_resource_group.mgmt.name
}

output "log_analytics_workspace_name" {
  value = data.azurerm_log_analytics_workspace.existing.name
}

output "log_analytics_workspace_id" {
  value = data.azurerm_log_analytics_workspace.existing.id
}

output "sentinel_onboarding_id" {
  value = azurerm_sentinel_log_analytics_workspace_onboarding.week14.id
}