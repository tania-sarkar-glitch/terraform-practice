provider "local" {}

# Call for DEV
module "dev_infrastructure" {
  source      = "./modules/welcome_card"
  user_name   = "Tania"
  environment = "dev"
  file_data   = {
    "task.txt"   = "Complete the Terraform lab"
    "status.txt" = "Learning modules"
  }
}

# Call for PROD (using the default file_data defined in the module)
module "prod_infrastructure" {
  source      = "./modules/welcome_card"
  user_name   = "Tania"
  environment = "prod"
}

# Call for stage (using the default file_data defined in the module)
module "test_infrastructure" {
  source      = "./modules/welcome_card"
  user_name   = "Tania"
  environment = "test"
}

# ... (your existing module calls) ...

output "dev_file_location" {
  # Syntax: module.<NAME>.<OUTPUT_NAME>
  value = module.dev_infrastructure.card_path
}

output "prod_file_location" {
  value = module.prod_infrastructure.card_path
}
