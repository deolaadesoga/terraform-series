# Terraform Block
terraform {
  required_version = "~> 1.0" # which means any version equal & above 0.14 like 0.15, 0.16 etc and < 1.xx
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}
# Provider Block
provider "aws" {
  region = "us-west-1"
  profile = "Kenmak"
}

module "db" {
    source = "./db"
    # the ./ means it is in the same directory, if the default value is not passed, we can pass it here, e.g. ec2name = "Demo.ec2"

}

module "web" {
    source = "./web"
}

output "PrivateIP" {
    value = module.db.PrivateIP
}

output "PublicIP" {
    value = module.web.pub_ip
}
