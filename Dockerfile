FROM docker.elastic.co/logstash/logstash:8.6.1

RUN logstash-plugin install --version 3.0.3 logstash-filter-json_encode
RUN logstash-plugin install --version 2.2.1 logstash-input-kinesis
RUN logstash-plugin install --version 2.0.0 logstash-output-opensearch

USER root
ENV TINI_VERSION v0.19.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini
ENTRYPOINT ["/tini", "--"]

USER logstash
CMD ["/usr/local/bin/docker-entrypoint", "--config.reload.automatic", "-f", "/logstash/conf.d/config/logstash.conf"]
