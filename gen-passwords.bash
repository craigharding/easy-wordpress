#!/bin/bash

# want new files to be read-only by owner
umask 377

# openssl puts a newline char at the end of the string which messes up Portainer
echo -n `openssl rand -base64 20` > portainer/portainer_admin_password
openssl rand -base64 -out mysql/mysql_root_password 20
openssl rand -base64 -out mysql/wp_db_password 20
cp -p mysql/wp_db_password wordpress/wp_db_password