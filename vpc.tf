resource "aws_vpc" "eks_vpc" {
  cidr_block            = "10.10.20.0/24"

  enable_dns_hostnames  = true
  enable_dns_support    = true

  tags = {
    Name = format("%s-vpc", local.name)
  }
}