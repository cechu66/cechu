#!bin/bash
###Script install Nginx###
####Date: 12/04/2017###########
###############################
yum install nginx -y
service start nginx
chkconfig nginx on
