#!/bin/bash

# get the OS flavour
#
OS=`cat /etc/issue`
for i in $OS; do
# replace with mordor case fro OSes

  if [ $i == "Fedora" ]; then
    FLAVOUR="Fedora"
    echo Installing dependencies for $FLAVOUR;

  elif [ $i == "Red" ]; then
    FLAVOUR="Red"
    echo Installing dependencies for $FLAVOUR

  elif [ $i == "Debian" ] ; then
    FLAVOUR="Debian"
    echo "Installing dependencies for $FLAVOUR"
  fi

done


# TODO: ADD REMOVAL OF WEBSTACK RPM PACKAGES / DONE!


DEPENDENCIES="iftop iptraf wget autoconf libjpeg libjpeg-devel libpng libpng-devel zlib zlib-devel libxml2 libxml2-devel gd gd-devel lynx ImageMagick make gcc bison flex"


if [ $FLAVOUR == "Fedora" ]; then 
  yum install -y ${DEPENDENCIES}
  # "only for local dev"
  yum install -y mysql-devel mysql mysql-administrator mysql-server mysql-libs mysql-query-browser mytop mysql-gui-tools 
  yum remove  -y httpd-tools httpd
else
  if [ $FLAVOUR == "Red" ]; then 		
    # up2date install ${DEPENDENCIES}
    yum install -y ${DEPENDENCIES}   # RHEL with yum
  fi
fi
