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
#. ../libs/openssl.sh
#. ../libs/httpd.sh
#. ../libs/mcrypt.sh
#. ../libs/libjpeg.sh
#. ../libs/libpng.sh

#. ../libs/libiconv.sh
#. ../libs/libxslt.sh
#. ../libs/libxml2.sh


. ../libs/php5.sh