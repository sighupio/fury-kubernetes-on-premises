resource "aws_instance" "worker" {
  count                       = var.worker_count
  key_name                    = aws_key_pair.cluster.key_name
  ami                         = lookup(local.ubuntu_amis, var.region, "")
  instance_type               = var.worker_instance_type
  subnet_id                   = data.aws_subnet.public.id
  vpc_security_group_ids      = ["${aws_security_group.main.id}"]
  source_dest_check           = false
  associate_public_ip_address = true

  root_block_device {
    volume_size = var.volume_size_gb
  }

  tags = merge(var.tags, {
    Name = "worker-${count.index + 1}"
    Cluster = var.cluster_name
  })
}

resource "aws_route53_record" "worker_dns" {
  count      = var.worker_count
  zone_id    = data.aws_route53_zone.public.zone_id
  name       = "worker-${count.index + 1}.${var.cluster_name}.${var.dns_zone}"
  type       = "A"
  ttl        = 300
  records    = [aws_instance.worker[count.index].private_ip]
}