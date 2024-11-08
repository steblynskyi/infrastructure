#!/bin/bash
set -e

export AWS_PROFILE=steblynskyi
export KOPS_STATE_STORE=s3://steblynskyi-prod-infrastructure/terraform/prod/
CLUSTER_NAME="kube.steblynskyi.com"
MANIFEST=${CLUSTER_NAME}.yaml

echo "Start creating kubernetes cluster"
kops create -f ./${MANIFEST}
echo "Assign ssh public key and update cluster state"
kops create secret --name ${CLUSTER_NAME} sshpublickey admin -i ~/.ssh/linux-admin-prod.pub
echo "Update Cluster"
kops update cluster --name ${CLUSTER_NAME} --yes
echo "You may need to run kops rolling-update cluster --name ${CLUSTER_NAME} --yes"
printf " ✅ DONE\n"