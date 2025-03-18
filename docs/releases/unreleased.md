# On Premises module release vTBD

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

- TBD
## Breaking Changes 💔

- TBD

## Update Guide 🦮

- TBD

### Automatic upgrade using furyctl

To update using furyctl, follow this [documentation](https://docs.kubernetesfury.com/docs/installation/upgrades).

### Manual update
  
> NOTE: Each on-premises environment can be different, always double-check before updating components.

1. Update KFD if applicable (see the [KFD release notes](https://github.com/sighupio/fury-distribution/tree/master/docs/releases))
2. Update the cluster using playbooks, see the examples in this repository to know more.
