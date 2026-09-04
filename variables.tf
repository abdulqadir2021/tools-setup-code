variable "tools" {
  default = {

    vault = {
      port = 8200
      volume_size = 20
      instance_type = "t3.micro"
      policy_list = []
    }

    github-runner = {
      port = 80 # just a dummy port
      volume_size = 20
      instance_type = "t3.micro"
      policy_list = ["*"]
    }

  }
}

variable "zone_id" {
  default = "Z0272961EHM02ZV0QE8D"

}

variable "domain_name" {
  default = "abdulqadir.shop"
}
