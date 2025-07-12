terraform {
  backend "s3" {
    bucket = "roboshop-25"
    key    = "tools/terraform.tfstate"
    region = "us-east-1"

  }
}

