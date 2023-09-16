terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

}

# Configure the  AWS Provider
provider "aws" {
   region     = var.web_region
   access_key = var.access_key
   secret_key = var.secret_key
}

module "ec2" {
  source      = "../modules/vm"
  vpc_security_groupids = "${module.securitygrp.security_groupid}"
  }

module "securitygrp" {
  source      = "../modules/sg"

 
}