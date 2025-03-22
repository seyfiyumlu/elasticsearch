# docker-compose help page

## Contents :

- docker-compose.yml
- docker-compose.redis.yml
- docker-compose.rabbitmq.yml
- docker-compose.sonarqube.yml

### docker-compose.yml :

> install elastic stack (elastic search,kibana)

```
docker-compose up -d
docker-compose down
```

### docker-compose.redis.yml :

> install redis and redis-commander

```
docker-compose -f .\docker-compose.redis.yml up -d
docker-compose -f .\docker-compose.redis.yml down
```

### docker-compose.rabbitmq.yml :

> install rabbitmq

### docker-compose.sonarqube.yml :

> install sonarqube
