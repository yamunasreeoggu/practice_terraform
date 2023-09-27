terraform {
  backend "s3" {
    bucket = "terraform-statefile-yamuna"
    key    = "expense_terraform/terraform.tfstate"
    region = "us-east-1"
  }
}

resource "null_resource" "null" {
  provisioner "local-exec" {
    command = "echo Hello World"
  }
}