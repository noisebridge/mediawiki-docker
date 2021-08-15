ARG VERSION="1.31"
FROM mediawiki:${VERSION}-fpm


RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y unzip && \
    curl -f -s -o /usr/local/bin/composer https://getcomposer.org/composer-1.phar && \
    chmod 755 /usr/local/bin/composer

COPY composer.local.json /var/www/html/composer.local.json

RUN composer install

RUN git clone --depth 1 https://github.com/marcidy/mwGoogleSheet.git /var/www/html/extensions/mwGoogleSheet
RUN git clone --depth 1 -b REL1_36 https://github.com/wikimedia/mediawiki-extensions-StopForumSpam.git /var/www/html/extensions/StopForumSpam


