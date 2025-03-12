# On Premises module release v1.32.0

Welcome to the latest release of `on-premises` module of [`Kubernetes Fury Distribution`](https://github.com/sighupio/fury-distribution) maintained by SIGHUP team.

This release adds support for Kubernetes version vTBD.

## Package Versions 🚢

| Package                                        | Supported Version | Previous Version |
| ---------------------------------------------- | ----------------- | ---------------- |
| [etcd](roles/etcd)                             | `3.5.16`          | `Updated`        |
| [haproxy](roles/haproxy)                       | `3.0`             | `No update`      |
| [containerd](roles/containerd)                 | `1.7.26`          | `Updated`        |
| [kube-node-common](roles/kube-node-common)     | `-`               | `Updated`        |
| [kube-control-plane](roles/kube-control-plane) | `-`               | `Updated`        |
| [kube-worker](roles/kube-worker)               | `-`               | `No update`      |

## New features 🌟

- [[#116](https://github.com/sighupio/fury-kubernetes-on-premises/pull/116)] **Add support for etcd cluster on dedicated nodes**: adding support for deploying etcd on dedicated nodes instead of control plane nodes to the OnPremises provider.
Using this feature needs some fields to be set in the Ansible inventory file, see the [/examples/playbooks/hosts.yaml](/examples/playbooks/hosts.yaml) file for an example (note: this is a breaking change).

## Breaking Changes 💔

- New etcd inventory group required: the Ansible inventory file now requires an explicit etcd group to be defined, even when etcd is deployed on control plane nodes. This is necessary to support the new feature of deploying etcd on dedicated nodes. See the [/examples/playbooks/hosts.yaml](/examples/playbooks/hosts.yaml) file for examples of both configurations.

## Update Guide 🦮

- TBD
- Inventory file update required: before upgrading users must update their Ansible inventory file to include the etcd group. To maintain etcd on control plane nodes without any change, make sure to define the etcd group with the same names and hosts as your control plane nodes and add the global variable `etcd_on_control_plane`.
    ```yaml
    all:
      children:
        ...
        etcd:
          hosts:
            master1:
              ansible_host: 192.168.1.181
              kubernetes_hostname: master1.example.com
            master2:
              ansible_host: 192.168.1.182
              kubernetes_hostname: master2.example.com
            master3:
              ansible_host: 192.168.1.183
              kubernetes_hostname: master3.example.com
          vars:
            dns_zone: "example.com"
        ...
      vars:
        ...
        etcd_on_control_plane: true
        ...
    ```

### Automatic upgrade using furyctl

To update using furyctl, follow this [documentation](https://docs.kubernetesfury.com/docs/installation/upgrades).

### Manual update
  
> NOTE: Each on-premises environment can be different, always double-check before updating components.

1. Update KFD if applicable (see the [KFD release notes](https://github.com/sighupio/fury-distribution/tree/master/docs/releases))
2. Update the cluster using playbooks, see the examples in this repository to know more.
