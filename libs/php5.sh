#!/bin/bash

if [ ! -f $SOURCE_DIR/$PHP ]; then 
  echo "$SOURCE_DIR/${PHP} is not present, fix it and run again"
  exit
fi

[ -d $BUILD_DIR ] || mkdir $BUILD_DIR
rm -fr $BUILD_DIR/php*
cp $SOURCE_DIR/${PHP} $BUILD_DIR
cd $BUILD_DIR
tar xfz  ${PHP}
cd $BUILD_DIR/php*
pwd ; ls

echo Installing PHP:

# check / prepare configuration environment, back up current library for quick failure recovery
[ -d /etc/php5 ] || mkdir /etc/php5
[ -d /etc/php.d ] || mkdir /etc/php.d
if [ -f ${LIBPHP} ]; then
  cp $LIBPHP $LIBPHP.pre-update
fi

export PATH="/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:$PATH" 
export CFLAGS=`xml2-config --cflags`
export LIBS=`xml2-config --libs` 

./configure  \
  --prefix=${INSTALL_DIR}/${PHP_DIR} \
  --with-apxs2=${INSTALL_DIR}/${APACHE_DIR}/bin/apxs \
  --with-iconv=${INSTALL_DIR}/${LIBICONV_DIR}\
  --with-libxml-dir=${INSTALL_DIR}/${LIBXML2_DIR}/bin/xml2-config \
  --with-xslt \
  --with-config-file-scan-dir=/etc/php.d \
  --with-pear \
  --with-mysql=/usr/local/mysql \
  --with-mysqli=/usr/local/mysql/bin/mysql_config \
  --with-pdo-mysql=/usr/local/mysql/bin/mysql_config \
  --with-gd \
  --with-jpeg-dir=${INSTALL_DIR}/${LIBJPEG_DIR} \
  --with-png-dir=${INSTALL_DIR}/${LIBPNG_DIR} \
  --enable-mbstring \
  --with-curl \
  --enable-intl \

make
make test
make install
make install-cli # http://ar.php.net/manual/en/features.commandline.php

#exit

echo "Add this to httpd.conf:"
echo "
# PHP is an HTML-embedded scripting language which attempts to make it
LoadModule php5_module modules/libphp5.so

# Cause the PHP interpreter to handle files with a .php extension.
AddHandler php5-script .php
AddType text/html .php

# update DirectoryIndex to consider index.php
DirectoryIndex index.html index.html.var index.php
"

cd ..
rm -fr $COMPILE_DIR/${PHP}*


exit






#  --with-config-file-path=/etc/php5 \
#  --with-mcrypt-dir=${INSTALL_DIR}/${MCRYPT_DIR} \

#  --with-zip=/usr \
#  --with-regex=system \
#  --with-zlib \
#  --enable-zip \
#  --enable-sysvshm=yes \
#  --enable-soap \
#  --enable-sockets \
#  --enable-ftp \
#  --enable-force-cgi-redirect=yes \
#  --enable-debug=yes \
#  --enable-xslt \
#  --with-pdo \
#  --with-pdo-mysql \
#  --enable-pdo=shared \
#  --with-pdo-mysql=shared \
#  --with-mysqli=/usr/local/mysql/bin/mysql_config \


#checking whether to enable embedded MySQLi support... no
#mysql_config not found
#configure: error: Please reinstall the mysql distribution
# -> --with-mysqli=/usr/local/mysql/bin/mysql_config \
#  --with-sqlite=shared \
#  --with-pdo-sqlite=shared \
#    --enable-pdo \
#    --with-pdo_mysql=/usr/local/mysql/ \
#    --with-mysqli=/usr/local/mysql-5.1.35-osx10.5-x86/bin/mysql_config \ 
#    --with-mysql=/usr/local/mysql-5.1.35-osx10.5-x86

#  --with-imap \
#  --with-apxs2=/usr/local/${APACHE}/bin/apxs \

#   when using yum's zlib-devel package
#     --with-zlib=/usr/include \
#	when using custom installed software
#	  --with-zlib=/usr/local/zlib-1.2.3 \
#	GD from custom install
#     --with-gd=/usr/local/gd-2.0.33 \






# FROM CONFIGURE
# checking libxml2 install dir... /usr/local/webstack/libxml2/lib
# checking for xml2-config path... /usr/bin/xml2-config
# FIX!
# mv /usr/bin/xml2-config /usr/bin/xml2-config.default
# ln -s //usr/local/webstack/libxml2/bin/xml2-config /usr/bin/xml2-config
#otool -L  ` which php `  | grep web
#	/usr/local/webstack/libpng-1.5.5/lib/libpng15.15.dylib (compatibility version 21.0.0, current version 21.0.0)
#	/usr/local/webstack/jpeg-8c/lib/libjpeg.8.dylib (compatibility version 12.0.0, current version 12.0.0)
#	/usr/local/webstack/libxml2-2.7.8/lib/libxml2.2.dylib (compatibility version 10.0.0, current version 10.8.0)

# check php's dependencies
#if [ ! -f ${INSTALL_DIR:0:10}/lib/libc-client.a ]; then
#  echo "IMAP C Client IS NOT installed!"
#  echo "Please run build_imap.sh"
#  exit
#fi
