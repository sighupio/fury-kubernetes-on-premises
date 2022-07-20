# vSphere CSI package - maintenance

To maintain the vSphere CSI package, you should follow these steps.

- Check available versions of the upstream project here: <https://docs.vmware.com/en/VMware-vSphere-Container-Storage-Plug-in/2.3/rn/vmware-vsphere-container-storage-plugin-23-release-notes/index.html>
- In the page above, there is a link for the vanilla manifests, use them to update the package

You can use `go-getter` to download the files more easily:

```bash
# install go-getter if you don't have it in your system:
$ go get github.com/hashicorp/go-getter
# Get the files. Pay attention to the ?ref= parameter, you should put the right tag there.
$ go-getter "github.com/kubernetes-sigs/vsphere-csi-driver.git?ref=v2.5.1//manifests//vanilla" /tmp/vanilla
```
