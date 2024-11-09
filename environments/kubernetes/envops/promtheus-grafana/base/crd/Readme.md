Below are the CRS's for kube-prometheus 
CRD's responsibilities as follows

alertManageralertmanagerconfig: This CRD is used to define Alertmanager configuration. It allows you to define receivers, notification templates, and other settings related to alerting. You should use this CRD when you need to configure the Alertmanager instance in your Kubernetes cluster.

alertmanager: This CRD is used to define an Alertmanager instance in your Kubernetes cluster. It allows you to specify the version, replicas, and other settings for the Alertmanager instance. You should use this CRD when you need to deploy an instance of the Alertmanager in your Kubernetes cluster.

podmonitor: This CRD is used to define a set of pods to be monitored by Prometheus. It allows you to specify labels to select the pods to be monitored and endpoints to scrape. You should use this CRD when you need to monitor a specific set of pods in your Kubernetes cluster.

probe: This CRD is used to define a custom HTTP or TCP probe for a pod or service. It allows you to specify the endpoint, request headers, and other settings for the probe. You should use this CRD when you need to customize the health checks for a pod or service.

prometheus: This CRD is used to define a Prometheus instance in your Kubernetes cluster. It allows you to specify the version, replicas, storage configuration, and other settings for the Prometheus instance. You should use this CRD when you need to deploy an instance of Prometheus in your Kubernetes cluster.

prometheusrule: This CRD is used to define a set of alerting rules for Prometheus. It allows you to specify labels to select the targets to be monitored and conditions to trigger alerts. You should use this CRD when you need to define custom alerting rules for your Kubernetes cluster.

servicemonitor: This CRD is used to define a set of services to be monitored by Prometheus. It allows you to specify labels to select the services to be monitored and endpoints to scrape. You should use this CRD when you need to monitor a specific set of services in your Kubernetes cluster.

thanosruler: This CRD is used to define a Thanos ruler instance in your Kubernetes cluster. It allows you to specify the version, replicas, storage configuration, and other settings for the Thanos ruler instance. You should use this CRD when you need to deploy an instance of Thanos ruler in your Kubernetes cluster for long term storage and query of Prometheus metrics.


https://github.com/prometheus-operator/kube-prometheus/tree/main