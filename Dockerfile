FROM alpine:3.5
MAINTAINER smizy

RUN set -x \
    && apk update \
    && apk add --no-cache \
        bash \
        mariadb \
        mariadb-client \
        pwgen \
        su-exec \
        tzdata \
    && mkdir -p /run/mysqld /docker-entrypoint-initdb.d \
    && chown -R mysql /run/mysqld  \
    && chmod 777 /run/mysqld \    
    # don't reverse lookup hostnames, they are usually another container
    && sed -Ei 's/^(bind-address|log)/#&/' /etc/mysql/my.cnf \
	&& echo -e "skip-host-cache\\nskip-name-resolve" | awk '{ print } $1 == "[mysqld]" && c == 0 { c = 1; system("cat") }' /etc/mysql/my.cnf > /tmp/my.cnf \
	&& mv /tmp/my.cnf /etc/mysql/my.cnf 
   
COPY entrypoint.sh /usr/local/bin/

VOLUME ["/var/lib/mysql"]

EXPOSE 3306

ENTRYPOINT ["entrypoint.sh"]
CMD ["mysqld"]