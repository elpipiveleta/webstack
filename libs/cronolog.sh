#!/bin/bash

if [ -f ./0_common.sh ] ; then 
  . ./0_common.sh 
else
  echo "ERROR loading build_common.sh"
  exit 
fi

if [ ! -f $SOURCE_DIR/${CRONOLOG}.tar.gz ]; then 
  echo "$SOURCE_DIR/${CRONOLOG}.tar.gz is not present, fix it and run again"
  exit
fi

rm -fr $COMPILE_DIR/${CRONOLOG}
tar xfz $SOURCE_DIR/${CRONOLOG}.tar.gz

echo Installing CRONOLOG:

cd ${CRONOLOG}

./configure \
  --prefix=${INSTALL_DIR}/${CRONOLOG}

make
make install

cd ..

rm -fr $COMPILE_DIR/${CRONOLOG}
