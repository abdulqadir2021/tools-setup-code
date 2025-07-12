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
  default = "Z02974211891Z1NYIJSTE"

}

variable "domain_name" {
  default = "abdulqadir.shop"
}
