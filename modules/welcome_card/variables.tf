variable "user_name" {
  type        = string
}

variable "environment" {
  type        = string
  # This validation ensures only approved environments are used
  validation {
    condition     = contains(["dev", "prod", "test"], var.environment)
    error_message = "Environment must be dev, prod, or test."
  }
}

variable "file_data" {
  type = map(string)
  default = {
    "welcome.txt" = "Welcome to the team!"
    "notes.txt"   = "Terraform modules are powerful."
  }
}
