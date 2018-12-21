
# Metric Server Katalog

Metric Server is a cluster-wide aggregator of resource usage metrics for pods and nodes. 
These are the same metrics that you can access by using `kubectl top`. Metric server 
collects metrics from the Summary API, exposed by Kubelet on each node.


## Requirements

- Kubernetes >= `1.10.0`
- Kustomize >= `v1`


## Image repository and tag

* Metric Server image: `gcr.io/google_containers/metrics-server-amd64:v0.3.1`
* Metric Server repo: https://github.com/kubernetes/kubernetes/tree/master/cluster/addons/metrics-server 
* Metric Server documentation: https://kubernetes.io/docs/tasks/debug-application-cluster/core-metrics-pipeline/ 


## Configuration

Fury distribution Metric Server is deployed with following configuration:

- Replica number : `1`
- Metrics are scraped from Kubelets every `30s` 
- Skips verifying Kubelet CA certificates


## Deployment

You can deploy Metric Server by running following command in the root of the project:

`$ kustomize build | kubectl apply -f -`


## License

For license details please see [LICENSE](https://sighup.io/fury/license) 
