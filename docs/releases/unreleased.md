# On Premises module release vTBD

Welcome to the latest release of `on-premises` module of [`Kubernetes Fury Distribution`](https://github.com/sighupio/fury-distribution) maintained by SIGHUP team.

This release adds support for Kubernetes version vTBD.

## Package Versions 🚢

- TBD

## New features 🌟

- [[#107](https://github.com/sighupio/fury-kubernetes-on-premises/pull/107)] **Add AlmaLinux support**: this release adds support for the AlmaLinux distribution to the OnPremises provider.

## Bug fixes 🐞

- [[#114](https://github.com/sighupio/fury-kubernetes-on-premises/pull/114)] **Resolve failing upgrades on Debian/Ubuntu on corner cases**: this release fixes failing runs of this installer in cases where a user previously downloaded the K8S APT repository's GPG key in a node (either by using this module or manually, it makes no difference), and that key has expired.

- [[#117](https://github.com/sighupio/fury-kubernetes-on-premises/pull/117)] **Fix upgrade to 1.31**: this release fixes the upgrade process to Kubernetes 1.31 that previously could result in either an error or finish without errors but kube-scheduler and kube-controller-manager would be in crash loop.

## Update Guide 🦮

- TBD

### Automatic upgrade using furyctl

To update using furyctl, follow this [documentation](https://docs.kubernetesfury.com/docs/installation/upgrades).

### Manual update
  
> NOTE: Each on-premises environment can be different, always double-check before updating components.

1. Update KFD if applicable (see the [KFD release notes](https://github.com/sighupio/fury-distribution/tree/master/docs/releases))
2. Update the cluster using playbooks, see the examples in this repository to know more.