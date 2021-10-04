FROM debian:buster

ENV BASEDIR=/code
ENV CONFIG=${BASEDIR}/config
ENV SCRIPTS=${BASEDIR}/scripts
ENV NGINX_ROOT=/etc/nginx
# ENV RUN_SCRIPT=${SCRIPTS}/run.sh
ENV INSTALL_SCRIPT=${SCRIPTS}/install.sh

WORKDIR	${BASEDIR}
EXPOSE 443

# TODO move in install.sh
RUN \
	apt-get update && \
	apt-get -y install \
		apt-utils \
		nginx \
		openssl \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*

COPY config ${CONFIG}
COPY scripts ${SCRIPTS}

RUN bash ${INSTALL_SCRIPT}

CMD ["nginx", "-g", "daemon off;"]
# CMD /bin/bash
