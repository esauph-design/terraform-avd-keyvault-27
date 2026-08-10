variable "subscription_id" {
  description = "Azure subscription ID"
  type        = string
}

variable "log_analytics_workspace_name" {
  description = "Log Analytics Workspace name"
  type        = string
}

variable "tags" {
  description = "Resource tags"
  type        = map(string)
}
variable "sku" {
  description = "Log Analytics Workspace SKU"
  type        = string
}
variable "retention_in_days" {
  description = "Log Analytics Workspace retention in days"
  type        = number
}