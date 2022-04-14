<h1>
    <img src="https://github.com/sighupio/fury-distribution/blob/master/docs/assets/fury-epta-white.png?raw=true" align="left" width="90" style="margin-right: 15px"/>
    Kubernetes Fury on-premises
</h1>

![Release](https://img.shields.io/badge/Latest%20Release-v1.20.15-blue)
![License](https://img.shields.io/github/license/sighupio/fury-kubernetes-on-premises?label=License)
![Slack](https://img.shields.io/badge/slack-@kubernetes/fury-yellow.svg?logo=slack&label=Slack)

<!-- <KFD-DOCS> -->

**Kubernetes Fury on-premises** is an add-on module for the [Kubernetes Fury Distribution (KFD)][kfd-repo] that provides
packages to install Kubernetes to on-premises VMs.

If you are new to KFD please refer to the [official documentation][kfd-docs] on how to get started with KFD.

## Overview

**Kubernetes Fury on-premises** uses a collection of open source tools to install Kubernetes in a on-premises environment.

## Packages

The following packages are included in the Fury Kubernetes on-premises module:

| Package                                              | Version  | Description                                                                                              |
|------------------------------------------------------|----------|----------------------------------------------------------------------------------------------------------|
| [dex](katalog/dex)                                   | `2.20.0` | OpenID Connect (OIDC) identity and OAuth 2.0 provider with pluggable connectors                          |
| [gangway](katalog/gangway)                           | `3.2.0`  | An application that can be used to easily enable authentication flows via OIDC for a kubernetes cluster. |
| [vmware-cm](katalog/vmware-cm)                       | `1.2.1`  | Kubernetes Cloud Provider for vSphere                                                                    |
| [vmware-csi](katalog/vmware-csi)                     | `2.1.0`  | vSphere storage Container Storage Interface (CSI) plugin                                                 |
| [etcd](roles/etcd)                                   | `3.4.7`  | Ansible role to install ETCD as systemd service                                                          |
| [furyagent](roles/furyagent)                         | `0.2.2`  | Ansible role to install [Furyagent](https://github.com/sighupio/furyagent)                               |
| [haproxy](roles/haproxy)                             | `2.2`    | Ansible role to install HAProxy as Kubernetes load balancer for the APIServer                            |
| [containerd](roles/containerd)                       | `1.5.8`  | Ansible role to install containerd as container runtime                                                  |
| [docker](roles/docker)                               | `19.X`   | Ansible role to install docker as container runtime                                                      |
| [kube-node-common](roles/kube-node-common)           | `-`      | Ansible role to install prerequisites for Kubernetes setup                                               |
| [kube-control-plane](roles/kube-control-plane)       | `-`      | Ansible role to install master nodes                                                                     |
| [kube-worker](roles/kube-worker)                     | `-`      | Ansible role to install worker nodes and join them to the cluster                                        |

Click on each package to see its full documentation.

## Compatibility

Check the [compatibility matrix][compatibility-matrix] for additional informations about previous releases of the modules.

## Examples

- [Install Kubernetes cluster with Ansible roles](examples/playbooks)

<!-- Links -->

[compatibility-matrix]: https://github.com/sighupio/fury-kubernetes-on-premises/blob/master/docs/COMPATIBILITY_MATRIX.md
[kfd-repo]: https://github.com/sighupio/fury-distribution
[kfd-docs]: https://docs.kubernetesfury.com/docs/distribution/

<!-- </KFD-DOCS> -->

<!-- <FOOTER> -->

### Reporting Issues

In case you experience any problem with the module, please [open a new issue](https://github.com/sighupio/fury-kubernetes-on-premises/issues/new/choose).

## License

This module is open-source and it's released under the following [LICENSE](LICENSE)

<!-- </FOOTER> -->
