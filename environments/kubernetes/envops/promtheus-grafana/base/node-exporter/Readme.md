Node Exporter is a Prometheus exporter that collects system-level metrics from a node in a Kubernetes cluster. It runs as a daemonset on each node and exposes metrics such as CPU usage, memory usage, disk I/O, network I/O, and other system-level statistics.

The Node Exporter metrics can provide insights into the performance and health of the underlying node infrastructure, which can be useful for diagnosing issues and optimizing resource utilization.

Here are some examples of the metrics that Node Exporter exposes:

CPU usage: Percentage of CPU time spent in user space, system space, idle, and other states
Memory usage: Amount of memory in use, including the amount of memory used by specific processes
Disk I/O: Number of read and write operations, as well as the number of bytes read and written
Network I/O: Number of incoming and outgoing packets, as well as the number of bytes sent and received
Filesystem usage: Amount of disk space used and available for each mounted filesystem
By default, Node Exporter exposes metrics on port 9100, which can be scraped by Prometheus or other monitoring tools.