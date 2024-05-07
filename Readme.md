# docker-compose help page

## Contents :

- docker-compose.yml
- metricbeat.yml
- hearthbeat.yml

### docker-compose.yml :

> install elastic stack (elastic search,kibana)

### metricbeat.yml :

> install heartbeat plugin

```
heartbeat.monitors:
  - type: http
    name: "Elastic Search Monitor"
    schedule: "@every 5s"
    urls:
      - http://es01:9200
  - type: http
    name: "Kibana Monitor"
    schedule: "@every 5s"
    urls:
      - http://kibana:5601
  - type: http
    name: "ApiGateway Monitor"
    schedule: "@every 5m"
    urls:
      - https://sutasngmobile.sutas.com.tr/external-service/api/Token

processors:
  - add_cloud_metadata: ~

output.elasticsearch:
  hosts: "${ELASTICSEARCH_HOSTS}"
setup.kibana:
  hosts: "${KIBANA_HOSTS}"
```

### metricbeat.yml :

> install metricbeat plugin for docker containers.

```
metricbeat.config.modules:
  path: ${path.config}/modules.d/*.yml
  reload.enabled: false

metricbeat.modules:
  - module: elasticsearch
    xpack.enabled: true
    period: 10s
    hosts: ${ELASTIC_HOSTS}
    ssl.enabled: false
    metricsets:
      - ccr
      - cluster_stats
      - index
      - index_recovery
      - index_summary
      - ml_job
      - node_stats
      - shard
      - enrich

  - module: kibana
    metricsets:
      - stats
    period: 10s
    hosts: ${KIBANA_HOSTS}
    xpack.enabled: true

  - module: docker
    metricsets:
      - "container"
      - "cpu"
      - "diskio"
      - "healthcheck"
      - "info"
      #- "image"
      - "memory"
      - "network"
    hosts: ["unix:///var/run/docker.sock"]
    period: 10s
    enabled: true

processors:
  - add_host_metadata: ~
  - add_docker_metadata: ~

output.elasticsearch:
  hosts: ${ELASTIC_HOSTS}
  username: ${ELASTIC_USER}
  password: ${ELASTIC_PASSWORD}

```
