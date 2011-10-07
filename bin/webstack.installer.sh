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

# FAILS
#. ../libs/common.sh

# FAILS when compiling apache
. ../libs/3_openssl.sh

. ../libs/4_httpd.sh
#. ../libs/5_php5.sh