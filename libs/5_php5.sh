#!/bin/bash


# check php's dependencies
#if [ ! -f ${INSTALL_DIR:0:10}/lib/libc-client.a ]; then
#  echo "IMAP C Client IS NOT installed!"
#  echo "Please run build_imap.sh"
#  exit
#fi


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

#   --enable-pear
#   --with-pear=/usr/local/bin
#  --with-imap \
#  --with-apxs2=/usr/local/${APACHE}/bin/apxs \

#   when using yum's zlib-devel package
#     --with-zlib=/usr/include \
#	when using custom installed software
#	  --with-zlib=/usr/local/zlib-1.2.3 \
#	GD from custom install
#     --with-gd=/usr/local/gd-2.0.33 \


./configure  \
  --prefix=${INSTALL_DIR}/${PHP} \
  --with-apxs2=${INSTALL_DIR}/${APACHE}/bin/apxs \
  --with-config-file-path=/etc/php5 \
  --with-config-file-scan-dir=/etc/php.d \
  --with-pear \
  --with-zip=/usr \
  --with-zlib=/usr \
  --with-libxml-dir=/usr/lib/ \
  --with-xml \
  --with-mysql=/usr/ \
  --with-regex=system \
  --with-xslt \
  --enable-pdo=shared \
  --with-pdo-mysql=shared \
  --with-sqlite=shared \
  --with-pdo-sqlite=shared \
  --enable-zip \
  --enable-sysvshm=yes \
  --enable-sysvsem=yes \
  --enable-soap \
  --enable-sockets \
  --enable-ftp \
  --enable-force-cgi-redirect=yes \
  --enable-debug=no \
  --enable-xslt \
#  --with-gd=/usr \

make
make install
make install-cli # http://ar.php.net/manual/en/features.commandline.php


cd ..
rm -fr $COMPILE_DIR/${PHP}


#Notice: Following unknown configure options were used:
#--with-zip=/usr
#--with-xml
#Check './configure --help' for available options
