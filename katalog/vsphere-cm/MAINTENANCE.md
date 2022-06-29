# vSphere cloud controller manager - maintenance

To maintain the vSphere cloud controller manager, you should follow these steps.

- Check available versions of the upstream project here: <https://github.com/kubernetes/cloud-provider-vsphere/releases>
- Select the correct version based on the compatibility skew you want to maintain.
- Get the manifests from the `releases` directory in the repository <https://github.com/kubernetes/cloud-provider-vsphere/tree/master/releases>.
- Use them to update the package
