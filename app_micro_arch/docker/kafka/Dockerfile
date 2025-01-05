FROM bitnami/kafka:latest

ENV KAFKA_CFG_AUTO_CREATE_TOPICS_ENABLE=true
ENV KAFKA_CFG_NUM_PARTITIONS=3

EXPOSE 9092

# Команда запуска (по умолчанию уже задана в образе Bitnami)
# ENTRYPOINT ["/opt/bitnami/scripts/kafka/entrypoint.sh"]
# CMD ["kafka-server-start.sh", "/opt/bitnami/kafka/config/server.properties"]
