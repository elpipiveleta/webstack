#!/bin/bash


if [ -d ${INSTALL_DIR}/openssl ]; then 
  echo "* ${INSTALL_DIR}/openssl is already there. Do you want to re-install it ? (Y/N) "
  read OPTION
  if [ "$OPTION" == "Y" ] ; then
	cp -r ${INSTALL_DIR}/openssl ${INSTALL_DIR}/openssl.pre.reinstall
  fi
#  exit
fi

if [ ! -f $SOURCE_DIR/${OPENSSL} ]; then 
  echo "$SOURCE_DIR/${OPENSSL} is not present, fix it and run again"
  exit
fi

[ -d $BUILD_DIR ] || mkdir $BUILD_DIR
rm -fr $BUILD_DIR/openssl*
cp $SOURCE_DIR/${OPENSSL} $BUILD_DIR
cd $BUILD_DIR
tar xfz  ${OPENSSL}
cd $BUILD_DIR/openssl*

echo Installing :

./config --prefix=${INSTALL_DIR}/openssl
make 
sudo make install

echo "* OpenSSL was installed @ ${INSTALL_DIR}/$OPENSSL"
echo "* Version:" && ${INSTALL_DIR}/openssl/bin/openssl version 

cd ..

#rm -fr   $BUILD_DIR/${OPENSSL}


