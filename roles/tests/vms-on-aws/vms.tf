data "aws_region" "current" {}

module "vms" {

  source       = "./modules/vms"
  region       = data.aws_region.current.name
  cluster_name = var.name

  public_subnet_id = module.vpc.public_subnets[0]

  public_key = var.public_key

  dns_zone = var.dns_zone

  tags = var.tags
}