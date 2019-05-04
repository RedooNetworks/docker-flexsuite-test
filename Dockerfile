FROM stayallive/php:7.2

MAINTAINER Stefan Warnat <sysadmin@redoo-networks.com>

ENV TIMEZONE=Europe/Berlin

RUN apt-get update -yqq \
	&& apt-get install zip lftp python-pip -yqq \
	&& pip install awscli \
	&& mkdir /sonarscanner

# Install mysql driver
# Here you can install any other extension that you need

RUN docker-php-ext-enable pdo_mysql gd

ADD https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-3.3.0.1492-linux.zip /sonarscanner/

COPY conf/sonar-scanner.properties	/sonarscanner/conf/sonar-scanner.properties

#RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
#	php composer-setup.php
#	php -r "unlink('composer-setup.php');"
	
# Install phpunit, the tool that we will use for testing
# RUN curl --location --output /usr/local/bin/phpunit https://phar.phpunit.de/phpunit.phar \
#	&& chmod +x /usr/local/bin/phpunit


ENTRYPOINT ["/entrypoint.sh"]
CMD ["php", "-a"]