#!/bin/bash

# http://www.kevinkorb.com/post/24 step6

if [ -d ${INSTALL_DIR}/${LIBICONV} ]; then 
  echo "* ${INSTALL_DIR}/${LIBICONV_DIR} is already there. Do you want to re-install it ? (Y/N) "
  read OPTION
  if [ "$OPTION" == "Y" ] ; then
	cp -r ${INSTALL_DIR}/${LIBICONV_DIR} ${INSTALL_DIR}/${LIBICONV_DIR}.pre.reinstall
  fi
#  exit
fi

if [ ! -f $SOURCE_DIR/${LIBICONV} ]; then 
  echo "$SOURCE_DIR/${LIBICONV} is not present, fix it and run again"
  exit
fi

[ -d $BUILD_DIR ] || mkdir $BUILD_DIR
rm -fr $BUILD_DIR/${LIBICONV_DIR}
cp $SOURCE_DIR/${LIBICONV} $BUILD_DIR
cd $BUILD_DIR
tar xfz  ${LIBICONV}
cd $BUILD_DIR/${LIBICONV_DIR}

echo Installing ${LIBICONV_DIR}:

./configure -q --enable-extra-encodings --prefix=${INSTALL_DIR}/${LIBICONV_DIR} \


make
make install

cd ..
#rm -fr   $BUILD_DIR/${LIBPNG_DIR}*


