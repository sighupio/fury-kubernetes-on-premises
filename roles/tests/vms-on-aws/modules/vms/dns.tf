data "aws_route53_zone" "public" {
  name = var.dns_zone
}