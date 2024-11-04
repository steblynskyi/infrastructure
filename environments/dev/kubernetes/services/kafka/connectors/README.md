## Creating Connector 

We can create connector using CURL or Postman. 

- Using CURL : curl -i -X POST -H "Accept:application/json" -H "Content-Type:application/json" https://kafka-debezium-connect.dev-steblynskyi.com/connectors/ @-d @connector-name.json

- Using postman,Add https://kafka-debezium-connect.dev-steblynskyi.com/connectors/ in URL field, and add "Accept:application/json" , "Content-Type:application/json" headers, and in Body use "raw" and paste connector configuration. 

## Deleting Connector 

- Using CURL : curl -i -X DELETE https://kafka-debezium-connect.dev-steblynskyi.com/connectors/connector-name

## Updating Connector 

- Using CURL : curl -i -X PUT -H "Accept:application/json" -H "Content-Type:application/json" https://kafka-debezium-connect.dev-steblynskyi.com/connectors/connector-name/config -d @connector-name.json

While updating connector we need to pass only Config section of a connector. 
the file should like below 
{
    "database.history.kafka.bootstrap.servers": "kafka:9092",
    "connector.class": "io.debezium.connector.postgresql.PostgresConnector",
    "slot.name": "folio_replication_slot",
    "tasks.max": "1",
    "internal.key.converter.schemas.enable": "false",
    "decimal.handling.mode": "double",
    .......
}

 