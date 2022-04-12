# Example Playbooks for Kubernetes cluster deployment with Fury

In this directory we provide example playbooks for deploying a Kubernetes cluster using Kubernetes Fury Distribution
to on-premises virtual machines.

- [Requirements](#requirements)
- [Cluster Architecture](#cluster-architecture)
- [Install phases](#install-phases)
    - [Initialize PKI](#initialize-pki)
    - [Install Container Runtime](#install-container-runtime)
    - [Install Load Balancer](#install-load-balancer)
    - [Provision Master and Worker Nodes](#provision-master-and-worker-nodes)
- [Utilities](#utilities)
  - [How to migrate from Docker to Containerd](#how-to-migrate-from-docker-to-containerd)
    
# Requirements

To be able to run the examples, you need to have the following software installed:
- ansible >= 2.8.0
- furyagent
- kubectl

OS on the target machine:
- Ubuntu 20.04 LTS
- RHEL 8

# Cluster Architecture

The cluster is composed of:

- 2 HAproxy load balancers
- 3 Master nodes
- 3 Worker nodes

In the master nodes we also deploy ETCD as a standalone systemd service.

Check the following files for a complete example:

- `hosts.ini`
- `haproxy.cfg`

# Install phases

The install phases are ordered, and each playbook has the order of the phases in the file name.

## Initialize PKI

First of all we need to initialize CAs certificates for Etcd and Master components.
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

## Install Container Runtime

In this step you can choose which container runtime you want to use:

- docker
- containerd

We recommend containerd as docker is deprecated and will be removed starting from Kubernetes version 1.24.

### Docker

Run the `1.docker.yml` playbook with:

```bash
ansible-playbook 1.docker.yml
```

## Containerd

Run the `1.containerd.yml` playbook with:

```bash
ansible-playbook 1.containerd.yml
```

## Install Load Balancer

To install the load balancer run the `2.load-balancer.yml` playbook with:

```bash
ansible-playbook 2.load-balancer.yml
```

## Provision Master and Worker Nodes

Now that all the prerequisites are installed, we can provision the master and worker nodes.

The `3.cluster.yml` playbook needs some variables to be set in the `Control plane configuration` step and in the `Kubernetes join nodes` step.

```yaml
- name: Control plane configuration
  hosts: master
  vars:
    kubernetes_pod_cidr: "172.16.128.0/17"
    kubernetes_svc_cidr: "172.16.0.0/17"
    kubernetes_cluster_name: 'sighup'
    kubernetes_control_plane_address: 'control-plane.example.com:6443'
    kubernetes_kubeconfig_path: "./"
  roles:
    - kube-control-plane
  tags:
    - kube-control-plane
  
- name: Kubernetes join nodes
  hosts: nodes
  vars:
    kubernetes_control_plane_address: 'control-plane.example.com:6443'
    kubernetes_bootstrap_token: "{{ hostvars[groups.master[0]].kubernetes_bootstrap_token.stdout }}"
    kubernetes_ca_hash: "{{ hostvars[groups.master[0]].kubernetes_ca_hash.stdout }}"
  roles:
    - kube-worker
  tags:
    - kube-worker
```

Run the playbook with:

```bash
ansible-playbook 3.cluster.yml
```

# Utilities

## How to migrate from Docker to Containerd

To migrate from docker to containerd , there is an example playbook in this directory `99.migrate-docker-to-containerd.yml`.

It must be executed **one node at a time**:

```bash
ansible-playbook 99.migrate-docker-to-containerd.yml --limit worker1
```