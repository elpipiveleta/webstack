#!/bin/bash

# http://xmlsoft.org/FAQ.html -> Developer corner

if [ -d ${INSTALL_DIR}/${LIBXML2_DIR} ]; then 
  echo "* ${INSTALL_DIR}/${LIBXML2_DIR} is already there. Do you want to re-install it ? (Y/N) "
  read OPTION
  if [ "$OPTION" == "Y" ] ; then
	cp -r ${INSTALL_DIR}/${LIBXML2_DIR} ${INSTALL_DIR}/${LIBXML2_DIR}.pre.reinstall
  fi
#  exit
fi

if [ ! -f $SOURCE_DIR/${LIBXML2} ]; then 
  echo "$SOURCE_DIR/${LIBXML2} is not present, fix it and run again"
  exit
fi

[ -d $BUILD_DIR ] || mkdir $BUILD_DIR
rm -fr $BUILD_DIR/${LIBXML2_DIR}*
cp $SOURCE_DIR/${LIBXML2} $BUILD_DIR
cd $BUILD_DIR
tar xfz  ${LIBXML2}
cd $BUILD_DIR/${LIBXML2_DIR}

echo Installing ${LIBXML2_DIR}:

./configure --prefix=${INSTALL_DIR}/${LIBXML2_DIR} \

make
make install

cd ..
rm -fr   $BUILD_DIR/${LIBXML2_DIR}*


