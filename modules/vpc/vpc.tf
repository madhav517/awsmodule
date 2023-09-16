resource "aws_vpc" "SampleVPC" {
  cidr_block       = var.cidrblock
  instance_tenancy = "default"

  tags = {
    Name = "SampleVPC"
  }
}