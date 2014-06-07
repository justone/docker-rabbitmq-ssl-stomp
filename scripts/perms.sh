#!/bin/bash

# make sure the rabbitmq user owns directories that may be mounts

chown -R rabbitmq:rabbitmq /var/lib/rabbitmq/mnesia
chown -R rabbitmq:rabbitmq /var/log/rabbitmq
