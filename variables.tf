variable "subscription_id" {
  description = "Azure subscription ID"
  type        = string
}
variable "tags" {
  description = "Resource tags"
  type        = map(string)
}
variable "key_vault_name" {
  description = "Key Vault name"
  type        = string
}
variable "sample_secret" {
  description = "Sample secret to be stored in the Key Vault"
  type        = string
}
