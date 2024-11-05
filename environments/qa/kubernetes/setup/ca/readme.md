openssl genrsa -out taras.key 4096
openssl req -new -key taras.key -out taras.csr -subj '/CN=taras/O=qaops'
openssl x509 -req -in taras.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out taras.crt -days 365

kubectl create clusterrolebinding cluster-admin-qaops --clusterrole=cluster-admin --user=taras -n kube-system --context qa


###RUN THIS
kubectl config set-cluster kube.qa-steblynskyi.com --server=https://api-kube.qa-steblynskyi.com
kubectl config set-cluster kube.qa-steblynskyi.com --certificate-authority=ca.crt
kubectl config set-credentials taras --client-key=taras.key --client-certificate=taras.crt
kubectl config set-context kube.qa-steblynskyi.com --user=taras --cluster kube.qa-steblynskyi.com
kubectl config use-context kube.qa-steblynskyi.com