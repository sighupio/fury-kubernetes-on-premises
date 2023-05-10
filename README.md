<!-- markdownlint-disable MD033 -->
<h1>
    <img src="https://github.com/sighupio/fury-distribution/blob/main/docs/assets/fury-epta-white.png?raw=true" align="left" width="90" style="margin-right: 15px"/>
    Kubernetes Fury on-premises
</h1>
<!-- markdownlint-enable MD033 -->

![Release](https://img.shields.io/badge/Latest%20Release-v1.26.3-blue)
![License](https://img.shields.io/github/license/sighupio/fury-kubernetes-on-premises?label=License)
![Slack](https://img.shields.io/badge/slack-@kubernetes/fury-yellow.svg?logo=slack&label=Slack)

<!-- <KFD-DOCS> -->

**Kubernetes Fury on-premises** is an installer and add-on module for the [Kubernetes Fury Distribution (KFD)][kfd-repo] that provides
packages to install Kubernetes to on-premises VMs.

If you are new to KFD please refer to the [official documentation][kfd-docs] on how to get started with KFD.

## Overview

**Kubernetes Fury on-premises** uses a collection of open source tools to install Kubernetes in an on-premises environment.

## Packages

The following packages are included in the Fury Kubernetes on-premises module:

| Package                                        | Version  | Description                                                                   |
| ---------------------------------------------- | -------- | ----------------------------------------------------------------------------- |
| [vsphere-cm](katalog/vsphere-cm)               | `1.26.3` | Kubernetes Cloud Provider for vSphere                                         |
| [vsphere-csi](katalog/vsphere-csi)             | `3.0.1`  | vSphere storage Container Storage Interface (CSI) plugin                      |
| [etcd](roles/etcd)                             | `3.5.8`  | Ansible role to install etcd as systemd service                               |
| [haproxy](roles/haproxy)                       | `2.6`    | Ansible role to install HAProxy as Kubernetes load balancer for the APIServer |
| [containerd](roles/containerd)                 | `1.7.0`  | Ansible role to install containerd as container runtime                       |
| [kube-node-common](roles/kube-node-common)     | `-`      | Ansible role to install prerequisites for Kubernetes setup                    |
| [kube-control-plane](roles/kube-control-plane) | `-`      | Ansible role to install master nodes                                          |
| [kube-worker](roles/kube-worker)               | `-`      | Ansible role to install worker nodes and join them to the cluster             |

Click on each package to see its full documentation.

## Compatibility

This version is compatible with Kubernetes 1.26.3

Check the [compatibility matrix][compatibility-matrix] for additional information about previous releases of the module.

## Usage

### Prerequisites

| Tool                    | Version   | Description                                                                                                                                                |
| ----------------------- | --------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [furyctl][furyctl-repo] | `>=0.6.0` | The recommended tool to download and manage KFD modules and their packages. To learn more about `furyctl` read the [official documentation][furyctl-repo]. |

### Provision the cluster

1. List the role in a `Furyfile.yml` file

```yaml
roles:
  - name: on-premises
    version: v1.26.3
```

> See `furyctl` [documentation][furyctl-repo] for additional details about `Furyfile.yml` format.

1. Execute `furyctl vendor -H` to download the roles

2. Inspect the downloaded roles inside `./vendor/roles/on-premise`

3. Install Kubernetes cluster using the downloaded roles. You can use our [playbook examples](examples/playbooks)

<!-- Links -->

[furyctl-repo]: https://github.com/sighupio/furyctl
[compatibility-matrix]: https://github.com/sighupio/fury-kubernetes-on-premises/blob/master/docs/COMPATIBILITY_MATRIX.md
[kfd-repo]: https://github.com/sighupio/fury-distribution
[kfd-docs]: https://docs.kubernetesfury.com/docs/distribution/

<!-- </KFD-DOCS> -->

<!-- <FOOTER> -->

### Reporting Issues

In case you experience any problems with the module, please [open a new issue](https://github.com/sighupio/fury-kubernetes-on-premises/issues/new/choose).

## License

This module is open-source and it's released under the following [LICENSE](LICENSE).

<!-- </FOOTER> -->
