rm -f $NGINX_ROOT/sites-available/default
rm -f $NGINX_ROOT/sites-enabled/default
cp $CONFIG/servers.conf $NGINX_ROOT/sites-available/servers.conf
cp -l $NGINX_ROOT/sites-available/servers.conf $NGINX_ROOT/sites-enabled/servers.conf

mkdir -p /etc/ssl

openssl req \
	-x509 \
	-newkey rsa:2048 \
	-nodes \
	-days 365 \
	-out /etc/ssl/certs/lzins_42_fr.crt \
	-keyout /etc/ssl/private/lzins_42_fr.key \
	-subj "/C=FR/ST=/L=Lyon/O=42/CN=lzins.42.fr"
