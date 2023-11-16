resource "aws_key_pair" "cluster" {
  key_name   = "${var.cluster_name}-key"
  public_key = var.public_key
}