# Example Playbooks for Kubernetes cluster deployment with Fury

In this directory we provide example playbooks for deploying a Kubernetes cluster using Kubernetes Fury Distribution
to on-premises virtual machines at version 1.23.12 and then how to upgrade it to 1.24.7.

- [Example Playbooks for Kubernetes cluster deployment with Fury](#example-playbooks-for-kubernetes-cluster-deployment-with-fury)
  - [Requirements](#requirements)
  - [Cluster Architecture](#cluster-architecture)
  - [Install phases](#install-phases)
    - [Initialize PKI](#initialize-pki)
    - [Install the Container Runtime](#install-the-container-runtime)
      - [Containerd](#containerd)
    - [Install the Load Balancer](#install-the-load-balancer)
    - [Provision Master and Worker Nodes](#provision-master-and-worker-nodes)
  - [Upgrade cluster](#upgrade-cluster)
  - [Utilities](#utilities)
    - [How to migrate from Docker to Containerd](#how-to-migrate-from-docker-to-containerd)

## Requirements

To be able to run the examples, you need to have the following software installed:

- ansible >= 2.8.0
- furyagent
- kubectl

One of the following supported Operating Systems on the target machines:

- Ubuntu 20.04 LTS
- RHEL 8
- Rocky 8

## Cluster Architecture

The cluster is composed of:

- 2 HAproxy load balancers
- 3 Master nodes
- 3 Worker nodes

In the master nodes we also deploy etcd as a standalone systemd service.

Check the following files for a complete example:

- `hosts.yaml`
- `haproxy.cfg`

> NOTE: all the cluster configuration is managed by hosts.ini and haproxy.cfg files.

## Install phases

The install phases are ordered, and each playbook has the order in which it should be run in the file name.

### Initialize PKI

First of all, we need to initialize CAs certificates for the etcd cluster and the Kubernetes components.
The initialization of the PKI is done locally, using `furyagent`. The playbook is `0.pki.yml`.

Run the playbook with:

```bash
ansible-playbook 0.pki.yml
```

As a result, a `./pki` directory with the following files will be created:

```text
pki
├── etcd
│  ├── ca.crt
│  └── ca.key
└── master
   ├── ca.crt
   ├── ca.key
   ├── front-proxy-ca.crt
   ├── front-proxy-ca.key
   ├── sa.key
   └── sa.pub
```

### Install the Container Runtime

In this step you can choose which container runtime you want to use:

- containerd

#### Containerd

Run the `1.containerd.yml` playbook with:

```bash
ansible-playbook 1.containerd.yml
```

### Install the Load Balancer

To install the load balancer run the `2.load-balancer.yml` playbook with:

```bash
ansible-playbook 2.load-balancer.yml
```

### Provision Master and Worker Nodes

Now that all the prerequisites are installed, we can provision the Kubernetes master and worker nodes.

The `3.cluster.yml` playbook needs some variables to be set in the `hosts.ini` file, double-check that everything is ok.

Run the playbook with:

```bash
ansible-playbook 3.cluster.yml
```

## Upgrade cluster

In this folder there are two playbooks to upgrade the cluster to a new kubernetes version.

Change the `hosts.ini` with the version you want to upgrade to:

```yaml
all:
  vars:
    kubernetes_version: '1.24.7'
```

> NOTE: the `kubernetes_version` must be one of the versions available in the roles, i.e. supported by this installer.
<!-- spacer -->
> IMPORTANT: all the nodes must be in Ready status before running the upgrade.

First you need to upgrade the control plane with the `55.upgrade-control-plane.yml` playbook with:

```bash
ansible-playbook 55.upgrade-control-plane.yml
```

Then you need to upgrade the worker nodes with the `56.upgrade-worker-nodes.yml` playbook with:

```bash
ansible-playbook 56.upgrade-worker-nodes.yml --limit worker1
```

Repeat this step foreach worker node in the cluster.

> NOTE: you need to run the playbook with the `--limit` option to limit the nodes to upgrade. Why? Because the upgrade
> process will drain the node before upgrading it.
> Additionally, during the upgrade containerd will also be upgraded

## Utilities

### How to migrate from Docker to Containerd

To migrate from `docker` to `containerd`, there is an example playbook in this directory `99.migrate-docker-to-containerd.yml`.

It must be executed **one node at a time**:

```bash
ansible-playbook 99.migrate-docker-to-containerd.yml --limit worker1
```
