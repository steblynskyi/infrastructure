#!/usr/bin/env bash

region=us-east-1
KOPS_STATE_STORE=s3://steblynskyi-dev-kube/terraform/dev/
NAME=kube.dev-steblynskyi.com

export AWS_PROFILE=taras

kops create cluster \
   --state=$KOPS_STATE_STORE \
   --zones=us-east-1a,us-east-1b \
   --master-zones=us-east-1a \
   --networking=flannel-vxlan \
   --kubernetes-version=1.15.0 \
   --master-count=1 \
   --master-size=t2.medium \
   --node-size=t2.large \
   --image 099720109477/ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-20180912 \
   --cloud=aws \
   --topology=private \
   --vpc=vpc-0ee7f38df6f4a14cf \
   --associate-public-ip=false \
   --master-security-groups=sg-0f45f1e1c2452d401 \
   --node-security-groups=sg-0f45f1e1c2452d401 \
   --api-loadbalancer-type=public \
   --authorization=RBAC \
   --name=$NAME \
   --dns-zone=dev-steblynskyi.com \
   --ssh-public-key=~/.ssh/DEV-admin.pub \
   --dry-run \
   -o yaml > $NAME.yaml