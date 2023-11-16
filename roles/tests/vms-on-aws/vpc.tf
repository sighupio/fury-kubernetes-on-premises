data "aws_availability_zones" "available" {
  state = "available"
}

module "vpc" {

  source          = "terraform-aws-modules/vpc/aws"
  version         = "4.0.2"
  name            = var.name
  cidr            = var.cidr
  azs             = data.aws_availability_zones.available.names
  private_subnets = [var.private_subnet_cidr]
  public_subnets  = [var.public_subnet_cidr]

  tags = var.tags

  enable_nat_gateway = var.enable_nat_gw
  single_nat_gateway = var.single_nat_gw
}
