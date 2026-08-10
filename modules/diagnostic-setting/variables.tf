variable "name" {
  description = "Name of the Diagnostic Setting"
  type        = string
}

variable "target_resource_id" {
  description = "Azure Resource ID that will send logs"
  type        = string
}

variable "log_analytics_workspace_id" {
  description = "Destination Log Analytics Workspace"
  type        = string
}

variable "log_categories" {
  description = "Diagnostic log categories"
  type        = list(string)
  default     = []
}
variable "metric_categories" {
  description = "Diagnostic metric categories"
  type        = list(string)
  default     = []
}