terraform {
  backend "s3" {
    bucket = "terraform-d81aq"
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

resource "vault_generic_secret" "frontend" {
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

resource "vault_generic_secret" "catalogue" {
  path = "${vault_mount.roboshop-dev.path}/catalogue"

  data_json = <<EOT
{
  "MONGO": "true",
  "MONGO_URL" : "mongodb://mongodb-dev.abdulqadir.shop:27017/catalogue",
  "DB_TYPE": "mongo",
  "APP_GIT_URL": "https://github.com/roboshop-devops-project-v3/catalogue",
  "DB_HOST": "mongodb-dev.abdulqadir.shop",
  "SCHEMA_FILE": "db/master-data.js"
}
EOT
}

resource "vault_generic_secret" "user" {
  path = "${vault_mount.roboshop-dev.path}/user"

  data_json = <<EOT
{
  "MONGO": "true",
  "MONGO_URL" : "mongodb://mongodb-dev.abdulqadir.shop:27017/users",
  "REDIS_URL" : "redis://redis-dev.abdulqadir.shop:6379"
}
EOT
}

resource "vault_generic_secret" "cart" {
  path = "${vault_mount.roboshop-dev.path}/cart"

  data_json = <<EOT
{
  "REDIS_HOST": "redis-dev.abdulqadir.shop",
  "CATALOGUE_HOST" : "catalogue-dev.abdulqadir.shop",
  "CATALOGUE_PORT" : "8080"
}
EOT
}

resource "vault_generic_secret" "shipping" {
  path = "${vault_mount.roboshop-dev.path}/shipping"

  data_json = <<EOT
{
  "CART_ENDPOINT": "cart-dev.abdulqadir.shop:8080",
  "DB_HOST" : "mysql-dev.abdulqadir.shop",
  "mysql_root_password" : "Roboshop@1"
}
EOT
}

resource "vault_generic_secret" "payment" {
path = "${vault_mount.roboshop-dev.path}/payment"

data_json = <<EOT
{
  "CART_HOST" : "cart-dev.abdulqadir.shop",
  "CART_PORT" : "8080",
  "USER_HOST" : "user-dev.abdulqadir.shop",
  "USER_PORT" : "8080",
  "AMQP_HOST" : "rabbitmq-dev.abdulqadir.shop",
  "AMQP_USER" : "roboshop",
  "AMQP_PASS" : "roboshop123"
}
EOT
}

resource "vault_generic_secret" "mysql" {
path = "${vault_mount.roboshop-dev.path}/mysql"

data_json = <<EOT
{
  "mysql_root_password" : "Roboshop@1"
}
EOT
}

resource "vault_generic_secret" "rabbitmq" {
path = "${vault_mount.roboshop-dev.path}/rabbitmq"

data_json = <<EOT
{
  "user" : "roboshop",
  "password" : "roboshop123"
}
EOT
}



###############
resource "vault_mount" "infra-secrets" {
  path        = "infra-secrets"
  type        = "kv"
  options     = { version = "2" }
  description = "All Infra Related Secrets"
}

resource "vault_generic_secret" "ssh" {
  path = "${vault_mount.infra-secrets.path}/ssh"

  data_json = <<EOT
{
  "username" : "ec2-user",
  "password" : "DevOps321"
}
EOT
}

