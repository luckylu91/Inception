FROM debian:buster

ENV BASEDIR=/code
ENV CONFIG=${BASEDIR}/config
ENV SCRIPTS=${BASEDIR}/scripts
ENV NGINX_ROOT=/etc/nginx

WORKDIR	${BASEDIR}
EXPOSE 443

RUN \
	apt-get update && \
	apt-get -y install \
		apt-utils \
		nginx \
		openssl \
    vim \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*

COPY config ${CONFIG}
COPY scripts ${SCRIPTS}

RUN bash ${SCRIPTS}/install.sh

# CMD ["nginx", "-g", "daemon off;"]
CMD service nginx start; /bin/bash
