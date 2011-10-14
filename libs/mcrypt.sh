#!/bin/bash

# http://www.kevinkorb.com/post/24 - Step 6 - Install Mcrypt dependencies

if [ -d ${INSTALL_DIR}/${MCRYPT_DIR} ]; then 
  echo "* ${INSTALL_DIR}/${MCRYPT_DIR} is already there. Do you want to re-install it ? (Y/N) "
  read OPTION
  if [ "$OPTION" == "Y" ] ; then
	cp -r ${INSTALL_DIR}/${MCRYPT_DIR} ${INSTALL_DIR}/${MCRYPT_DIR}.pre.reinstall
  fi
#  exit
fi

if [ ! -f $SOURCE_DIR/${MCRYPT} ]; then 
  echo "$SOURCE_DIR/${MCRYPT} is not present, fix it and run again"
  exit
fi

[ -d $BUILD_DIR ] || mkdir $BUILD_DIR
rm -fr $BUILD_DIR/${MCRYPT_DIR}
cp $SOURCE_DIR/${MCRYPT} $BUILD_DIR
cd $BUILD_DIR
tar xfz  ${MCRYPT}
cd $BUILD_DIR/${MCRYPT_DIR}

echo Installing ${MCRYPT_DIR}:

./configure --prefix=${INSTALL_DIR}/${MCRYPT_DIR} \
  --disable-posix-threads \
  --enable-dynamic-loading \

make
make install

cd ..
rm -fr   $BUILD_DIR/${MCRYPT_DIR}*


exit

Libraries have been installed in:
   /usr/local/webstack/libmcrypt-2.5.8/lib

If you ever happen to want to link against installed libraries
in a given directory, LIBDIR, you must either use libtool, and
specify the full pathname of the library, or use the `-LLIBDIR'
flag during linking and do at least one of the following:
   - add LIBDIR to the `DYLD_LIBRARY_PATH' environment variable
     during execution
