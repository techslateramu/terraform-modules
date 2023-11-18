locals {
  prefix = "ains"
  name   = "${local.prefix}x-${var.environment}-${var.main_project}-${var.sub_project}"
}
