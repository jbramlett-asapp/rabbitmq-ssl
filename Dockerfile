FROM rabbitmq:3.7.7-management-alpine
ARG DEPLOYMENT
LABEL "Deployment"="$DEPLOYMENT"


ADD ./certs /etc/ssl/certs/
ADD config/rabbitmq.config /etc/rabbitmq/rabbitmq.config

RUN chown rabbitmq:rabbitmq /etc/ssl/certs \
	&& chown rabbitmq:rabbitmq /etc/ssl/certs/* \
	&& chmod 710 /etc/ssl/certs \
	&& chmod 610 /etc/ssl/certs/*


RUN rabbitmq-plugins enable --offline rabbitmq_mqtt rabbitmq_federation_management rabbitmq_stomp
