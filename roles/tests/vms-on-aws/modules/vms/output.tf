output "lb_names" {
    description = "The name of the lb instances"
    value = aws_instance.lb.*.tags_all.Name
}

output "lb_dns" {
    description = "The DNS of the lb instances"
    value = aws_route53_record.lb_dns.*.fqdn
}

output "public_lb_ips" {
    description = "The public ip list for lb instances"
    value = aws_instance.lb.*.public_ip
}

output "private_lb_ips" {
    description = "The private ip list for lb instances"
    value = aws_instance.lb.*.private_ip
}

output "lb_map"{
    value = [
        for i, name in aws_instance.lb.*.tags_all.Name : {
            name = name
            ansible_host = aws_instance.lb[i].private_ip
            kubernetes_host = aws_route53_record.lb_dns[i].fqdn
        }
    ]
}

output "master_names" {
    description = "The name of the master instances"
    value = aws_instance.master.*.tags_all.Name
}

output "master_dns" {
    description = "The DNS of the master instances"
    value = aws_route53_record.master_dns.*.fqdn
}

output "public_master_ips" {
    description = "The public ip list for master instances"
    value = aws_instance.master.*.public_ip
}

output "private_master_ips" {
    description = "The private ip list for master instances"
    value = aws_instance.master.*.private_ip
}



output "master_map"{
    value = [
        for i, name in aws_instance.master.*.tags_all.Name : {
            name = name
            ansible_host = aws_instance.master[i].private_ip
            kubernetes_host = aws_route53_record.master_dns[i].fqdn
        }
    ]
}


output "worker_names" {
    description = "The name of the worker instances"
    value = aws_instance.worker.*.tags_all.Name
}

output "worker_dns" {
    description = "The DNS of the worker instances"
    value = aws_route53_record.worker_dns.*.fqdn
}

output "public_worker_ips" {
    description = "The public ip list for worker instances"
    value = aws_instance.worker.*.public_ip
}

output "private_worker_ips" {
    description = "The private ip list for worker instances"
    value = aws_instance.worker.*.private_ip
}


output "worker_map"{
    value = [
        for i, name in aws_instance.worker.*.tags_all.Name : {
            name = name
            ansible_host = aws_instance.worker[i].private_ip
            kubernetes_host = aws_route53_record.worker_dns[i].fqdn
        }
    ]
}

output "control_plane_dns" {
    value = "controlplane.${var.cluster_name}.${var.dns_zone}"
}