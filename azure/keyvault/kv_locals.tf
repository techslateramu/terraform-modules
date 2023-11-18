locals {
  #pgf - stands for postgresflexserver
  kv_shortcode = "kv"
  kv_name      = "${local.kv_shortcode}-${var.environment}-${var.main_project}-${var.sub_project}"
}
