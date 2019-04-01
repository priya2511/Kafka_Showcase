FROM  mohana2511/kafka-prototype:kafka

ENV ZK_BIN_DIR=/opt/zookeeper/bin \
    ZK_CONFIG_DIR=/etc/con/zookeeper \
    ZK_DATA_DIR=/var/lib/zookeeper/data \
    ZK_DATA_LOG_DIR=/var/lib/zookeeper/log \
    ZK_LOG_DIR=/var/log/zookeeper
COPY scripts/* ${ZK_BIN_DIR}/ 
RUN set -x \
    && mkdir -p ${ZK_CONFIG_DIR} ${ZK_DATA_DIR} ${ZK_DATA_LOG_DIR} ${ZK_LOG_DIR} \
    && chown -R :root ${ZK_CONFIG_DIR} /var/lib/zookeeper ${ZK_LOG_DIR} \
    && chmod -R g+rwx ${ZK_CONFIG_DIR} ${ZK_DATA_DIR} ${ZK_DATA_LOG_DIR} ${ZK_LOG_DIR} \
    && chmod g+x ${ZK_BIN_DIR}/*.sh


# add custom metrics reporters
RUN set -x \
    && wget https://raw.githubusercontent.com/prometheus/jmx_exporter/master/example_configs/zookeeper.yaml \
    && mv ./zookeeper.yaml ${PROMETHEUS_EXPORTER_DIR}/zookeeper.yaml
