# Accessing Kubernetes Dashboard with Token

This example shows how to access Kubernetes dashboard with authentication using a Bearer Token. 
Example uses `cluster-admin` ClusterRole which is already created after cluster provisioning.   

0. Run furyctl to get packages: `$ furyctl install --dev`

1. `rbac.yml` creates a ServiceAccount and binds it to the ClusterRole `cluster-admin`.

2. Run `make build` to see output of kustomize with your modifications.

3. Once you're satisfied with generated output run `make deploy` to deploy it on your cluster.

4. Acces dashboard first running:

`$ kubectl proxy`

Then visiting following endpoint from your browser:

`http://localhost:8001/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/`

5. To get Bearer Token of the user `admin-user` run: 

`$ kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep admin-user | awk '{print $1}')` 

6. Copy&paste token to `Enter token` field at login page. Now you can login and see Kubernetes dashboard.
