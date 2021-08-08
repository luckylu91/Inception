FROM debian:buster

ENV BASEDIR=/code
ENV DEBIAN_FRONTEND noninteractive
WORKDIR	${BASEDIR}

# TODO move in install.sh
RUN \
	apt-get update && \
	apt-get -y install \
		# apache2 \
		curl \
		php-fpm \
		php-mysql \
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

COPY scripts ./scripts
RUN /bin/bash ./scripts/install.sh

# CMD ["/bin/bash"]
CMD ["/bin/bash", "--init-file", "scripts/run.sh"]
