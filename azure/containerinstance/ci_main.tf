resource "azurerm_container_group" "example" {
  name                = local.name
  location            = var.location
  os_type             = var.os_type
  resource_group_name = var.resource_group_name

  container {
    name   = var.container_name
    image  = var.container_image
    cpu    = var.container_cpu
    memory = var.container_memory
    ports {
      port     = var.container_port
      protocol = var.container_port_protocol
    }
  }
  dns_name_label = var.dns_name_label

  tags = var.tags
}
