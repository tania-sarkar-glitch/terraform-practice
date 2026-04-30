variable "filename" {
  default = "test.txt"
}

variable "content" {
  default = "Hello from variable!"
}

provider "local" {}

resource "local_file" "test" {
  content  = var.content
  filename = var.filename
}

output "file" {
  value = var.filename
}