# vSphere controller manager

This katalog deploy the vSphere controller manager on a VMware Kubernetes cluster backed by VCenter >= v67u3.

Docs:
- https://cloud-provider-vsphere.sigs.k8s.io/tutorials/kubernetes-on-vsphere-with-kubeadm.html
- https://vmware.github.io/vsphere-storage-for-kubernetes

You need to set on the control plane and the nodes the cloud-provider `external` on `kubeadm.yaml`

Prerequisites:

* `disk.EnableUUID=1` on all nodes.
* VM Hardware should be at version 15 or higher.
* VMware tools installed on all nodes.
* `/etc/hostname` must match the name of the nodes , so in our case the fqdn.

## Setting credentials

Credential are set via configmap, patch it via Kustomize:

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: cloud-config
  namespace: kube-system
data:
  vsphere.conf: |-
    [Global]
    insecure-flag = "true"

    [VirtualCenter "XX.XX.XX.XX"]
    datacenters = "datacenter"
    port = "443"
    user = "user"
    password = "password"
```

The user to be able to interact with VCenter and to be able to provision volumes dynamically needs these permissions:

### Dynamic Provisioning

| Roles |	Privileges |	Entities |	Propagate to Children |
|---|---|---|---|
|manage-k8s-node-vms |	Resource.AssignVMToPool, VirtualMachine.Config.AddExistingDisk, VirtualMachine.Config.AddNewDisk, VirtualMachine.Config.AddRemoveDevice, VirtualMachine.Config.RemoveDisk, VirtualMachine.Inventory.Create, VirtualMachine.Inventory.Delete, VirtualMachine.Config.Settings |	Cluster, Hosts, VM Folder |	Yes
|manage-k8s-volumes |	Datastore.AllocateSpace, Datastore.FileManagement (Low level file operations) |	Datastore |	No
|k8s-system-read-and-spbm-profile-view |	StorageProfile.View (Profile-driven storage view) |	vCenter |	No
|Read-only (pre-existing default role) |	System.Anonymous, System.Read, System.View |	Datacenter, Datastore Cluster, Datastore Storage Folder |	No


## Install

After setting all prerequisites and password, you can apply all manifests to the cluster.

## Check that everything is working after installation:

Run these commands, the output should be similar:

```bash
# kubectl describe nodes | grep "ProviderID"
ProviderID: vsphere://4204a018-f286-cf3c-7f2d-c512d9f7d90d
ProviderID: vsphere://42040e14-690a-af11-0b8e-96b09570d8a3
ProviderID: vsphere://4204bf92-3a32-5e50-d2c1-74e446f4f741
ProviderID: vsphere://4204eaf5-883c-23c7-50a8-868988cc0ae0
ProviderID: vsphere://42049175-beac-93eb-b6cb-5a827184f1e3
```

Now you cluster is ready run Kubernetes stuff!