# Terraform Azure Monitor & Log Analytics for Azure Virtual Desktop (Module 26)

Terraform module for deploying centralized monitoring for Azure Virtual Desktop (AVD) using Azure Monitor, Log Analytics Workspace, and reusable Diagnostic Settings.

This module builds on the previous AVD infrastructure modules and configures diagnostic data collection for the AVD control plane and Azure Storage.

---

# Objective

Deploy enterprise monitoring for Azure Virtual Desktop by:

- Creating a centralized Log Analytics Workspace
- Configuring Azure Monitor Diagnostic Settings
- Collecting platform logs from AVD resources
- Collecting storage metrics from the FSLogix Storage Account
- Reusing a generic Terraform module for Diagnostic Settings

---

# Architecture

```
                   Azure Virtual Desktop
                           │
        ┌──────────────────┼──────────────────┐
        │                  │                  │
        ▼                  ▼                  ▼
   Host Pool      Application Group      Workspace
        │                  │                  │
        └──────────────┬───┴──────────────────┘
                       │
                Diagnostic Settings
                       │
                       ▼
          Log Analytics Workspace
                law-avd-prod
                       ▲
                       │
             Azure Storage Account
             (FSLogix Metrics)
```

---

# Resources Created

- Azure Log Analytics Workspace
- Host Pool Diagnostic Settings
- Application Group Diagnostic Settings
- Workspace Diagnostic Settings
- Storage Account Diagnostic Settings

---

# Module Structure

```
terraform-avd-monitoring-26/

│
├── backend.tf
├── main.tf
├── outputs.tf
├── providers.tf
├── remote-state.tf
├── variables.tf
├── terraform.tfvars
│
└── modules/
    └── diagnostic-setting/
        ├── main.tf
        ├── variables.tf
        └── outputs.tf
```

---

# Diagnostic Categories

## Host Pool

Logs

- Checkpoint
- Error
- Management
- Connection
- HostRegistration
- AgentHealthStatus
- NetworkData
- ConnectionGraphicsData
- SessionHostManagement
- AutoscaleEvaluationPooled
- MultiLinkAdd

---

## Application Group

Logs

- Checkpoint
- Error
- Management

---

## Workspace

Logs

- Checkpoint
- Error
- Management
- Feed

---

## Storage Account

Metrics

- Capacity
- Transaction

---

# Terraform Concepts Covered

- Azure Monitor
- Log Analytics Workspace
- Diagnostic Settings
- Dynamic Blocks
- Terraform Modules
- Terraform Remote State
- Terraform State Refactoring
- moved Blocks
- Azure Monitor Metrics
- Azure Monitor Logs

---

# Outputs

| Output | Description |
|----------|------------|
| log_analytics_workspace_id | Log Analytics Workspace Resource ID |
| log_analytics_workspace_name | Log Analytics Workspace Name |

---

# Validation

After deployment verify:

- Log Analytics Workspace exists
- Host Pool Diagnostic Settings
- Application Group Diagnostic Settings
- Workspace Diagnostic Settings
- Storage Account Diagnostic Settings
- Azure Monitor begins collecting diagnostic data

---

# Dependencies

Requires successful completion of:

- Module 19 - Azure Virtual Desktop Host Pool
- Module 23 - Azure Files / FSLogix Storage

---

# Estimated Cost

This module creates:

- Azure Log Analytics Workspace (PerGB2018)

Costs depend on:

- Data ingestion
- Retention period
- Diagnostic log volume

For lab environments, costs are typically very low.

---

