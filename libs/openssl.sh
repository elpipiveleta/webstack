#!/bin/bash

if [ -d ${INSTALL_DIR}/${OPENSSL_DIR} ]; then 
  echo "* ${INSTALL_DIR}/${OPENSSL_DIR} is already there. Do you want to re-install it ? (Y/N) "
  read OPTION
  if [ "$OPTION" == "Y" ] ; then
	cp -r ${INSTALL_DIR}/${OPENSSL_DIR} ${INSTALL_DIR}/${OPENSSL_DIR}.pre.reinstall
  fi
#  exit
fi

if [ ! -f $SOURCE_DIR/${OPENSSL} ]; then 
  echo "$SOURCE_DIR/${OPENSSL} is not present, fix it and run again"
  exit
fi

[ -d $BUILD_DIR ] || mkdir $BUILD_DIR
rm -fr $BUILD_DIR/${OPENSSL_DIR}
cp $SOURCE_DIR/${OPENSSL} $BUILD_DIR
cd $BUILD_DIR
tar xfz  ${OPENSSL}
cd $BUILD_DIR/${OPENSSL_DIR}

echo Installing ${OPENSSL_DIR}:

./config --prefix=${INSTALL_DIR}/${OPENSSL_DIR}

make 
sudo make install

echo    "* OpenSSL was installed @ ${INSTALL_DIR}/${OPENSSL_DIR}"
echo -n "* Version:" && ${INSTALL_DIR}/${OPENSSL_DIR}/bin/openssl version 

cd ..
rm -fr   $BUILD_DIR/${OPENSSL_DIR}*


