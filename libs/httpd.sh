#!/bin/bash

# check httpd's dependencies

# OPENSSL
#if [ ! -d ${INSTALL_DIR}/${OPENSSL_DIR} ]; then
#  echo "OpenSSL IS NOT installed!"
#  echo "Please build openssl"
#  exit
#fi

# CRONOLOG
#if [ ! -d ${INSTALL_DIR}/${CRONOLOG} ]; then
#  echo "Cronolog IS NOT installed!"
#  echo "Please run build_cronolog.sh"
#  exit
#fi

if [ ! -f $SOURCE_DIR/${APACHE} ]; then 
  echo "$SOURCE_DIR/${APACHE} is not present, fix it and run again"
  exit
fi

[ -d $BUILD_DIR ] || mkdir $BUILD_DIR
rm -fr $BUILD_DIR/httpd*
cp $SOURCE_DIR/${APACHE} $BUILD_DIR
cd $BUILD_DIR
tar xfz  ${APACHE}
cd $BUILD_DIR/httpd*
pwd ; ls

echo "Installing HTTPD"

#export LDFLAGS='-L/sw/bin/glibtool'

./configure \
  --prefix=${INSTALL_DIR}/${APACHE_DIR}  \
  --enable-info \
  --enable-rewrite \
  --enable-proxy \
  --enable-proxy-http \
  --enable-ssl \
  --enable-so \
  --with-layout=Apache \ 
  --enable-ssl \

# FAILS
--with-ssl=${INSTALL_DIR}/${OPENSSL_DIR} 

# NOT USED IN ORDER TO HAVE MULTIPLE HTTPD VERSION RUNNING W/ DIFF CONFIG
#	--sysconfdir=/etc/httpd/conf \  

#  --enable-ldap \

make
make install

cd ..
rm -fr $COMPILE_DIR/${APACHE_DIR}*