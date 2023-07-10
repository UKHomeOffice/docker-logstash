FROM docker.elastic.co/logstash/logstash:8.8.1

RUN logstash-plugin install --version 3.0.3 logstash-filter-json_encode
RUN logstash-plugin install --version 2.2.1 logstash-input-kinesis
RUN logstash-plugin install --version 2.0.1 logstash-output-opensearch

CMD ["/usr/local/bin/docker-entrypoint", "--config.reload.automatic", "-f", "/logstash/conf.d/config/logstash.conf"]
