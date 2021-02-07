FROM mysql:latest
USER root
COPY --chown=root:root ./mysql_root_password /root/mysql_root_password
COPY --chown=root:root ./wp_db_password /root/wp_db_password
COPY --chown=root:root ./.my.cnf /root/.my.cnf
