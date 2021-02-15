# HAproxy

This Ansible role installs and configures HAproxy on a machine.

This role also supports having >1 haproxy in a high availability scheme using a shared virtual IP with `keepalived` and VRRP.

## Configuration

Variable | Description | Default Value
---------|-------------|--------------
`haproxy_version`| HAproxy version to install | `2.2`
`haproxy_configuration_file`| Name of the local haproxy config file to copy to the VM | `haproxy.cfg`
`keepalived_cluster` | If keepalived should be installed and configured besides haproxy | `false`
`keepalived_ip` | The virtual IP that will be used as VRRP address. Ex. `10.2.0.10/16` | -
`keepalived_interface` | Interface that will hold the shared IP | `ens192`
`keepalived_passphrase` | Passphrase to use as authentication between the keepalived nodes. Must be 8 chars. | `kubernetes_cluster_name` or `12345678` when not set.
`keepalived_on_k8s_master` | Set to `true` if keepalived is running on a Kubernets master to enable specific checks. | `false`
`control_plane_endpoint` | Kubernetes control plane endpoint. Generally set as part of kuberentes roles. Needed when `keepalived_on_k8s_master` is `true` | -

> ⚠️ Please notice that the role will assume that if the machine hostname ends with `-1`, the machine will be configured as a keepalived `MASTER` and will have the highest weight.
