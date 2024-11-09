#!/bin/bash
ID="${POD_NAME#"kraft-"}"
if [[ -f "/bitnami/kafka/data/meta.properties" ]]; then
    export KAFKA_CFG_NODE_ID="$(grep "node.id" /bitnami/kafka/data/meta.properties | awk -F '=' '{print $2}')"
else
    export KAFKA_CFG_NODE_ID="$((ID + 0))"
fi

echo "Broker Id"
echo $KAFKA_CFG_NODE_ID
export ADVERTISED_EXTERNAL_PORT=$((19094 + $KAFKA_CFG_NODE_ID))
# KAFKA_CFG_ADVERTISED_LISTENERS is a comma-separated list of URIs we will advertise to producers and consumers. If not set, it will use the value for "listeners" if configured. Otherwise, it will use the value returned from querying the broker.
export KAFKA_CFG_ADVERTISED_LISTENERS="PLAINTEXT://$POD_NAME.kraft-headless.kafka.svc.cluster.local:9092,EXTERNAL://$KAFKA_EXTERNAL_DOMAIN:$ADVERTISED_EXTERNAL_PORT"
echo $KAFKA_CFG_ADVERTISED_LISTENERS
exec /entrypoint.sh /run.sh