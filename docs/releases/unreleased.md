# SIGHUP Distribution On Premises installer release vTBD

Welcome to the latest release of `on-premises` installer of [`SIGHUP Distribution`](https://github.com/sighupio/distribution) maintained by SIGHUP by ReeVo team.

This release ... TBD

## Package Versions 🚢

TBD

## Breaking Changes 💔

TBD

## Bug Fixes 🐛

- [[#174](https://github.com/sighupio/installer-on-premises/pull/174)] Fix kube-control-plane role to accept usernames with spaces and create the users' kubeconfig on just one node instead of all the masters.

## New features 🌟

TBD

## Update Guide 🦮

### Automatic upgrade using furyctl

To update using furyctl, follow this [documentation](https://docs.sighup.io/docs/installation/upgrades).

### Manual update

> NOTE: Each on-premises environment can be different, always double-check before updating components.

1. Update SD if applicable (see the [SD release notes](https://github.com/sighupio/distribution/tree/master/docs/releases))
2. Before upgrading to Kubernetes 1.35, ensure all etcd members are running at least v3.5.26 as required by the etcd upstream guidelines.
3. Verify all nodes are running cgroup v2 (`stat -fc %T /sys/fs/cgroup/` should return `cgroup2fs`).
4. Update the cluster using playbooks, see the examples in this repository to know more.
5. Plan the migration to containerd 2.x before the next Kubernetes upgrade.
