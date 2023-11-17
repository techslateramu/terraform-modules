locals {
  prefix  = "st"
  name = "${local.prefix}-${var.environment}-${var.main_project}-${var.sub_project}"
}