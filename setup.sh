#!/bin/bash
apt-get install -y language-pack-en-base
locale-gen en_US.UTF-8
dpkg-reconfigure locales
LC_ALL=en.US.UTF-8
add-apt-repository ppa:ondrej/php-zts
apt-get update
apt-get install php7.0-zts php7.0-zts-dev

apt-get install git
git clone https://github.com/krakjoe/pthreads.git
cd pthreads
phpize
./configure
make -j8
make install

mkdir -p /etc/php/7.0-zts/conf.d/
echo "extension=pthreads.so" > /etc/php/7.0-zts/conf.d/pthreads.ini
cd /etc/php/7.0-zts/cli/conf.d
sudo ln -s ../../conf.d/pthreads.ini

apt-get install mysql-server
mysql_secure_installation
apt-get install php7.0-zts-mysql
apt-get install php7.0-zts-odbc

cd ~
git clone https://github.com/tncrazvan/php_socket_io.git
cd ~/php_socket_io
mysql < utils/database/dump/local-sql -u root -p


apt-get install apache2
apt-get install libapache2-mod-php7.0
cd /var/www/html
rm ./* -fr
apt-get install git
git clone https://github.com/tncrazvan/glorep.git
mv ./glorep/* ./
chmod 777 ./*
cd sites/default/
cp default.settings.php settings.php
cd /var/www/html
apt-get install php7.0-gd
apt-get install php7.0-mysql
apt-get install php7.0-mbstring
cp ./mysqld.cnf /etc/mysql/mysql.conf.d/mysqld.cnf
service mysql restart
