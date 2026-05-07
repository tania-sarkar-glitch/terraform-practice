variable "user_name" {
  type        = string
  description = "The name of the user for the card"
}

variable "environment" {
  type        = string
  description = "The target environment (dev, prod, test.)"
  
  # Professional Touch: Validation!
  validation {
    condition     = contains(["dev", "prod", "test"], var.environment)
    error_message = "Environment must be dev, prod, or test."
  }
}
