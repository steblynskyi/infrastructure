# your server name goes here
server=https://api-kube.dev-steblynskyi.com
# the name of the secret containing the service account token goes here
name=$1
secret_namespace=kubernetes-dashboard
cluster_name=kube.dev-steblynskyi.com
# make sure your current context set to correct cluster
ca=$(kubectl get secret/$name -n $secret_namespace -o jsonpath='{.data.ca\.crt}' --context $cluster_name)
token=$(kubectl get secret/$name -n $secret_namespace -o jsonpath='{.data.token}' --context $cluster_name | base64 --decode)
# namespace=$(kubectl get secret/$name -o jsonpath='{.data.namespace}' | base64 --decode)

echo "
apiVersion: v1
kind: Config
clusters:
- name: ${cluster_name}
  cluster:
    certificate-authority-data: ${ca}
    server: ${server}
contexts:
- name: ${cluster_name}
  context:
    cluster: ${cluster_name}
    user: ${cluster_name}
current-context: ${cluster_name}
users:
- name: ${cluster_name}
  user:
    token: ${token}
" > $2.dev.kubeconfig