# Execute below command to unset jmx port
unset JMX_PORT

# execute below commands 
/opt/bitnami/kafka/bin/kafka-topics.sh --bootstrap-server kafka:9092 --alter --topic folio.public.folios --partitions 12
/opt/bitnami/kafka/bin/kafka-topics.sh --bootstrap-server kafka:9092 --alter --topic guestprofile.public.guestprofiles --partitions 12
/opt/bitnami/kafka/bin/kafka-topics.sh --bootstrap-server kafka:9092 --alter --topic guestservices.public.taskservices --partitions 12
/opt/bitnami/kafka/bin/kafka-topics.sh --bootstrap-server kafka:9092 --alter --topic center01p.dbo.ReservationCustom --partitions 12
/opt/bitnami/kafka/bin/kafka-topics.sh --bootstrap-server kafka:9092 --alter --topic center01p.dbo.accounts --partitions 12
/opt/bitnami/kafka/bin/kafka-topics.sh --bootstrap-server kafka:9092 --alter --topic center01p.dbo.reservations --partitions 12
/opt/bitnami/kafka/bin/kafka-topics.sh --bootstrap-server kafka:9092 --alter --topic center01p.dbo.rooms --partitions 12
/opt/bitnami/kafka/bin/kafka-topics.sh --bootstrap-server kafka:9092 --alter --topic center01p.dbo.user_ref --partitions 12
/opt/bitnami/kafka/bin/kafka-topics.sh --bootstrap-server kafka:9092 --alter --topic reservation.public.customfields --partitions 12

/opt/bitnami/kafka/bin/kafka-configs.sh --bootstrap-server kafka:9092 --alter --entity-type topics --entity-name folio.public.folios --add-config min.insync.replicas=2
/opt/bitnami/kafka/bin/kafka-configs.sh --bootstrap-server kafka:9092 --alter --entity-type topics --entity-name guestprofile.public.guestprofiles --add-config min.insync.replicas=2
/opt/bitnami/kafka/bin/kafka-configs.sh --bootstrap-server kafka:9092 --alter --entity-type topics --entity-name guestservices.public.taskservices --add-config min.insync.replicas=2
/opt/bitnami/kafka/bin/kafka-configs.sh --bootstrap-server kafka:9092 --alter --entity-type topics --entity-name center01p.dbo.ReservationCustom --add-config min.insync.replicas=2
/opt/bitnami/kafka/bin/kafka-configs.sh --bootstrap-server kafka:9092 --alter --entity-type topics --entity-name center01p.dbo.accounts --add-config min.insync.replicas=2
/opt/bitnami/kafka/bin/kafka-configs.sh --bootstrap-server kafka:9092 --alter --entity-type topics --entity-name center01p.dbo.reservations --add-config min.insync.replicas=2
/opt/bitnami/kafka/bin/kafka-configs.sh --bootstrap-server kafka:9092 --alter --entity-type topics --entity-name center01p.dbo.rooms --add-config min.insync.replicas=2
/opt/bitnami/kafka/bin/kafka-configs.sh --bootstrap-server kafka:9092 --alter --entity-type topics --entity-name center01p.dbo.user_ref --add-config min.insync.replicas=2
/opt/bitnami/kafka/bin/kafka-configs.sh --bootstrap-server kafka:9092 --alter --entity-type topics --entity-name reservation.public.customfields --add-config min.insync.replicas=2

# Update connector configuration
# Update Kafka cluster configuration with config min.insync.replica =2 as env variable.


# To Update replication factor, Please use kafka contorl center cli - like below

- BROKERS="kafka:9092" kafkactl alter topic debezium_connectors_offsets --replication-factor 3

- BROKERS="kafka:9092" kafkactl alter topic debezium_connectors_statuses --replication-factor 3

- BROKERS="kafka:9092" kafkactl alter topic debezium_connectors --replication-factor 3

Output should look something like below
reassignment running for topic=debezium_connectors_offsets partition=0: replicas:[2 1 0] addingReplicas:[1 0] removingReplicas:[]
reassignment running for topic=debezium_connectors_offsets partition=24: replicas:[2 1 0] addingReplicas:[1 0] removingReplicas:[]

partition replicas have been reassigned


# To update existing topic configuration : use below command.

BROKERS="kafka:9092" kafkactl alter topic folio.public.folios --config retention.bytes=-1

BROKERS="kafka:9092" kafkactl alter topic center01p.dbo.reservations --config retention.bytes=-1