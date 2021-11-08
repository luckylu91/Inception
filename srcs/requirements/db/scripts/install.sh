#!/bin/bash

# change the data dir to MYSQL_VOLUME_DEST
# change the bind address to 0.0.0.0 (accept connections from any host on the network)
cp $CONFIG/50-server.cnf /etc/mysql/mariadb.conf.d/
