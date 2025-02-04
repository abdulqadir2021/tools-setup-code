terraform {
  backend "s3" {
    bucket = "terraform-d81aq"
    key    = "tools/terraform.tfstate"
    region = "us-east-1"

  }
}

