provider "local" {}

resource "local_file" "test" {
  content  = "Hello Terraform from cloud ☁️"
  filename = "test.txt"
}
