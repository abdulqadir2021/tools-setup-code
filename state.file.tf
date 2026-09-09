terraform {
  backend "s3" {
    bucket = "terraform-aq26"
    key    = "tools/terraform.tfstate"
    region = "us-east-1"

  }
}

