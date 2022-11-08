module "app_service" {
  source = "registry.terraform.io/T-Systems-MMS/app-service/azurerm"
  service_plan = {
    spl-service-web = {
      location            = "westeurope"
      resource_group_name = "service-env-rg"
      sku_name            = "B1"
      tags = {
        service = "service_name"
      }
    }
  }
  linux_function_app = {
    app-service-web = {
      location                    = "westeurope"
      resource_group_name         = "service-env-rg"
      service_plan_id             = module.app_service.service_plan["spl-service-web"].id
      storage_account_name        = module.storage.storage_account["service"].name
      storage_account_access_key  = module.storage.storage_account["service"].primary_access_key
      functions_extension_version = "~3"
      https_only                  = false
      app_settings = {
        WEBSITE_NODE_DEFAULT_VERSION = "10.14.1"
      }
      site_config = {
        always_on = true
      }
      tags = {
        service = "service_name"
      }
    }
  }
  static_site = {
    swa-service-domain = {
      location            = "westeurope"
      resource_group_name = "rg-service-env"
      tags = {
        service = "service-name"
      }
    }
  }
}
