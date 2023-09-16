resource "aws_internet_gateway" "SampleGateWay" {
  vpc_id = var.awsvpcid

  tags = {
    Name = "SampleGateWay"
  }
}