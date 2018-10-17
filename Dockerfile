FROM rabbitmq:3.7.7-management-alpine
ARG DEPLOYMENT
LABEL "Deployment"="$DEPLOYMENT"


ADD ./certs /etc/certs/
COPY config/rabbitmq.config /etc/rabbitmq/rabbitmq.config

RUN chown rabbitmq:rabbitmq /etc/certs \
	&& chown rabbitmq:rabbitmq /etc/certs/* \
	&& chmod 700 /etc/certs \
	&& chmod 600 /etc/certs/*


RUN rabbitmq-plugins enable --offline rabbitmq_mqtt rabbitmq_federation_management rabbitmq_stomp
