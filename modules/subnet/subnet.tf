resource "aws_subnet" "SampleSubnet" {
  #count = length(var.subnets_cidr)
  vpc_id     = var.awsvpcid
  #cidr_block = element(var.subnets_cidr,count.index)
  cidr_block = var.subnets_cidr
  tags = {
    Name = "SampleSubnet"
  }
}