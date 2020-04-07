FROM ubuntu:16.04

LABEL maintainer="hamidrez77@gmail.com"

ENV RADIUS_DB_ENGINE mysqli
ENV RADIUS_DB_HOST localhost
ENV RADIUS_DB_PORT 3306
ENV RADIUS_DB_USER radius
ENV RADIUS_DB_PASS radpass
ENV RADIUS_DB_NAME radius

RUN apt-get update && apt-get install -y nginx php php-common php-gd php-curl php-mail php-mail-mime php-pear php-db php-mysqlnd \
  wget unzip && \
  pear install DB && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /root/.cpan

RUN wget https://github.com/lirantal/daloradius/archive/master.zip && \
        unzip *.zip && \
        mv daloradius-master /var/www/daloradius && \
        chown -R www-data:www-data /var/www/daloradius && \
        chmod 644 /var/www/daloradius/library/daloradius.conf.php && \
        rm /etc/nginx/sites-enabled/default

COPY init.sh /
COPY run.sh /
RUN chmod +x /init.sh && chmod +x /run.sh
COPY etc/nginx/radius.conf /etc/nginx/sites-enabled/

EXPOSE 80

ENTRYPOINT ["/run.sh"]




