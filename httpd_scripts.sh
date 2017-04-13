!#bin/bash
###Script install Apache 2.4###
####Date: 12/04/2017###########
###############################
###Cai dat cac goi can thiet###
yum install -y gcc wget yum-utils man prce-devel
FILES=/home
cd $FILES
wget http://mirrors.viethosting.com/apache/httpd/httpd-2.4.25.tar.gz
wget http://mirrors.viethosting.com/apache//apr/apr-1.5.2.tar.gz
wget http://mirrors.viethosting.com/apache//apr/apr-util-1.5.4.tar.gz
gunzip httpd-2.4.25.tar.gz &&	tar -xvf httpd-2.4.25.tar
gunzip apr-1.5.2.tar.gz && tar -xvf apr-1.5.2.tar
gunzip apr-util-1.5.4.tar.gz && tar -xvf apr-util-1.5.4.tar
###Make configure file
cd httpd-2.4.25
./configure --prefix=/etc/httpd --with-included-apr --enable-suexec --with-suexec-caller=apache --with-suexec-docroot=/var/www --with-suexec-logfile=/etc/httpd/logs/suexec.log
make
make install
####
sleep 5
groupadd -g 25 apache && useradd -c "Apache Server" -d /var/www -g apache -s /bin/false -u 79 apache   ###(group id)
cp $FILES/httpd-2.4.25 /etc/httpd/bin/suexec
chgrp apache /etc/httpd/bin/suexec && chmod  4574 /etc/httpd/bin/suexec
echo "PATH=$PATH:/etc/httpd/bin/" >> ~/.bash_profile
source ~/.bash_profile
apachectl -k start
