FROM stayallive/php:7.2

MAINTAINER Stefan Warnat <sysadmin@redoo-networks.com>

ENV TIMEZONE=Europe/Berlin

RUN apt-get update -yqq \
	&& apt-get install zip lftp -yqq

# Install mysql driver
# Here you can install any other extension that you need

RUN docker-php-ext-enable pdo_mysql gd

#RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
#	php composer-setup.php
#	php -r "unlink('composer-setup.php');"
	
# Install phpunit, the tool that we will use for testing
# RUN curl --location --output /usr/local/bin/phpunit https://phar.phpunit.de/phpunit.phar \
#	&& chmod +x /usr/local/bin/phpunit

ENTRYPOINT ["/entrypoint.sh"]
CMD ["php", "-a"]