# vSphere controller manager

This katalog deploys the [vSphere controller manager](https://github.com/kubernetes/cloud-provider-vsphere) on a VMware Kubernetes cluster backed by vCenter.

## Requirements

- Kubernetes = `1.20.x`
- Kustomize >= `v3.5.3`
- control plane and the nodes must be provisioned with cloud-provider `external` on `kubeadm.yaml`
- `disk.EnableUUID=1` on all nodes.
- VM Hardware should be at version 15 or higher.
- VMware tools installed on all nodes.
- `/etc/hostname` must match the name of the nodes, so in our case the FQDN.
- vCenter >= `v67u3`.

## Image repository and tag

* vSphere cloud controller manager image: `gcr.io/cloud-provider-vsphere/cpi/release/manager:v1.20.0`

## Setting credentials

Credential are set via configmap, patch it via Kustomize:

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: vsphere-cloud-config
  namespace: kube-system
data:
  vsphere.conf: |-
    # Global properties in this section will be used for all specified vCenters unless overriden in VirtualCenter section.
    global:
      port: 443
      insecureFlag: true

    # vcenter section
    vcenter:
      10.20.30.40:
        server: 10.20.30.40
        user: k8s@vsphere.local
        password: "REDACTED"
        datacenters:
          - Datacenter
```

The user to be able to interact with vCenter and to be able to provision volumes dynamically needs these permissions:

https://docs.vmware.com/en/VMware-vSphere-Container-Storage-Plug-in/2.0/vmware-vsphere-csp-getting-started/GUID-0AB6E692-AA47-4B6A-8CEA-38B754E16567.html

## Install

After setting all prerequisites and password, you can apply all manifests to the cluster.

## Check that everything is working after installation

Run these commands, the output should be similar:

```bash
# kubectl describe nodes | grep "ProviderID"
ProviderID: vsphere://4204a018-f286-cf3c-7f2d-c512d9f7d90d
ProviderID: vsphere://42040e14-690a-af11-0b8e-96b09570d8a3
ProviderID: vsphere://4204bf92-3a32-5e50-d2c1-74e446f4f741
ProviderID: vsphere://4204eaf5-883c-23c7-50a8-868988cc0ae0
ProviderID: vsphere://42049175-beac-93eb-b6cb-5a827184f1e3
```

Now your cluster is ready to run workloads.
