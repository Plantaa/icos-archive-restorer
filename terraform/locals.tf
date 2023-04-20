locals {
  ce_build_name = "${var.ce_project_name}-${formatdate("DDMMYYYYhhmm", timestamp())}"
  output_image  = "us.icr.io/${var.cr_namespace}/${var.image_name}"
}