# Fury Kubernetes on-premises

This module contains all the needed ansible roles and kuberenetes manifests to install Fury Kubernetes on-premises using IaC.

## Compatibility

| Distribution Version / Kubernetes Version | 1.15.X             | 1.16.X             | 1.17.X             | 1.18.X             | 1.19.X             |
|-------------------------------------------|:------------------:|:------------------:|:------------------:|:------------------:|:------------------:|
| v1.15.4                                   | :white_check_mark: |                    |                    |                    |                    |
| v1.19.7                                   |                    |                    |                    |                    | :white_check_mark: |

- :white_check_mark: Compatible
- :warning: Has issues
- :x: Incompatible

## Packages

This module has the following packages:

### Kubernetes Manifests

- dex
- gangway
- vmware-cm: VMware vSphere Cloud Provider.
- vmware-csi: VMware vSphere Cloud Storage Interface driver.

### Ansible Roles

- **etcd**: role to deploy etcd in the master nodes stand-alone and not as a Kubernetes deployment. Version **3.4.7**.
- **furyagent**: role to deploy furyagent on the nodes. Version **0.2.2**.
- **haproxy**: role to install haproxy as load balancer. Version **2.2**.
- **kube-control-plane**: role to configure the master nodes. Version **1.19.7**.
- **kube-node-common**: role with common tasks to install kubernetes nodes. Version **1.19.7**.
- **kube-worker**: role with specific configuration for worker nodes. Version **1.19.7**.
- **node_exporter**: prometheus node exporter to expose node metrics. Version **1.0.1**.
