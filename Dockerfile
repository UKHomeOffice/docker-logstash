FROM opensearchproject/logstash-oss-with-opensearch-output-plugin:7.13.4

RUN logstash-plugin install --version 0.3.1 logstash-filter-kubernetes && \
    logstash-plugin install --version 4.1.17 logstash-input-file && \
    logstash-plugin install --version 3.0.3 logstash-filter-json_encode && \
    logstash-plugin install --version 3.1.4 logstash-output-exec && \
    logstash-plugin install --version 2.1.2 logstash-input-kinesis && \
    logstash-plugin install --version 3.2.1 logstash-filter-fingerprint
