#!/bin/bash

set -e

function getShinageBranch {
    CMDLINE=`cat /proc/cmdline`
    for ARG in $CMDLINE
    do
        case $ARG in
            SHINAGE_BRANCH=*)
            echo -n "${ARG//SHINAGE_BRANCH=}"
            return
            ;;
        esac
    done
    echo -n "master"
}
BRANCH=`getShinageBranch`

# install composer globally
cd /usr/local/bin
rm -f composer composer.phar
wget -O composer https://getcomposer.org/composer.phar
chmod 755 composer

# git clone
cd /var/www/shinage-player
git fetch --all
git reset --hard origin/$BRANCH


# install dependencies
cd /var/www/shinage-player/www/signage
composer install --optimize-autoloader

# cleanup old site definitions
rm -rf /etc/nginx/sites-enabled/*

# install nginx configuration
mkdir -p /etc/nginx/conf.d/
cp -f /var/www/shinage-player/nginx/diagnostic-htpasswd /etc/nginx/conf.d/diagnostic-htpasswd
cp -f /var/www/shinage-player/nginx/site-signage /etc/nginx/sites-enabled/site-signage


#TODO? restart nginx ?

