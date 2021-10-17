FROM debian:buster

ENV BASEDIR=/code
ENV CONFIG=${BASEDIR}/config
ENV SCRIPTS=${BASEDIR}/scripts
ENV WORDPRESS_LOCATION=/var/www/html
ENV PHP_FPM_CONF_LOCATION=/etc/php/*/fpm/pool.d
ENV DEBIAN_FRONTEND noninteractive

WORKDIR	${BASEDIR}

# TODO move in install.sh
RUN \
	apt-get update && \
	apt-get -y install \
		# apache2 \
		curl \
		# //
		net-tools \
		mariadb-client \
		# //
		php-fpm \
		php-mysql \
		vim \
	# && service apache2 restart \
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

RUN /bin/bash ${SCRIPTS}/install.sh

# CMD ["/bin/bash"]
CMD ["/bin/bash", "--init-file", "scripts/run.sh"]
