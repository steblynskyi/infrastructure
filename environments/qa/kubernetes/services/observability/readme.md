Order of deployments :
- ClusterRole & Cluster Role bindings
- Prometheus Config map
- Prometheus Statefulset & Service ( Thanos as sidecar )
- Thanos Querier
- Store Gateway
- Thanos Ruler
- Thanos Compact
- Grafana
- Alert Manager ( if not exists already)

Prometheus Adapter Configuration :

 - seriesQuery : The main query name we use in prometheus.
 - seriesFilters : If you want to filter above filter by any means, ( ex : if you want to filter by namespace or by any regular expression)
 - name ( as ) : The name you want to use in HPA. You can use any name which make sense for HPA
 - metricsQuery : This query output populate in custom metrics end point. and will be used by HPA at end.

 Useful curl operations :
 - To list out custom metrics list
    kubectl get --raw '/apis/custom.metrics.k8s.io/v1beta1/' | jq .
 - To see the value of custom metric
    kubectl get --raw '/apis/custom.metrics.k8s.io/v1beta1/namespaces/ota/pods/*/bdcom_avarage_request_process_time' | jq .
 please note that response on above URL's populate only when there is data in prometheus at that point of time.

    Please find detailed information in below documentation
    # Source: https://github.com/kubernetes-sigs/prometheus-adapter/blob/master/docs/config-walkthrough.md
