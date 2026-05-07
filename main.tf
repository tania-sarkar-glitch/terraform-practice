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

# Call for TEST (using the default file_data defined in the module)
module "prod_infrastructure" {
  source      = "./modules/welcome_card"
  user_name   = "Tania"
  environment = "test"
}

output "dev_files" {
  value = [for f in module.dev_infrastructure : "File created!"]
  # Note: To output filenames from a module, you'd need a 'module output' 
  # but let's keep it simple for now.
}
