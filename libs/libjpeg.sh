#!/bin/bash

# http://www.kevinkorb.com/post/24 step6

if [ -d ${INSTALL_DIR}/${LIBJPEG_DIR} ]; then 
  echo "* ${INSTALL_DIR}/${LIBJPEG_DIR} is already there. Do you want to re-install it ? (Y/N) "
  read OPTION
  if [ "$OPTION" == "Y" ] ; then
	cp -r ${INSTALL_DIR}/${LIBJPEG_DIR} ${INSTALL_DIR}/${LIBJPEG_DIR}.pre.reinstall
  fi
#  exit
fi

if [ ! -f $SOURCE_DIR/${LIBJPEG} ]; then 
  echo "$SOURCE_DIR/${LIBJPEG} is not present, fix it and run again"
  exit
fi

[ -d $BUILD_DIR ] || mkdir $BUILD_DIR
rm -fr $BUILD_DIR/${LIBJPEG_DIR}*
cp $SOURCE_DIR/${LIBJPEG} $BUILD_DIR
cd $BUILD_DIR
tar xfz  ${LIBJPEG}
cd $BUILD_DIR/${LIBJPEG_DIR}

echo Installing ${LIBJPEG_DIR}:

./configure --prefix=${INSTALL_DIR}/${LIBJPEG_DIR} \
  --enable-shared

make
make install

cd ..
rm -fr   $BUILD_DIR/${LIBJPEG_DIR}*


