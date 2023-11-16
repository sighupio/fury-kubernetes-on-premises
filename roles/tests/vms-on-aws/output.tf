locals {

  lb_lines = [
    for item in module.vms.lb_map : "${item.name} ansible_host=${item.ansible_host} kubernetes_hostname=${item.kubernetes_host}"
  ]
  master_lines = [
    for item in module.vms.master_map : "${item.name} ansible_host=${item.ansible_host} kubernetes_hostname=${item.kubernetes_host}"
  ]
  worker_lines = [
    for item in module.vms.worker_map : "${item.name} ansible_host=${item.ansible_host} kubernetes_hostname=${item.kubernetes_host}"
  ]

  master_lines_for_haproxy = [
    for item in module.vms.master_map : "    server ${item.kubernetes_host} ${item.ansible_host}:6443 maxconn 256 check check-ssl ca-file /etc/ssl/certs/kubernetes.crt"
  ]

  inventory = <<EOF
[haproxy]
${join("\n", local.lb_lines)}

[master]
${join("\n", local.master_lines)}

[worker]
${join("\n", local.worker_lines)}

[all:vars]
ansible_ssh_common_args='-o ProxyCommand="ssh -o StrictHostKeyChecking=no -W %h:%p -q ubuntu@${module.vms.control_plane_dns}"'


EOF

  haproxy_cfg = <<EOF

global
    daemon
    maxconn 20480

defaults
    mode tcp
    timeout connect 5s
    timeout client 50s
    timeout server 50s

listen  stats
    bind *:1936
    mode            http
    log             global

    maxconn 10

    timeout client      100s
    timeout server      100s
    timeout connect     100s
    timeout queue       100s

    stats enable
    stats uri /stats
    stats hide-version
    stats refresh 30s
    stats show-node
    stats auth admin:password

frontend control-plane
    mode tcp
    bind *:6443 alpn h2,http/1.1
    default_backend masters

backend masters
    option httpchk GET /healthz
    balance roundrobin
${join("\n", local.master_lines_for_haproxy)}

EOF
}

output "inventory" {
  value = local.inventory
}

output "haproxycfg" {
  value = local.haproxy_cfg
}