#!/bin/bash

# http://www.kevinkorb.com/post/24 step6

if [ -d ${INSTALL_DIR}/${LIBPNG_DIR} ]; then 
  echo "* ${INSTALL_DIR}/${LIBPNG_DIR} is already there. Do you want to re-install it ? (Y/N) "
  read OPTION
  if [ "$OPTION" == "Y" ] ; then
	cp -r ${INSTALL_DIR}/${LIBPNG_DIR} ${INSTALL_DIR}/${LIBPNG_DIR}.pre.reinstall
  fi
#  exit
fi

if [ ! -f $SOURCE_DIR/${LIBPNG} ]; then 
  echo "$SOURCE_DIR/${LIBPNG} is not present, fix it and run again"
  exit
fi

[ -d $BUILD_DIR ] || mkdir $BUILD_DIR
rm -fr $BUILD_DIR/${LIBPNG_DIR}
cp $SOURCE_DIR/${LIBPNG} $BUILD_DIR
cd $BUILD_DIR
tar xfz  ${LIBPNG}
cd $BUILD_DIR/${LIBPNG_DIR}

echo Installing ${LIBPNG_DIR}:

./configure --prefix=${INSTALL_DIR}/${LIBPNG_DIR} \


make
make install

cd ..
#http://ftp.gnu.org/pub/gnu/libiconv/rm -fr   $BUILD_DIR/${LIBPNG_DIR}*


