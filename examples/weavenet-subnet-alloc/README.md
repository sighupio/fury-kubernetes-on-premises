# Weave Net Subnet Allocation

This example shows how to allocate a specific subnet for Weave Net instead of its default range. 

0. Run furyctl to get packages: `$ furyctl install --dev`

1. Set environment variable IPALLOC_RANGE in `weavenet.yml` for the subnet you want to allocate. Be sure that range is not in use.

2. Run `make build` to see output of kustomize with your modifications.

3. Once you're satisfied with generated output run `make deploy` to deploy it on your cluster.
