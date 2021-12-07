FROM logstash:7.10.1

RUN logstash-plugin install --version 0.3.1 logstash-filter-kubernetes && \
    logstash-plugin install --version 4.1.17 logstash-input-file && \
    logstash-plugin install --version 3.0.3 logstash-filter-json_encode && \
    logstash-plugin install --version 3.1.4 logstash-output-exec && \
    logstash-plugin install --version 2.1.2 logstash-input-kinesis && \
    logstash-plugin install --version 3.2.1 logstash-filter-fingerprint

USER root
ENV TINI_VERSION v0.19.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini
ENTRYPOINT ["/tini", "--"]

USER logstash
CMD ["/usr/local/bin/docker-entrypoint", "--config.reload.automatic", "-f", "/logstash/conf.d/config/logstash.conf"]
