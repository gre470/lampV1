FROM nickistre/ubuntu-lamp:14.04
MAINTAINER Nicholas Istre <nicholas.istre@e-hps.com>

# Install xdebug for php debugging
RUN apt-get install -y php5-xdebug
ADD xdebug_settings.ini /etc/php5/mods-available/
RUN php5enmod xdebug_settings

RUN curl -s "https://packagecloud.io/install/repositories/phalcon/stable/script.deb.sh" | sudo bash
RUN sudo apt-get install php5-phalcon

VOLUME /var/www/html
VOLUME /var/log/apache2
VOLUME /var/lib/mysql
VOLUME /var/log/mysql