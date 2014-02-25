docker-rabbitmq-ssl-stomp
=========================

RabbitMQ Docker image with SSL and STOMP enabled

# Usage

Build:

```
$ docker build --rm -t rabbitmq .
```

Run (any of the -p statements can be omitted if not needed):

```
docker run -d -p :5672 -p :5671 -p :61613 -p :61614 -p :15672 rabbitmq:latest
```
