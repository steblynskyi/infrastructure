#!/usr/bin/env bash

region=us-east-1
KOPS_STATE_STORE=s3://steblynskyi-prod-infrastructure/terraform/prod/
NAME=kube.steblynskyi.com
PRIVATE_SUBNET_IDS=subnet-1,subnet-2,subnet-3
PUBLIC_SUBNET_IDS=subnet-1,subnet-2,subnet-3
NAT_1A=nat-02d2295c3a68c61ff
NAT_1B=nat-0a53dfff5a43fb725
NAT_1C=nat-001f0bbf583038892

export AWS_PROFILE=steblynskyi

kops create cluster \
   --state=$KOPS_STATE_STORE \
   --zones=us-east-1a,us-east-1b,us-east-1c \
   --master-zones=us-east-1a,us-east-1b,us-east-1c \
   --networking=flannel-vxlan \
   --master-count=3 \
   --master-size=t3.small \
   --node-size=t3.small \
   --node-count=3 \
   --cloud=aws \
   --topology=private \
   --vpc=vpc-123 \
   --associate-public-ip=false \
   --master-security-groups="sg-2" \
   --node-security-groups="sg-2" \
   --api-loadbalancer-type=public \
   --authorization=RBAC \
   --name=$NAME \
   --dns-zone=steblynskyi.com \
   --subnets=$PRIVATE_SUBNET_IDS \
   --utility-subnets=$PUBLIC_SUBNET_IDS \
   --dry-run \
   -o yaml > $NAME.yaml

printf " ✅ DONE\n"