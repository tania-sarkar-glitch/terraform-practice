variable "prefix" {
  default = "dev"
}

variable "files" {
  default = {
    "file1.txt" = "Hello from file 1"
    "file2.txt" = "Hello from file 2"
    "notes.txt" = "Terraform is fun!"
    "secret.txt" = "This is hidden power"
  }
}

provider "local" {}

resource "local_file" "files" {
  for_each = var.files

  filename = "${var.prefix}-${each.key}"
  content  = each.value
}

output "created_files" {
  value = [for f in local_file.files : f.filename]
}