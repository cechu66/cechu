!#bin/bash
###Script install Mysql5.7###
####Date: 12/04/2017###########
###############################
###Cai dat cac goi can thiet###
yum install install cmake gcc-c++ zlib-devel ncurses-devel rpm-rebuild boost-devel libaio
FILES=/home
wget http://dev.mysql.com/get/Downloads/MySQL-5.7/mysql-5.7.9.tar.gz
gunzip mysql-5.7.9.tar.gz && tar xvf mysql-5.7.9.tar
cd mysql-5.7.9
cmake . -DWITH_ARCHIVE_STORAGE_ENGINE=1 -DWITH_FEDERATED_STORAGE_ENGINE=1 -DWITH_BLACKHOLE_STORAGE_ENGINE=1 -DMYSQL_DATADIR=/var/lib/mysql/ -DCMAKE_INSTALL_PREFIX=/opt/mysql-5.7
-DMYSQL_UNIX_ADDR=/var/lib/mysql/mysql.sock -DENABLED_LOCAL_INFILE=OFF -DINSTALL_LAYOUT=STANDALONE -DENABLED_PROFILING=ON -DMYSQL_MAINTAINER_MODE=OFF -DWITH_DEBUG=OFF -DWITH_BOOST=/usr/include/boost
-DDOWNLOAD_BOOST=1
make
make install
exit
groupadd mysql
cp support-files/mysql.server /etc/init.d/mysqld
chmod +x /etc/init.d/mysqld
useradd -r -d /var/lib/mysql/ mysql
mkdir /opt/mysql-5.7/etc
cp $FILES/mysql-5.7.9/support-files/my-default.cnf.sh /opt/mysql-5.7/etc/my.cnf
/opt/mysql-5.7/bin/mysql_install_db --user=mysql --basedir=/opt/mysql-5.7/ --datadir=/var/lib/mysql/
echo "PATH=$PATH:/opt/mysql-5.7/bin/" >> ~/.bash_profile
source ~/.bash_profile
service mysqld start
chkconfig mysqld on
