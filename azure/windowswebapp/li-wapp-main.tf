resource "azurerm_windows_web_app" "windows_web_app" {
  name                = local.name
  location            = var.location
  resource_group_name = var.resource_group_name
  service_plan_id     = var.service_plan_id
  app_settings        = var.app_settings
  tags                = var.tags

  dynamic "connection_string" {
    for_each = var.connection_string != null ? var.connection_string : []
    content {
      name  = try(connection_string.value.name, null)
      type  = try(connection_string.value.type, null)
      value = try(connection_string.value.value, null)
    }
  }

  dynamic "identity" {
    for_each = var.identity != null ? var.identity : []
    content {
      type         = identity.value.type
      identity_ids = try(identity.value.identity_ids, [])
    }
  }

  dynamic "site_config" {
    for_each = var.site_config != null ? var.site_config : []
    content {
      always_on             = try(site_config.value.linux_webapp_always_on, false)
      api_definition_url    = try(site_config.value.api_definition_url, null)
      api_management_api_id = try(site_config.value.api_management_api_id, null)
      app_command_line      = try(site_config.value.app_command_line, null)

      dynamic "application_stack" {
        for_each = site_config.value.application_stack != null ? site_config.value.application_stack : []
        content {
          current_stack             = try(application_stack.value.current_stack, "dotnetcore") # valid values : dotnet, node, python, php, java
          # docker_container_name     = try(application_stack.value.docker_container_name, "")
          # docker_container_registry = try(application_stack.value.docker_container_registry, "")
          # docker_container_tag      = try(application_stack.value.docker_container_tag, "")
          dotnet_version            = try(application_stack.value.docker_container_tag, "v6.0") # only if current_stack is set to dotnet  - 
        }
      }

      auto_heal_enabled = try(site_config.value.auto_heal_enabled, false)

      #todo
      # dynamic "auto_heal_setting" {
      #   for_each = site_config.value.auto_heal_setting != null ? site_config.value.auto_heal_setting : []
      #   content {

      #   }
      # }

      container_registry_managed_identity_client_id = try(site_config.value.container_registry_managed_identity_client_id, null)
      container_registry_use_managed_identity       = try(site_config.value.container_registry_use_managed_identity, null)

      dynamic "cors" {
        for_each = site_config.value.cors != null ? site_config.value.cors : []
        content {
          allowed_origins     = cors.value.allowed_origins # Required
          support_credentials = try(cors.support_credentials, false)
        }
      }

      default_documents = try(site_config.value.default_documents, [])
      ftps_state        = try(site_config.value.ftps_state, "AllAllowed")
      health_check_path = try(site_config.value.health_check_path, null)
      http2_enabled     = try(site_config.value.http2_enabled, false)

      # ip_restriction {
      #   ip_address  = "0.0.0.0/0"
      #   name = "Deny All"
      #   action = "Deny"
      #   priority = 1000
      # }

      dynamic "ip_restriction" {
        for_each = site_config.value.ip_restriction != null ? site_config.value.ip_restriction : []
        content {
          ip_address                = try(ip_restriction.value.ip_address, null)
          service_tag               = try(ip_restriction.value.service_tag, null)
          virtual_network_subnet_id = try(ip_restriction.value.virtual_network_subnet_id, null)
          name                      = try(ip_restriction.value.name, null)
          priority                  = try(ip_restriction.value.priority, 65000)
          action                    = try(ip_restriction.value.action, "Allow")
          dynamic "headers" {
            for_each = ip_restriction.value.headers != null ? ip_restriction.value.headers : []
            content {
              x_azure_fdid      = try(headers.value.x_azure_fdid, [])
              x_fd_health_probe = try(headers.value.x_fd_health_probe, [])
              x_forwarded_for   = try(headers.value.x_forwarded_for, [])
              x_forwarded_host  = try(headers.value.x_forwarded_host, [])
            }
          }
        }
      }

      load_balancing_mode      = try(site_config.value.load_balancing_mode, "LeastRequests")
      local_mysql_enabled      = try(site_config.value.local_mysql_enabled, false)
      managed_pipeline_mode    = try(site_config.value.local_mysql_enabled, "Classic")
      minimum_tls_version      = try(site_config.value.minimum_tls_version)
      remote_debugging_enabled = try(site_config.value.remote_debugging_enabled)
      remote_debugging_version = try(site_config.value.remote_debugging_version)

      dynamic "scm_ip_restriction" {
        for_each = site_config.value.scm_ip_restriction != null ? site_config.value.scm_ip_restriction : []
        content {
          ip_address                = try(scm_ip_restriction.value.ip_address, null)
          service_tag               = try(scm_ip_restriction.value.service_tag, null)
          virtual_network_subnet_id = try(scm_ip_restriction.value.virtual_network_subnet_id, null)
          name                      = try(scm_ip_restriction.value.name, null)
          priority                  = try(scm_ip_restriction.value.priority, 65000)
          action                    = try(scm_ip_restriction.value.action, "Allow")
          dynamic "headers" {
            for_each = scm_ip_restriction.value.headers != null ? scm_ip_restriction.value.headers : []
            content {
              x_azure_fdid      = try(headers.value.x_azure_fdid, [])
              x_fd_health_probe = try(headers.value.x_fd_health_probe, [])
              x_forwarded_for   = try(headers.value.x_forwarded_for, [])
              x_forwarded_host  = try(headers.value.x_forwarded_host, [])
            }
          }
        }
      }

      scm_minimum_tls_version     = try(site_config.value.scm_use_main_ip_restriction, "1.2")
      scm_use_main_ip_restriction = try(site_config.value.scm_use_main_ip_restriction, false)
      use_32_bit_worker           = try(site_config.value.use_32_bit_worker, true)
      vnet_route_all_enabled      = try(site_config.value.vnet_route_all_enabled, false)
      websockets_enabled          = try(site_config.value.websockets_enabled, false)

      #todo
      #slowrequest 
      #statuscode 
      #stickysettings 
      #storageaccount
      #trigger
      #twitter



    }
  }

}