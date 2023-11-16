/**
* # app_service
*
* This module manages the hashicorp/azurerm app service resources.
* For more information see https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs > app service
*
*/


resource "azurerm_service_plan" "service_plan" {
  for_each = var.service_plan

  name                         = local.service_plan[each.key].name == "" ? each.key : local.service_plan[each.key].name
  location                     = local.service_plan[each.key].location
  resource_group_name          = local.service_plan[each.key].resource_group_name
  os_type                      = local.service_plan[each.key].os_type
  sku_name                     = local.service_plan[each.key].sku_name
  app_service_environment_id   = local.service_plan[each.key].app_service_environment_id
  maximum_elastic_worker_count = local.service_plan[each.key].maximum_elastic_worker_count
  worker_count                 = local.service_plan[each.key].worker_count
  per_site_scaling_enabled     = local.service_plan[each.key].per_site_scaling_enabled
  zone_balancing_enabled       = local.service_plan[each.key].zone_balancing_enabled
  tags                         = local.service_plan[each.key].tags
}

resource "azurerm_linux_function_app" "linux_function_app" {
  for_each = var.linux_function_app

  name                               = local.linux_function_app[each.key].name == "" ? each.key : local.linux_function_app[each.key].name
  location                           = local.linux_function_app[each.key].location
  resource_group_name                = local.linux_function_app[each.key].resource_group_name
  service_plan_id                    = local.linux_function_app[each.key].service_plan_id
  app_settings                       = local.linux_function_app[each.key].app_settings
  builtin_logging_enabled            = local.linux_function_app[each.key].builtin_logging_enabled
  client_certificate_enabled         = local.linux_function_app[each.key].client_certificate_enabled
  client_certificate_mode            = local.linux_function_app[each.key].client_certificate_mode
  client_certificate_exclusion_paths = local.linux_function_app[each.key].client_certificate_exclusion_paths
  daily_memory_time_quota            = local.linux_function_app[each.key].daily_memory_time_quota
  enabled                            = local.linux_function_app[each.key].enabled
  content_share_force_disabled       = local.linux_function_app[each.key].content_share_force_disabled
  functions_extension_version        = local.linux_function_app[each.key].functions_extension_version
  https_only                         = local.linux_function_app[each.key].https_only
  public_network_access_enabled      = local.linux_function_app[each.key].public_network_access_enabled
  key_vault_reference_identity_id    = local.linux_function_app[each.key].key_vault_reference_identity_id
  storage_account_access_key         = local.linux_function_app[each.key].storage_account_access_key
  storage_account_name               = local.linux_function_app[each.key].storage_account_name
  storage_uses_managed_identity      = local.linux_function_app[each.key].storage_uses_managed_identity
  storage_key_vault_secret_id        = local.linux_function_app[each.key].storage_key_vault_secret_id
  virtual_network_subnet_id          = local.linux_function_app[each.key].virtual_network_subnet_id
  zip_deploy_file                    = local.linux_function_app[each.key].zip_deploy_file

  site_config {
    always_on                                     = local.linux_function_app[each.key].site_config.always_on
    api_definition_url                            = local.linux_function_app[each.key].site_config.api_definition_url
    api_management_api_id                         = local.linux_function_app[each.key].site_config.api_management_api_id
    app_command_line                              = local.linux_function_app[each.key].site_config.app_command_line
    app_scale_limit                               = local.linux_function_app[each.key].site_config.app_scale_limit
    application_insights_connection_string        = local.linux_function_app[each.key].site_config.application_insights_connection_string
    application_insights_key                      = local.linux_function_app[each.key].site_config.application_insights_key
    container_registry_managed_identity_client_id = local.linux_function_app[each.key].site_config.container_registry_managed_identity_client_id
    container_registry_use_managed_identity       = local.linux_function_app[each.key].site_config.container_registry_use_managed_identity
    default_documents                             = local.linux_function_app[each.key].site_config.default_documents
    elastic_instance_minimum                      = local.linux_function_app[each.key].site_config.elastic_instance_minimum
    ftps_state                                    = local.linux_function_app[each.key].site_config.ftps_state
    health_check_path                             = local.linux_function_app[each.key].site_config.health_check_path
    health_check_eviction_time_in_min             = local.linux_function_app[each.key].site_config.health_check_eviction_time_in_min
    http2_enabled                                 = local.linux_function_app[each.key].site_config.http2_enabled
    load_balancing_mode                           = local.linux_function_app[each.key].site_config.load_balancing_mode
    managed_pipeline_mode                         = local.linux_function_app[each.key].site_config.managed_pipeline_mode
    minimum_tls_version                           = local.linux_function_app[each.key].site_config.minimum_tls_version
    pre_warmed_instance_count                     = local.linux_function_app[each.key].site_config.pre_warmed_instance_count
    remote_debugging_enabled                      = local.linux_function_app[each.key].site_config.remote_debugging_enabled
    remote_debugging_version                      = local.linux_function_app[each.key].site_config.remote_debugging_version
    runtime_scale_monitoring_enabled              = local.linux_function_app[each.key].site_config.runtime_scale_monitoring_enabled
    scm_minimum_tls_version                       = local.linux_function_app[each.key].site_config.scm_minimum_tls_version
    scm_use_main_ip_restriction                   = local.linux_function_app[each.key].site_config.scm_use_main_ip_restriction
    use_32_bit_worker                             = local.linux_function_app[each.key].site_config.use_32_bit_worker
    vnet_route_all_enabled                        = local.linux_function_app[each.key].site_config.vnet_route_all_enabled
    websockets_enabled                            = local.linux_function_app[each.key].site_config.websockets_enabled
    worker_count                                  = local.linux_function_app[each.key].site_config.worker_count

    dynamic "application_stack" {
      for_each = local.linux_function_app[each.key].site_config.application_stack == null ? [] : [0]

      content {
        dotnet_version              = local.linux_function_app[each.key].site_config.application_stack.dotnet_version
        use_dotnet_isolated_runtime = local.linux_function_app[each.key].site_config.application_stack.use_dotnet_isolated_runtime
        java_version                = local.linux_function_app[each.key].site_config.application_stack.java_version
        node_version                = local.linux_function_app[each.key].site_config.application_stack.node_version
        python_version              = local.linux_function_app[each.key].site_config.application_stack.python_version
        powershell_core_version     = local.linux_function_app[each.key].site_config.application_stack.powershell_core_version
        use_custom_runtime          = local.linux_function_app[each.key].site_config.application_stack.use_custom_runtime

        dynamic "docker" {
          for_each = local.linux_function_app[each.key].site_config.application_stack.docker

          content {
            registry_url      = local.linux_function_app[each.key].site_config.application_stack.docker[docker.key].registry_url
            image_name        = local.linux_function_app[each.key].site_config.application_stack.docker[docker.key].image_name
            image_tag         = local.linux_function_app[each.key].site_config.application_stack.docker[docker.key].image_tag
            registry_username = local.linux_function_app[each.key].site_config.application_stack.docker[docker.key].registry_username
            registry_password = local.linux_function_app[each.key].site_config.application_stack.docker[docker.key].registry_password
          }
        }
      }
    }

    dynamic "app_service_logs" {
      for_each = length(compact(values(local.linux_function_app[each.key].site_config.app_service_logs))) > 0 ? [0] : []

      content {
        disk_quota_mb         = local.linux_function_app[each.key].site_config.app_service_logs.disk_quota_mb
        retention_period_days = local.linux_function_app[each.key].site_config.app_service_logs.retention_period_days
      }
    }

    dynamic "cors" {
      for_each = length(compact(values(local.linux_function_app[each.key].site_config.cors))) > 0 ? [0] : []

      content {
        allowed_origins     = local.linux_function_app[each.key].site_config.cors.allowed_origins
        support_credentials = local.linux_function_app[each.key].site_config.cors.support_credentials
      }
    }

    dynamic "ip_restriction" {
      for_each = local.linux_function_app[each.key].site_config.ip_restriction

      content {
        name                      = local.linux_function_app[each.key].site_config.ip_restriction[ip_restriction.key].name == "" ? ip_restriction.key : local.linux_function_app[each.key].site_config.application_stack.ip_restriction[ip_restriction.key].name
        action                    = local.linux_function_app[each.key].site_config.ip_restriction[ip_restriction.key].action
        ip_address                = local.linux_function_app[each.key].site_config.ip_restriction[ip_restriction.key].ip_address
        priority                  = local.linux_function_app[each.key].site_config.ip_restriction[ip_restriction.key].priority
        service_tag               = local.linux_function_app[each.key].site_config.ip_restriction[ip_restriction.key].service_tag
        virtual_network_subnet_id = local.linux_function_app[each.key].site_config.ip_restriction[ip_restriction.key].virtual_network_subnet_id

        dynamic "headers" {
          for_each = length(compact(flatten(values(local.linux_function_app[each.key].site_config.ip_restriction[ip_restriction.key].headers)))) > 0 ? [0] : []

          content {
            x_azure_fdid      = local.linux_function_app[each.key].site_config.ip_restriction[ip_restriction.key].headers.x_azure_fdid
            x_fd_health_probe = local.linux_function_app[each.key].site_config.ip_restriction[ip_restriction.key].headers.x_fd_health_probe
            x_forwarded_for   = local.linux_function_app[each.key].site_config.ip_restriction[ip_restriction.key].headers.x_forwarded_for
            x_forwarded_host  = local.linux_function_app[each.key].site_config.ip_restriction[ip_restriction.key].headers.x_forwarded_host
          }
        }
      }
    }

    dynamic "scm_ip_restriction" {
      for_each = local.linux_function_app[each.key].site_config.scm_ip_restriction

      content {
        name                      = local.linux_function_app[each.key].site_config.scm_ip_restriction[scm_ip_restriction.key].name == "" ? scm_ip_restriction.key : local.linux_function_app[each.key].site_config.application_stack.scm_ip_restriction[scm_ip_restriction.key].name
        action                    = local.linux_function_app[each.key].site_config.scm_ip_restriction[scm_ip_restriction.key].action
        ip_address                = local.linux_function_app[each.key].site_config.scm_ip_restriction[scm_ip_restriction.key].ip_address
        priority                  = local.linux_function_app[each.key].site_config.scm_ip_restriction[scm_ip_restriction.key].priority
        service_tag               = local.linux_function_app[each.key].site_config.scm_ip_restriction[scm_ip_restriction.key].service_tag
        virtual_network_subnet_id = local.linux_function_app[each.key].site_config.scm_ip_restriction[scm_ip_restriction.key].virtual_network_subnet_id

        dynamic "headers" {
          for_each = length(compact(flatten(values(local.linux_function_app[each.key].site_config.scm_ip_restriction[scm_ip_restriction.key].headers)))) > 0 ? [0] : []

          content {
            x_azure_fdid      = local.linux_function_app[each.key].site_config.scm_ip_restriction[scm_ip_restriction.key].headers.x_azure_fdid
            x_fd_health_probe = local.linux_function_app[each.key].site_config.scm_ip_restriction[scm_ip_restriction.key].headers.x_fd_health_probe
            x_forwarded_for   = local.linux_function_app[each.key].site_config.scm_ip_restriction[scm_ip_restriction.key].headers.x_forwarded_for
            x_forwarded_host  = local.linux_function_app[each.key].site_config.scm_ip_restriction[scm_ip_restriction.key].headers.x_forwarded_host
          }
        }
      }
    }
  }

  dynamic "auth_settings" {
    for_each = local.linux_function_app[each.key].auth_settings == null ? [] : [0]

    content {
      enabled                        = local.linux_function_app[each.key].auth_settings.enabled
      additional_login_parameters    = local.linux_function_app[each.key].auth_settings.additional_login_parameters
      allowed_external_redirect_urls = local.linux_function_app[each.key].auth_settings.allowed_external_redirect_urls
      default_provider               = local.linux_function_app[each.key].auth_settings.default_provider
      issuer                         = local.linux_function_app[each.key].auth_settings.issuer
      runtime_version                = local.linux_function_app[each.key].auth_settings.runtime_version
      token_refresh_extension_hours  = local.linux_function_app[each.key].auth_settings.token_refresh_extension_hours
      token_store_enabled            = local.linux_function_app[each.key].auth_settings.token_store_enabled
      unauthenticated_client_action  = local.linux_function_app[each.key].auth_settings.unauthenticated_client_action

      dynamic "active_directory" {
        for_each = length(compact(values(local.linux_function_app[each.key].auth_settings.active_directory))) > 0 ? [0] : []

        content {
          client_id                  = local.linux_function_app[each.key].auth_settings.active_directory.client_id
          allowed_audiences          = local.linux_function_app[each.key].auth_settings.active_directory.allowed_audiences
          client_secret              = local.linux_function_app[each.key].auth_settings.active_directory.client_secret
          client_secret_setting_name = local.linux_function_app[each.key].auth_settings.active_directory.client_secret_setting_name
        }
      }

      dynamic "facebook" {
        for_each = length(compact(values(local.linux_function_app[each.key].auth_settings.facebook))) > 0 ? [0] : []

        content {
          app_id                  = local.linux_function_app[each.key].auth_settings.facebook.app_id
          app_secret              = local.linux_function_app[each.key].auth_settings.facebook.app_secret
          app_secret_setting_name = local.linux_function_app[each.key].auth_settings.facebook.app_secret_setting_name
          oauth_scopes            = local.linux_function_app[each.key].auth_settings.facebook.oauth_scopes
        }
      }

      dynamic "github" {
        for_each = length(compact(values(local.linux_function_app[each.key].auth_settings.github))) > 0 ? [0] : []

        content {
          client_id                  = local.linux_function_app[each.key].auth_settings.github.client_id
          client_secret              = local.linux_function_app[each.key].auth_settings.github.client_secret
          client_secret_setting_name = local.linux_function_app[each.key].auth_settings.github.client_secret_setting_name
          oauth_scopes               = local.linux_function_app[each.key].auth_settings.github.oauth_scopes
        }
      }

      dynamic "google" {
        for_each = length(compact(values(local.linux_function_app[each.key].auth_settings.google))) > 0 ? [0] : []

        content {
          client_id                  = local.linux_function_app[each.key].auth_settings.google.client_id
          client_secret              = local.linux_function_app[each.key].auth_settings.google.client_secret
          client_secret_setting_name = local.linux_function_app[each.key].auth_settings.google.client_secret_setting_name
          oauth_scopes               = local.linux_function_app[each.key].auth_settings.google.oauth_scopes
        }
      }

      dynamic "microsoft" {
        for_each = length(compact(values(local.linux_function_app[each.key].auth_settings.microsoft))) > 0 ? [0] : []

        content {
          client_id                  = local.linux_function_app[each.key].auth_settings.microsoft.client_id
          client_secret              = local.linux_function_app[each.key].auth_settings.microsoft.client_secret
          client_secret_setting_name = local.linux_function_app[each.key].auth_settings.microsoft.client_secret_setting_name
          oauth_scopes               = local.linux_function_app[each.key].auth_settings.microsoft.oauth_scopes
        }
      }

      dynamic "twitter" {
        for_each = length(compact(values(local.linux_function_app[each.key].auth_settings.twitter))) > 0 ? [0] : []

        content {
          consumer_key                 = local.linux_function_app[each.key].auth_settings.twitter.consumer_key
          consumer_secret              = local.linux_function_app[each.key].auth_settings.twitter.consumer_secret
          consumer_secret_setting_name = local.linux_function_app[each.key].auth_settings.twitter.consumer_secret_setting_name
        }
      }
    }
  }

  dynamic "auth_settings_v2" {
    for_each = local.linux_function_app[each.key].auth_settings_v2 == null ? [] : [0]

    content {
      auth_enabled                            = local.linux_function_app[each.key].auth_settings_v2.auth_enabled
      runtime_version                         = local.linux_function_app[each.key].auth_settings_v2.runtime_version
      config_file_path                        = local.linux_function_app[each.key].auth_settings_v2.config_file_path
      require_authentication                  = local.linux_function_app[each.key].auth_settings_v2.require_authentication
      unauthenticated_action                  = local.linux_function_app[each.key].auth_settings_v2.unauthenticated_action
      default_provider                        = local.linux_function_app[each.key].auth_settings_v2.default_provider
      excluded_paths                          = local.linux_function_app[each.key].auth_settings_v2.excluded_paths
      require_https                           = local.linux_function_app[each.key].auth_settings_v2.require_https
      http_route_api_prefix                   = local.linux_function_app[each.key].auth_settings_v2.http_route_api_prefix
      forward_proxy_convention                = local.linux_function_app[each.key].auth_settings_v2.forward_proxy_convention
      forward_proxy_custom_host_header_name   = local.linux_function_app[each.key].auth_settings_v2.forward_proxy_custom_host_header_name
      forward_proxy_custom_scheme_header_name = local.linux_function_app[each.key].auth_settings_v2.forward_proxy_custom_scheme_header_name

      dynamic "apple_v2" {
        for_each = length(compact(values(local.linux_function_app[each.key].auth_settings_v2.apple_v2))) > 0 ? [0] : []

        content {
          client_id                  = local.linux_function_app[each.key].auth_settings_v2.apple_v2.client_id
          client_secret_setting_name = local.linux_function_app[each.key].auth_settings_v2.apple_v2.client_secret_setting_name
          login_scopes               = local.linux_function_app[each.key].auth_settings_v2.apple_v2.login_scopes
        }
      }

      dynamic "active_directory_v2" {
        for_each = length(compact(values(local.linux_function_app[each.key].auth_settings_v2.active_directory_v2))) > 0 ? [0] : []

        content {
          client_id                            = local.linux_function_app[each.key].auth_settings_v2.active_directory_v2.client_id
          tenant_auth_endpoint                 = local.linux_function_app[each.key].auth_settings_v2.active_directory_v2.tenant_auth_endpoint
          client_secret_setting_name           = local.linux_function_app[each.key].auth_settings_v2.active_directory_v2.client_secret_setting_name
          client_secret_certificate_thumbprint = local.linux_function_app[each.key].auth_settings_v2.active_directory_v2.client_secret_certificate_thumbprint
          jwt_allowed_groups                   = local.linux_function_app[each.key].auth_settings_v2.active_directory_v2.jwt_allowed_groups
          jwt_allowed_client_applications      = local.linux_function_app[each.key].auth_settings_v2.active_directory_v2.jwt_allowed_client_applications
          www_authentication_disabled          = local.linux_function_app[each.key].auth_settings_v2.active_directory_v2.www_authentication_disabled
          allowed_groups                       = local.linux_function_app[each.key].auth_settings_v2.active_directory_v2.allowed_groups
          allowed_identities                   = local.linux_function_app[each.key].auth_settings_v2.active_directory_v2.allowed_identities
          allowed_applications                 = local.linux_function_app[each.key].auth_settings_v2.active_directory_v2.allowed_applications
          login_parameters                     = local.linux_function_app[each.key].auth_settings_v2.active_directory_v2.login_parameters
          allowed_audiences                    = local.linux_function_app[each.key].auth_settings_v2.active_directory_v2.allowed_audiences
        }
      }

      dynamic "azure_static_web_app_v2" {
        for_each = length(compact(values(local.linux_function_app[each.key].auth_settings_v2.azure_static_web_app_v2))) > 0 ? [0] : []

        content {
          client_id = local.linux_function_app[each.key].auth_settings_v2.azure_static_web_app_v2.client_id
        }
      }

      dynamic "custom_oidc_v2" {
        for_each = length(compact(values(local.linux_function_app[each.key].auth_settings_v2.custom_oidc_v2))) > 0 ? [0] : []

        content {
          name                          = local.linux_function_app[each.key].auth_settings_v2.custom_oidc_v2.name
          client_id                     = local.linux_function_app[each.key].auth_settings_v2.custom_oidc_v2.client_id
          openid_configuration_endpoint = local.linux_function_app[each.key].auth_settings_v2.custom_oidc_v2.openid_configuration_endpoint
          name_claim_type               = local.linux_function_app[each.key].auth_settings_v2.custom_oidc_v2.name_claim_type
          scopes                        = local.linux_function_app[each.key].auth_settings_v2.custom_oidc_v2.scopes
          client_credential_method      = local.linux_function_app[each.key].auth_settings_v2.custom_oidc_v2.client_credential_method
          client_secret_setting_name    = local.linux_function_app[each.key].auth_settings_v2.custom_oidc_v2.client_secret_setting_name
          authorisation_endpoint        = local.linux_function_app[each.key].auth_settings_v2.custom_oidc_v2.authorisation_endpoint
          token_endpoint                = local.linux_function_app[each.key].auth_settings_v2.custom_oidc_v2.token_endpoint
          issuer_endpoint               = local.linux_function_app[each.key].auth_settings_v2.custom_oidc_v2.issuer_endpoint
          certification_uri             = local.linux_function_app[each.key].auth_settings_v2.custom_oidc_v2.certification_uri
        }
      }

      dynamic "facebook_v2" {
        for_each = length(compact(values(local.linux_function_app[each.key].auth_settings_v2.facebook_v2))) > 0 ? [0] : []

        content {
          app_id                  = local.linux_function_app[each.key].auth_settings_v2.facebook_v2.app_id
          app_secret_setting_name = local.linux_function_app[each.key].auth_settings_v2.facebook_v2.app_secret_setting_name
          graph_api_version       = local.linux_function_app[each.key].auth_settings_v2.facebook_v2.graph_api_version
          login_scopes            = local.linux_function_app[each.key].auth_settings_v2.facebook_v2.login_scopes
        }
      }

      dynamic "github_v2" {
        for_each = length(compact(values(local.linux_function_app[each.key].auth_settings_v2.github_v2))) > 0 ? [0] : []

        content {
          client_id                  = local.linux_function_app[each.key].auth_settings_v2.github_v2.client_id
          client_secret_setting_name = local.linux_function_app[each.key].auth_settings_v2.github_v2.client_secret_setting_name
          login_scopes               = local.linux_function_app[each.key].auth_settings_v2.github_v2login_scopes
        }
      }

      dynamic "google_v2" {
        for_each = length(compact(values(local.linux_function_app[each.key].auth_settings_v2.google_v2))) > 0 ? [0] : []

        content {
          client_id                  = local.linux_function_app[each.key].auth_settings_v2.google_v2.client_id
          client_secret_setting_name = local.linux_function_app[each.key].auth_settings_v2.google_v2.client_secret_setting_name
          allowed_audiences          = local.linux_function_app[each.key].auth_settings_v2.google_v2.allowed_audiences
          login_scopes               = local.linux_function_app[each.key].auth_settings_v2.google_v2.login_scopes
        }
      }

      dynamic "microsoft_v2" {
        for_each = length(compact(values(local.linux_function_app[each.key].auth_settings_v2.microsoft_v2))) > 0 ? [0] : []

        content {
          client_id                  = local.linux_function_app[each.key].auth_settings_v2.microsoft_v2.client_id
          client_secret_setting_name = local.linux_function_app[each.key].auth_settings_v2.microsoft_v2.client_secret_setting_name
          allowed_audiences          = local.linux_function_app[each.key].auth_settings_v2.microsoft_v2.allowed_audiences
          login_scopes               = local.linux_function_app[each.key].auth_settings_v2.microsoft_v2.login_scopes
        }
      }

      dynamic "twitter_v2" {
        for_each = length(compact(values(local.linux_function_app[each.key].auth_settings_v2.twitter_v2))) > 0 ? [0] : []

        content {
          consumer_key                 = local.linux_function_app[each.key].auth_settings_v2.twitter_v2.consumer_key
          consumer_secret_setting_name = local.linux_function_app[each.key].auth_settings_v2.twitter_v2.consumer_secret_setting_name
        }
      }

      login {
        logout_endpoint                   = local.linux_function_app[each.key].auth_settings_v2.login.logout_endpoint
        token_store_enabled               = local.linux_function_app[each.key].auth_settings_v2.login.token_store_enabled
        token_refresh_extension_time      = local.linux_function_app[each.key].auth_settings_v2.login.token_refresh_extension_time
        token_store_path                  = local.linux_function_app[each.key].auth_settings_v2.login.token_store_path
        token_store_sas_setting_name      = local.linux_function_app[each.key].auth_settings_v2.login.token_store_sas_setting_name
        preserve_url_fragments_for_logins = local.linux_function_app[each.key].auth_settings_v2.login.preserve_url_fragments_for_logins
        allowed_external_redirect_urls    = local.linux_function_app[each.key].auth_settings_v2.login.allowed_external_redirect_urls
        cookie_expiration_convention      = local.linux_function_app[each.key].auth_settings_v2.login.cookie_expiration_convention
        cookie_expiration_time            = local.linux_function_app[each.key].auth_settings_v2.login.cookie_expiration_time
        validate_nonce                    = local.linux_function_app[each.key].auth_settings_v2.login.validate_nonce
        nonce_expiration_time             = local.linux_function_app[each.key].auth_settings_v2.login.nonce_expiration_time
      }
    }
  }

  dynamic "backup" {
    for_each = local.linux_function_app[each.key].backup == null ? [] : [0]

    content {
      name                = local.linux_function_app[each.key].backup.name
      storage_account_url = local.linux_function_app[each.key].backup.storage_account_url
      enabled             = local.linux_function_app[each.key].backup.enabled

      schedule {
        frequency_interval       = local.linux_function_app[each.key].backup.schedule.frequency_interval
        frequency_unit           = local.linux_function_app[each.key].backup.schedule.frequency_unit
        keep_at_least_one_backup = local.linux_function_app[each.key].backup.schedule.keep_at_least_one_backup
        retention_period_days    = local.linux_function_app[each.key].backup.schedule.retention_period_days
        start_time               = local.linux_function_app[each.key].backup.schedule.start_time
      }
    }
  }

  dynamic "connection_string" {
    for_each = local.linux_function_app[each.key].connection_string

    content {
      name  = local.linux_function_app[each.key].connection_string[connection_string.key].name == "" ? each.key : local.linux_function_app[each.key].connection_string.name
      type  = local.linux_function_app[each.key].connection_string[connection_string.key].type
      value = local.linux_function_app[each.key].connection_string[connection_string.key].value
    }
  }

  dynamic "identity" {
    for_each = length(compact(values(local.linux_function_app[each.key].identity))) > 0 ? [0] : []

    content {
      type         = local.linux_function_app[each.key].identity.type
      identity_ids = local.linux_function_app[each.key].identity.identity_ids
    }
  }

  dynamic "sticky_settings" {
    for_each = length(compact(values(local.linux_function_app[each.key].sticky_settings))) > 0 ? [0] : []

    content {
      app_setting_names       = local.linux_function_app[each.key].sticky_settings.app_setting_names
      connection_string_names = local.linux_function_app[each.key].sticky_settings.connection_string_names
    }
  }

  dynamic "storage_account" {
    for_each = local.linux_function_app[each.key].storage_account

    content {
      name         = local.linux_function_app[each.key].storage_account[storage_account.key].name == "" ? storage_account.key : local.linux_function_app[each.key].storage_account[storage_account.key].name
      access_key   = local.linux_function_app[each.key].storage_account[storage_account.key].access_key
      account_name = local.linux_function_app[each.key].storage_account[storage_account.key].account_name
      share_name   = local.linux_function_app[each.key].storage_account[storage_account.key].share_name
      type         = local.linux_function_app[each.key].storage_account[storage_account.key].type
      mount_path   = local.linux_function_app[each.key].storage_account[storage_account.key].mount_path
    }
  }

  tags = local.linux_function_app[each.key].tags
}

resource "azurerm_static_site" "static_site" {
  for_each = var.static_site

  name                = local.static_site[each.key].name == "" ? each.key : local.static_site[each.key].name
  location            = local.static_site[each.key].location
  resource_group_name = local.static_site[each.key].resource_group_name
  sku_tier            = local.static_site[each.key].sku_tier
  sku_size            = local.static_site[each.key].sku_size
  app_settings        = local.static_site[each.key].app_settings

  dynamic "identity" {
    for_each = length(compact(flatten(values(local.static_site[each.key].identity)))) > 0 ? [0] : []

    content {
      type         = local.static_site[each.key].identity.type
      identity_ids = local.static_site[each.key].identity.identity_ids
    }
  }

  tags = local.static_site[each.key].tags
}
