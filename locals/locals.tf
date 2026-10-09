locals {
  proname = "${var.environment}-${var.project_name}-${var.instances[count.index]}"
}
