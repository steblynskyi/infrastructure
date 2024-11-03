locals {
  desired_size    = "3"
  max_size        = "5"
  min_size        = "1"
  max_unavailable = "1"

  ami_type      = "AL2_x86_64"
  capacity_type = "ON_DEMAND"
  disk_size     = "50"

  instance_types = ["c5a.xlarge"]

  eks-node-private-userdata = <<USERDATA
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="==MYBOUNDARY=="
--==MYBOUNDARY==
Content-Type: text/x-shellscript; charset="us-ascii"
#!/bin/bash -xe
sudo /etc/eks/bootstrap.sh --apiserver-endpoint '${data.aws_eks_cluster.cluster.endpoint}' --b64-cluster-ca '${data.aws_eks_cluster.cluster.certificate_authority[0].data}' '${data.aws_eks_cluster.cluster.name}'
echo "Running custom user data script" > /tmp/me.txt
yum install -y amazon-ssm-agent
echo "yum'd agent" >> /tmp/me.txt
yum update -y
systemctl enable amazon-ssm-agent && systemctl start amazon-ssm-agent
date >> /tmp/me.txt
--==MYBOUNDARY==--
USERDATA
}