FROM debian:buster

ENV BASEDIR=/code
ENV CONFIG=${BASEDIR}/config
ENV SCRIPTS=${BASEDIR}/scripts
ENV INSTALL_SCRIPT=${SCRIPTS}/install.sh

WORKDIR	${BASEDIR}

# TODO install.sh
RUN \
	apt-get update && \
	apt-get -y install \
		mariadb-server \
		# //
		net-tools \
		# //
    vim \
	&& apt-get -y clean \
	&& apt-get -y autoremove \
	&& rm -rf /var/lib/apt/lists/*

COPY config ${CONFIG}
COPY scripts ${SCRIPTS}

RUN bash ${INSTALL_SCRIPT}

CMD ["/bin/bash", "--init-file", "scripts/run.sh"]
