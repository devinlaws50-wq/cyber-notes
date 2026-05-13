variable "location" {
  description = "Azure region for Sentinel resources"
  type        = string
  default     = "centralus"
}

variable "resource_group_name" {
  description = "Existing resource group that contains the Log Analytics workspace"
  type        = string
  default     = "rg-landing-mgmt-devin"
}

variable "log_analytics_workspace_name" {
  description = "Existing Log Analytics workspace to onboard to Microsoft Sentinel"
  type        = string
  default     = "log-landing-devin"
}

variable "tags" {
  description = "Common tags for Week 14 documentation"
  type        = map(string)
  default = {
    env   = "lab"
    owner = "Devin Laws"
    week  = "14"
    lab   = "azure-sentinel-landing-zone"
  }
}