FROM docker.elastic.co/logstash/logstash:8.10.3

RUN logstash-plugin install --version 3.0.3 logstash-filter-json_encode
RUN logstash-plugin install --version 2.3.0 logstash-input-kinesis
RUN logstash-plugin install --version 2.0.2 logstash-output-opensearch
RUN logstash-plugin install --version 3.1.4 logstash-output-exec

CMD ["/usr/local/bin/docker-entrypoint", "--config.reload.automatic", "-f", "/logstash/conf.d/config/logstash.conf"]
