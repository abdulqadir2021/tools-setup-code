terraform {
  backend "s3" {
    bucket = "terraform.d81"
    key    = "vault-secrets/terraform.tfstate"
    region = "us-east-1"

  }
}

provider "vault" {
  address = "http://vault-internal.abdulqadir.shop:8200"
  token   = var.vault_token
  skip_tls_verify = true
}

variable "vault_token" {}

resource "vault_mount" "roboshop-dev" {
  path        = "roboshop-dev"
  type        = "kv"
  options     = { version = "2" }
  description = "Roboshop Dev Secrets"
}

resource "vault_generic_secret" "roboshop-dev" {
  path = "${vault_mount.roboshop-dev.path}/frontend"

  data_json = <<EOT

{
  "catalogue_url":    "http://catalogue-dev.abdulqadir.shop:8080/",
  "cart_url":    "http://cart-dev.abdulqadir.shop:8080/",
  "user_url":    "http://user-dev.abdulqadir.shop:8080/",
  "shipping_url":    "http://shipping-dev.abdulqadir.shop:8080/",
  "payment_url":    "http://payment-dev.abdulqadir.shop:8080/"
}
EOT
}