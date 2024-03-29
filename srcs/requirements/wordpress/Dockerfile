FROM debian:buster

ENV BASEDIR=/code
ENV CONFIG=${BASEDIR}/config
ENV SCRIPTS=${BASEDIR}/scripts
ENV PHP_FPM_CONF_LOCATION=/etc/php/*/fpm/pool.d
ENV DEBIAN_FRONTEND noninteractive

ENV MYSQL_USER=lzins
ENV MYSQL_PASSWORD=1337
ENV WORDPRESS_DATABASE=wordpress_db

WORKDIR	${BASEDIR}

RUN \
	apt-get update && \
	apt-get -y install \
		curl \
		# //
		net-tools \
		mariadb-client \
		# //
		php-fpm \
		php-mysql \
		vim \
	&& apt-get -y install \
		php-curl \
		php-gd \
		php-intl \
		php-mbstring \
		php-soap \
		php-xml \
		php-xmlrpc \
		php-zip \
	&& apt-get -y clean \
	&& apt-get -y autoremove \
	&& rm -rf /var/lib/apt/lists/*

COPY config ${CONFIG}
COPY scripts ${SCRIPTS}

RUN bash ${SCRIPTS}/install.sh

CMD ["/bin/bash", "--init-file", "/code/scripts/run.sh"]
