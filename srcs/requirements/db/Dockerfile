FROM debian:buster

ENV BASEDIR=/code
ENV CONFIG=${BASEDIR}/config
ENV SCRIPTS=${BASEDIR}/scripts

WORKDIR	${BASEDIR}

# TODO install.sh
RUN \
	apt-get update && \
	apt-get -y install \
		mariadb-server \
    vim \
	&& apt-get -y clean \
	&& apt-get -y autoremove \
	&& rm -rf /var/lib/apt/lists/*

COPY config ${CONFIG}
COPY scripts ${SCRIPTS}

RUN bash ${SCRIPTS}/install.sh

# CMD ["/bin/bash", "--init-file", "scripts/run.sh"]
CMD ["/bin/bash", "scripts/run.sh"]
