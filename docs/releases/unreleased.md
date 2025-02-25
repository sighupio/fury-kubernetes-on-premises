# On Premises module release vTBD

Welcome to the latest release of `on-premises` module of [`Kubernetes Fury Distribution`](https://github.com/sighupio/fury-distribution) maintained by SIGHUP team.

This release adds support for Kubernetes version vTBD.

## Package Versions 🚢

- TBD

## New features 🌟

- [[#116](ttps://github.com/sighupio/fury-kubernetes-on-premises/pull/116)] **Add support for etcd cluster on dedicated nodes**: adding support for deploying etcd on dedicated nodes instead of control plane nodes to the OnPremises provider.

## Update Guide 🦮

- TBD

### Automatic upgrade using furyctl

To update using furyctl, follow this [documentation](https://docs.kubernetesfury.com/docs/installation/upgrades).

### Manual update
  
> NOTE: Each on-premises environment can be different, always double-check before updating components.

1. Update KFD if applicable (see the [KFD release notes](https://github.com/sighupio/fury-distribution/tree/master/docs/releases))
2. Update the cluster using playbooks, see the examples in this repository to know more.