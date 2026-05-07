resource "local_file" "welcome_files" {
  for_each = var.file_data
  filename = "${path.root}/cards/${var.environment}-${var.user_name}-${each.key}"
  content  = "${each.value}"

  lifecycle {
    # If you try to delete this file via Terraform, it will fail!
    prevent_destroy = true 
  }
}
