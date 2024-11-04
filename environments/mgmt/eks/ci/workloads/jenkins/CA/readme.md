# To Connect Jenkins with EKS cluster : Create service account and use the token from service account along with below ca.crt

# EKS ca Cert to configure in Jenkins 

aws eks describe-cluster --name <cluster_name> --query cluster.certificateAuthority.data --output text > ca.crt.b64

openssl base64 -d -A -in ca.crt.b64 -out ca.crt


