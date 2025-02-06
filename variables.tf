variable "tools" {
  default = {

    vault = {
      port = 8200
      volume_size = 20
      instance_type = "t2.micro"
      policy_list = []
    }

    github-runner = {
      port = 80 # just a dummy port
      volume_size = 20
      instance_type = "t2.micro"
      policy_list = ["*"]
    }

  }
}

variable "zone_id" {
  default = "Z00064743L2THMADA4LWZ"

}

variable "domain_name" {
  default = "abdulqadir.shop"
}
