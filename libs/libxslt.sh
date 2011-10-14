#!/bin/bash

if [ ! -f $SOURCE_DIR/${LIBXSLT} ]; then 
  echo "$SOURCE_DIR/${LIBXSLT} is not present, fix it and run again"
  exit
fi

[ -d $BUILD_DIR ] || mkdir $BUILD_DIR
rm -fr $BUILD_DIR/${LIBXSLT_DIR}*
cp $SOURCE_DIR/${LIBXSLT} $BUILD_DIR
cd $BUILD_DIR
tar xfz  ${LIBXSLT}
cd $BUILD_DIR/${LIBXSLT_DIR}

echo Installing ${LIBXSLT_DIR}:

./configure --prefix=${INSTALL_DIR}/${LIBXSLT_DIR} \
  --with-libxml-prefix=${INSTALL_DIR}/${LIBXML2_DIR} \
  --with-libxml-include-prefix=${INSTALL_DIR}/${LIBXML2_DIR}/include/ \
  --with-libxml-libs-prefix=${INSTALL_DIR}/${LIBXML2_DIR}/lib/ \

make
make install

cd ..
rm -fr   $BUILD_DIR/${LIBXSLT_DIR}*

exit

if [ -d ${INSTALL_DIR}/${LIBXSLT_DIR} ]; then 
  echo "* ${INSTALL_DIR}/${LIBXSLT_DIR} is already there. Do you want to re-install it ? (Y/N) "
  read OPTION
  if [ "$OPTION" == "Y" ] ; then
	cp -r ${INSTALL_DIR}/${LIBXSLT_DIR} ${INSTALL_DIR}/${LIBXML2_DIR}.pre.reinstall
  fi
fi