terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
  backend "s3" {
     bucket = "jenkinsterraformbucket"
     key    = "state"
     region = "ap-south-1"
  }
}
# Configure the  AWS Provider
provider "aws" {
   region     = var.web_region
 #  access_key = var.access_key
 #  secret_key = var.secret_key
}
module "ec2Machines" {
  source      = "../modules/virtualMachine"
  vpc_security_groupids = "${module.securitygroups.security_groupid}"
  }
module "securitygroups" {
  source      = "../modules/securityGroup" 
}
module "awsvpc" {
  source      = "../modules/vpc"
  }
module "routetables" {
  source      = "../modules/routeTable" 
  awsvpcid = "${module.awsvpc.awsvpc_id}"
  subnetid = "${module.subnets.subnetids}"
  internet_gateway = "${module.internetgateways.internet_gateway_id}"
  
}
module "internetgateways" {
  source      = "../modules/internetGateway"
  awsvpcid = "${module.awsvpc.awsvpc_id}"
  }
module "subnets" {
  source      = "../modules/subnet"
  awsvpcid = "${module.awsvpc.awsvpc_id}" 
}