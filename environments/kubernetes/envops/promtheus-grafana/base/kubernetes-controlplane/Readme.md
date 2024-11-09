Kubernetes Control Plane metrics are a set of metrics that provide insights into the performance and health of the Kubernetes Control Plane components, such as the API server, etcd, kube-scheduler, and kube-controller-manager.

Kubernetes Control Plane metrics include:

API Server metrics: Requests per second, response times, and error rates for the Kubernetes API server.

kube-scheduler metrics: The number of scheduled and unscheduled pods, scheduling latency, and scheduling error rates.

kube-controller-manager metrics: The number of completed and failed controller loops, and the latency of each loop.

Kubernetes Control Plane metrics differ from kube-state-metrics in that they focus specifically on the performance and health of the Kubernetes Control Plane components, rather than the state of Kubernetes objects. Kube-state-metrics generates metrics based on the state of Kubernetes objects, such as pods, services, and deployments, whereas Kubernetes Control Plane metrics provide insights into the performance and health of the components that make up the Kubernetes Control Plane.