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
