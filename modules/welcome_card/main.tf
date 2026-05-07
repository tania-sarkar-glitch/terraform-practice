resource "local_file" "card" {
  # We use the variables to name the file dynamically
  filename = "${path.module}/../../cards/welcome-${var.user_name}-${var.environment}.txt"
  content  = "Hello ${var.user_name}! Welcome to the ${var.environment} environment managed by Terraform."
}
