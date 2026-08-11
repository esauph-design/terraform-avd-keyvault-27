# Terraform Azure Key Vault (Module 27)

Terraform module for deploying an Azure Key Vault with Azure RBAC authorization and secure secret management.

This module introduces Azure Key Vault as the centralized location for storing secrets that will be consumed by future modules, including Managed Identities and GitHub Actions.

---

## Objective

Deploy an enterprise-ready Azure Key Vault by:

- Creating an Azure Key Vault
- Enabling Azure RBAC authorization
- Enabling Soft Delete and Purge Protection
- Assigning Azure RBAC permissions
- Creating and managing secrets with Terraform
- Demonstrating secret versioning

---

## Resources Created

- Azure Key Vault
- Azure RBAC Role Assignment (Key Vault Secrets Officer)
- Sample Secret

---

## Features

- Azure RBAC authorization
- Soft Delete enabled
- Purge Protection enabled
- Public network access (to be secured with Private Endpoints in Module 30)
- Secret versioning
- Terraform data source for reading secrets

---

## Terraform Concepts Covered

- Azure Key Vault
- Azure RBAC
- Terraform Remote State
- Terraform Data Sources
- Sensitive Variables
- Secret Management
- Secret Versioning

---

## Validation

After deployment verify:

- Key Vault is created
- Azure RBAC is enabled
- Purge Protection is enabled
- Soft Delete is enabled
- Sample secret exists
- Secret versioning works after updating the secret value

---

## Outputs

| Output | Description |
|---------|-------------|
| key_vault_name | Azure Key Vault name |
| key_vault_id | Azure Key Vault Resource ID |
| key_vault_uri | Azure Key Vault URI |

---

## Dependencies

- Module 19 – Azure Virtual Desktop
- Module 22 – Azure RBAC

---
