terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

resource "aws_instance" "ec2_example" {

    ami = var.ami
    instance_type = var.instancetype
    key_name= var.awskey
    vpc_security_group_ids = [var.vpc_security_groupids]
    tags = {
    Name = "ec2_example"
   }
  user_data = <<-EOF
      #!/bin/sh
      sudo apt-get update
      sudo apt install -y apache2
      sudo systemctl status apache2
      sudo systemctl start apache2
      sudo chown -R $USER:$USER /var/www/html
      sudo echo "<html><body><h1>Hello this is module</h1></body></html>" > /var/www/html/index.html
      EOF
}