!#bin/bash
###Script install PHP 7###
####Date: 12/04/2017###########
###############################
###Cai dat cac goi can thiet###
yum install -y bison libxml2-devel gcc libtool bzip2 openssl-devel bzip2-devel curl-devel libpng-devel libpng libpng-devel libicu-devel libjpeg libjpeg-devel libmcrypt-devel
FILES=/home
cd $FILES
wget http://hk1.php.net/distributions/php-7.1.3.tar.gz
gunzip php-7.1.3.tar.gz &&	tar -xvf php-7.1.3.tar
./configure --prefix=/usr/local/src/php7 --with-config-file-path=/usr/local/src/php7/etc/conf.d --enable-bcmath --with-bz2 --with-curl --enable-filter --with-gd --enable-gd-native-ttf --with-jpeg-dir --with-png-dir --enable-intl --enable-mbstring --with-mcrypt --enable-mysqlnd --with-mysql-sock=/var/lib/mysql/mysql.sock --with-mysqli=mysqlnd --with-pdo-mysql=mysqlnd --with-pdo-sqlite --disable-phpdbg --disable-phpdbg-webhelper --enable-opcache --with-openssl --enable-simplexml --with-sqlite3 --enable-xmlreader --enable-xmlwriter --enable-zip --with-zlib --with-apxs2=/etc/httpd/bin/apxs --enable-cgi --with-xsl=/usr/include/libxslt/
make
make install
###
sleep 5
echo "LoadModule php7_module modules/libphp7.so" >> /etc/httpd/conf.httpd
