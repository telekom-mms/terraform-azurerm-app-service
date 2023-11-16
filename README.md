<!-- BEGIN_TF_DOCS -->
# app_service

This module manages the hashicorp/azurerm app service resources.
For more information see https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs > app service

_<-- This file is autogenerated, please do not change. -->_

## Requirements

| Name | Version |
|------|---------|
| terraform | >=1.5 |
| azurerm | >=3.79 |

## Providers

| Name | Version |
|------|---------|
| azurerm | >=3.79 |

## Resources

| Name | Type |
|------|------|
| azurerm_linux_function_app.linux_function_app | resource |
| azurerm_service_plan.service_plan | resource |
| azurerm_static_site.static_site | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| linux_function_app | resource definition, default settings are defined within locals and merged with var settings | `any` | `{}` | no |
| service_plan | resource definition, default settings are defined within locals and merged with var settings | `any` | `{}` | no |
| static_site | resource definition, default settings are defined within locals and merged with var settings | `any` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| linux_function_app | Outputs all attributes of resource_type. |
| service_plan | Outputs all attributes of resource_type. |
| static_site | Outputs all attributes of resource_type. |
| variables | Displays all configurable variables passed by the module. __default__ = predefined values per module. __merged__ = result of merging the default values and custom values passed to the module |

## Examples

Minimal configuration to install the desired resources with the module

```hcl
module "storage" {
  source = "registry.terraform.io/telekom-mms/storage/azurerm"
  storage_account = {
    stmms = {
      location            = "westeurope"
      resource_group_name = "rg-mms-github"
    }
  }
}

module "app_service" {
  source = "registry.terraform.io/telekom-mms/app-service/azurerm"
  service_plan = {
    asp-mms = {
      location            = "westeurope"
      resource_group_name = "rg-mms-github"
      sku_name            = "B1"
    }
  }
  static_site = {
    stapp-mms = {
      location            = "westeurope"
      resource_group_name = "rg-mms-github"
    }
  }
  linux_function_app = {
    func-mms = {
      location             = "westeurope"
      resource_group_name  = "rg-mms-github"
      service_plan_id      = module.app_service.service_plan["asp-mms"].id
      storage_account_name = module.storage.storage_account["stmms"].name
    }
  }
}
```

Advanced configuration to install the desired resources with the module

```hcl
module "app_service" {
  source = "registry.terraform.io/telekom-mms/app-service/azurerm"
  service_plan = {
    asp-mms = {
      location            = "westeurope"
      resource_group_name = "rg-mms-github"
      sku_name            = "B1"
      tags = {
        project     = "mms-github"
        environment = terraform.workspace
        managed-by  = "terraform"
      }
    }
  }
  static_site = {
    stapp-mms = {
      location            = "westeurope"
      resource_group_name = "rg-mms-github"
      identity = {
        type = "SystemAssigned"
      }
      app_settings = {
        NAME = "mms"
      }
      tags = {
        project     = "mms-github"
        environment = terraform.workspace
        managed-by  = "terraform"
      }
    }
  }
  func-mms = {
    location             = "westeurope"
    resource_group_name  = "rg-mms-github"
    service_plan_id      = module.app_service.service_plan["asp-mms"].id
    storage_account_name = module.storage.storage_account["stmms"].name
    site_config = {
      application_stack = {
        node_version = 18
      }
      app_service_logs = {
        retention_period_days = 7
      }
      ip_restriction = {
        mms-local = {
          ip_address = "172.0.0.2/32"
          headers = {
            x_fd_health_probe = [1]
          }
        }
      }
    }
    identity = {
      type = "SystemAssigned"
    }
    tags = {
      project     = "mms-github"
      environment = terraform.workspace
      managed-by  = "terraform"
    }
  }
}
```
<!-- END_TF_DOCS -->