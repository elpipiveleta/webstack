#!/bin/bash


#if [ `id -u` != "0" ]; then
#  echo "Please run as Root"
#  exit
#fi


#########
# CONFIG
#########

. ../etc/webinstaller.config.sh

##########
# INCLUDES
##########

#. ../libs/common.sh

#. ../libs/3_openssl.sh
#. ../libs/4_httpd.sh
. ../libs/5_php5.sh