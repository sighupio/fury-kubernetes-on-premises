resource "aws_security_group" "main" {
  vpc_id      = data.aws_vpc.vpc.id
  name_prefix = "${var.cluster_name}-main"
  tags        = var.tags
}

resource "aws_security_group_rule" "main_ingress" {
  type              = "ingress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = var.trusted_cidrs
  security_group_id = aws_security_group.main.id
}

resource "aws_security_group_rule" "main_egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.main.id
}

resource "aws_instance" "master" {
  count                       = var.master_count
  key_name                    = aws_key_pair.cluster.key_name
  ami                         = lookup(local.ubuntu_amis, var.region, "")
  instance_type               = var.master_instance_type
  subnet_id                   = data.aws_subnet.public.id
  vpc_security_group_ids      = ["${aws_security_group.main.id}"]
  source_dest_check           = false
  associate_public_ip_address = true

  root_block_device {
    volume_size = var.volume_size_gb
  }

  tags = merge(var.tags, {
    Name = "master-${count.index + 1}"
    Cluster = var.cluster_name
  })
}


resource "aws_route53_record" "master_dns" {
  count      = var.master_count
  zone_id    = data.aws_route53_zone.public.zone_id
  name       = "master-${count.index + 1}.${var.cluster_name}.${var.dns_zone}"
  type       = "A"
  ttl        = 300
  records    = [aws_instance.master[count.index].private_ip]
}