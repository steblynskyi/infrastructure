#!/bin/bash
set -e

echo "Start deploying dashboard"
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.4/aio/deploy/recommended.yaml
printf " ✅ DONE\n"

DASH_URL=http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    # Linux os
   xdg-open ${DASH_URL}
elif [[ "$OSTYPE" == "darwin"* ]]; then
   # Mac OSX
  open ${DASH_URL}
else
  # if os not linux or mac run as windows
  start ${DASH_URL}
fi