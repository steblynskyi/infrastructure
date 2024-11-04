openssl genrsa -out jenkins.key 4096

sudo openssl req -new -key jenkins.key -out jenkins.csr -subj '/CN=jenkins/O=jenkins-setup'

#Kubernetes ca.crt and ca.key mast present into Jenkins root folder
openssl x509 -req -in jenkins.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out jenkins.crt -days 730

openssl pkcs12 -export -out jenkins.pfx -inkey jenkins.key -in jenkins.crt -certfile ca.crt

kubectl create clusterrolebinding cluster-admin-jenkins-setup --clusterrole=cluster-admin --user=jenkins -n kube-system --context qa4

kubectl config set-credentials jenkins --client-key=jenkins.key --client-certificate=jenkins.crt
