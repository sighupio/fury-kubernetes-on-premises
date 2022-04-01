<h1>
    <img src="https://github.com/sighupio/fury-distribution/blob/master/docs/assets/fury-epta-white.png?raw=true" align="left" width="90" style="margin-right: 15px"/>
    Kubernetes Fury on-premises
</h1>

![Release](https://img.shields.io/badge/Latest%20Release-v1.19.7-blue)
![License](https://img.shields.io/github/license/sighupio/fury-kubernetes-on-premises?label=License)
![Slack](https://img.shields.io/badge/slack-@kubernetes/fury-yellow.svg?logo=slack&label=Slack)

<!-- <KFD-DOCS> -->

**Kubernetes Fury on-premises** is an add-on module for the [Kubernetes Fury Distribution (KFD)][kfd-repo] that provides
packages to install Kubernetes to on-premises VMs.

If you are new to KFD please refer to the [official documentation][kfd-docs] on how to get started with KFD.

## Overview

**Kubernetes Fury on-premises** uses a collection of open source tools to install Kubernetes in a on-premises environment.

## Packages

The following packages are included in the Fury Kubernetes on-premises katalog:

| Package                                              | Version  | Description                                                                                              |
|------------------------------------------------------|----------|----------------------------------------------------------------------------------------------------------|
| [dex](katalog/dex)                                   | `2.20.0` | OpenID Connect (OIDC) identity and OAuth 2.0 provider with pluggable connectors                          |
| [gangway](katalog/gangway)                           | `3.2.0`  | An application that can be used to easily enable authentication flows via OIDC for a kubernetes cluster. |
| [vmware-cm](katalog/vmware-cm)                       | `1.2.1`  | Kubernetes Cloud Provider for vSphere                                                                    |
| [vmware-csi](katalog/vmware-csi)                     | `2.1.0`  | vSphere storage Container Storage Interface (CSI) plugin                                                 |
| [etcd](roles/etcd)                                   | `3.4.7`  | Ansible role to install ETCD as systemd service |
| [furyagent](roles/furyagent)                         | `0.2.2`  | Ansible role to install [Furyagent](https://github.com/sighupio/furyagent) |
| [haproxy](roles/haproxy)                             | `2.2`    | Ansible role to install HAProxy |

Click on each package to see its full documentation.

## Compatibility

Check the [compatibility matrix][compatibility-matrix] for additional informations about previous releases of the modules.


### Ansible Roles

- **etcd**: role to deploy etcd in the master nodes stand-alone and not as a Kubernetes deployment. Version **3.4.7**.
- **furyagent**: role to deploy furyagent on the nodes. Version **0.2.2**.
- **haproxy**: role to install haproxy as load balancer. Version **2.2**.
- **kube-control-plane**: role to configure the master nodes. Version **1.19.7**.
- **kube-node-common**: role with common tasks to install kubernetes nodes. Version **1.19.7**.
- **kube-worker**: role with specific configuration for worker nodes. Version **1.19.7**.
- **node_exporter**: prometheus node exporter to expose node metrics. Version **1.0.1**.
