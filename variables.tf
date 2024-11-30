variable "tools" {
  default = {

    vault = {
      port = 8200
      volume_size = 20
      instance_type = "t3.small"
    }
  }

}

variable "zone_id" {
  default = "Z09687201RU9RU0QEJJY1"

}

variable "domain_name" {
  default = "abdulqadir.shop"
}