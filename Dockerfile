FROM       debian:jessie
MAINTAINER Nate Jones <nate@endot.org>

RUN echo "deb http://www.rabbitmq.com/debian/ testing main" > /etc/apt/sources.list.d/rabbitmq.list
RUN apt-get update
RUN apt-get install wget -y
RUN wget http://www.rabbitmq.com/rabbitmq-signing-key-public.asc
RUN apt-key add rabbitmq-signing-key-public.asc

RUN apt-get update
RUN apt-get install rabbitmq-server -y
RUN rabbitmq-plugins enable rabbitmq_web_stomp rabbitmq_stomp rabbitmq_management

RUN apt-get install openssl -y
ADD ssl /ssl

ADD rabbitmq.config /etc/rabbitmq/rabbitmq.config

ADD scripts /scripts
RUN chmod +x /scripts/*.sh

# ports are:
# * SSL AMQP
# * SSL STOMP
# * Management
EXPOSE 5671 61614 15672 5672 61613

CMD ["/scripts/run.sh"]
