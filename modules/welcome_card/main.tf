resource "local_file" "welcome_files" {
  for_each = var.file_data

  # This creates files like: cards/dev-Tania-welcome.txt
  filename = "${path.root}/cards/${var.environment}-${var.user_name}-${each.key}"
  content  = "${each.value}\nEnvironment: ${var.environment}\nUser: ${var.user_name}"
}
