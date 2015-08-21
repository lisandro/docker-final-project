# Base image
FROM ubuntu:14.04.2
# Author
MAINTAINER Lisandro Falconi <lfalconi@devspark.com>

# Install Apache, PHP, and supplementary programs. curl and lynx-cur are for debugging the container.
RUN apt-get update && apt-get install -y \
      apache2 \
      libapache2-mod-php5 \
      php5-mysql \
      php5-gd \
      php-pear \
      php-apc \
      php5-curl \
      curl \
      lynx-cur

# Enable apache mods.
RUN a2enmod php5
RUN a2enmod rewrite

# Set up the Apache environment variables
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid

ENV WORLD_API_DOCUMENT_ROOT /opt/www/worldapi/public/
ENV WORLD_API_SERVER_NAME api.world.com.ar

EXPOSE 80

# Copy site into place.
ADD worldapi /opt/www/worldapi

# Copy custom Apache config file
ADD apache2.conf /etc/apache2/apache2.conf

# Copy virtual host config file
ADD worldapi.conf /etc/apache2/sites-available/worldapi.conf

# Enable virtual host config
RUN a2ensite worldapi.conf

# App set up
ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

CMD /usr/sbin/apache2ctl -D FOREGROUND