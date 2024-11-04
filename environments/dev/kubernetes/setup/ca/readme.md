openssl genrsa -out taras.key 4096
openssl req -new -key taras.key -out taras.csr -subj '/CN=taras/O=devops'
openssl x509 -req -in taras.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out taras.crt -days 365

kubectl create clusterrolebinding cluster-admin-devops --clusterrole=cluster-admin --user=taras -n kube-system --context dev


###RUN THIS
kubectl config set-cluster kube.dev-steblynskyi.com --server=https://api-kube.dev-steblynskyi.com
kubectl config set-cluster kube.dev-steblynskyi.com --certificate-authority=ca.crt
kubectl config set-credentials taras --client-key=taras.key --client-certificate=taras.crt
kubectl config set-context kube.dev-steblynskyi.com --user=taras --cluster kube.dev-steblynskyi.com
kubectl config use-context kube.dev-steblynskyi.com