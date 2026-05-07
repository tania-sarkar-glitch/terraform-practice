provider "local" {}

locals {
  environments = {
    "dev"  = "Tania-Developer"
    "test" = "Tania-Tester"
    "prod" = "Tania-Admin"
  }
}

module "app_cluster" {
  source   = "./modules/welcome_card"
  for_each = local.environments # This is the loop!

  environment = each.key    # takes dev, test, prod
  user_name   = each.value  # takes the names
}

# This tells Terraform to go find this file and read its info
data "local_file" "outside_file" {
  filename = "${path.root}/external_secret.txt"
}

# Now we use that data in a new resource
resource "local_file" "copied_secret" {
  filename = "${path.root}/cards/copied_from_data_source.txt"
  content  = "The secret we read was: ${data.local_file.outside_file.content}"
}

locals {
  settings = [
    { name = "PORT", value = "8080" },
    { name = "ENV",  value = "production" },
    { name = "LOG",  value = "debug" }
  ]
}

resource "local_file" "app_config" {
  filename = "${path.root}/app_settings.conf"
  
  # This is the "Dynamic" part. It's like a for-loop inside a resource.
  content = <<EOT
%{ for s in local.settings ~}
SET ${s.name}=${s.value}
%{ endfor ~}
EOT
}
#output "dev_file_location" {
  # Syntax: module.<NAME>.<OUTPUT_NAME>
 # value = module.dev_infrastructure.card_path
#}

#output "prod_file_location" {
  #value = module.prod_infrastructure.card_path
#}
