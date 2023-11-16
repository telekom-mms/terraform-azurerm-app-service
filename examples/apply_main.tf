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
      app_settings = {
        NAME = "mms"
      }
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
