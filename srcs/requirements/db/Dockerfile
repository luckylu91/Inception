FROM debian:buster

ENV BASEDIR=/code
WORKDIR	${BASEDIR}

RUN \
	apt-get update && \
	apt-get -y install \
		mariadb-server \
	&& apt-get -y clean \
	&& apt-get -y autoremove \
	&& rm -rf /var/lib/apt/lists/*

COPY scripts ./scripts

CMD ["/bin/bash", "--init-file", "scripts/run.sh"]
