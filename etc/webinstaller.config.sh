############
# LOCATIONS
###########

INSTALL_DIR=/usr/local/webstack
BUILD_DIR=${PWD%/*}/build # http://www.coderanch.com/t/497589/Linux-UNIX/parent-dir-shell
SOURCE_DIR=${PWD%/*}/sources
LIBPHP=$INSTALL_DIR/${APACHE}/modules/libphp5.so

###################
# SOFTWARE VERSIONS
###################

# http://cronolog.org/
#CRONOLOG=$(cd ${SOURCE_DIR} && ls -r cronolog-*  | head -1)
#CRONOLOG_DIR=$()

# http://www.openssl.org/
OPENSSL=$(cd ${SOURCE_DIR} && ls -r openssl-*  | head -1)
OPENSSL_DIR=$(echo ${OPENSSL} | sed 's/.tar.gz//g')

# http://httpd.apache.org/
APACHE=$(cd ${SOURCE_DIR} && ls -r httpd-*.gz$*  | head -1)
APACHE_DIR=$(echo ${APACHE} | sed 's/.tar.gz//g')

#CCLIENT=c-client
# http://www.washington.edu/imap/
#IMAP=$(cd ${SOURCE_DIR} && ls -r c-client.tar.Z | head -1)
#echo $IMAP

# http://www.zlib.net/
#ZLIB=$(cd ${SOURCE_DIR} && ls -r zlib-*  | head -1)
#echo $ZLIB

# http://www.ijg.org/files/
LIBJPEG=$(cd ${SOURCE_DIR} && ls -r jpegsrc.*  | head -1)
LIBJPEG_DIR=$(echo ${LIBJPEG} | sed 's/.tar.gz//g' | sed 's/jpegsrc.v/jpeg-/g')

# http://sourceforge.net/projects/libpng/files/
LIBPNG=$(cd ${SOURCE_DIR} && ls -r libpng-*  | head -1)
LIBPNG_DIR=$(echo ${LIBPNG} | sed 's/.tar.gz//g')

# http://sourceforge.net/projects/mcrypt/files/Libmcrypt/
MCRYPT=$(cd ${SOURCE_DIR} && ls -r libmcrypt-*  | head -1)
MCRYPT_DIR=$(echo ${MCRYPT} | sed 's/.tar.gz//g')

#http://ftp.gnu.org/pub/gnu/libiconv/
LIBICONV=$(cd ${SOURCE_DIR} && ls -r libiconv-*  | head -1)
LIBICONV_DIR=$(echo ${LIBICONV} | sed 's/.tar.gz//g')

# http://xmlsoft.org/
LIBXSLT=$(cd ${SOURCE_DIR} && ls -r libxslt-*  | head -1)
LIBXSLT_DIR=$(echo ${LIBXSLT} | sed 's/.tar.gz//g')

# http://xmlsoft.org/
LIBXML2=$(cd ${SOURCE_DIR} && ls -r libxml2-*  | head -1)
LIBXML2_DIR=$(echo ${LIBXML2} | sed 's/.tar.gz//g')

# http://php.net/
PHP=$(cd ${SOURCE_DIR} && ls -r php-*  | head -1)
PHP_DIR=$(echo ${PHP} | sed 's/.tar.gz//g')



#MYSQL_CLI_RHEL=MySQL-client-standard-5.0.27-0.rhel3.i386.rpm
#MYSQL_SER_RHEL=MySQL-server-standard-5.0.27-0.rhel3.i386.rpm
#MYSQL_DEV_RHEL=MySQL-devel-standard-5.0.27-0.rhel3.i386.rpm
#MYSQL_SHA_RHEL=MySQL-shared-standard-5.0.27-0.rhel3.i386.rpm


# GENERIC RMP http://dev.mysql.com/downloads/mysql/5.0.html#downloads
# 
#MYSQL_CLI_GEN=MySQL-client-5.0.27-0.i386.rpm
#MYSQL_SER_GEN=MySQL-server-5.0.27-0.i386.rpm
#MYSQL_DEV_GEN=MySQL-devel-5.0.27-0.i386.rpm
#MYSQL_SHA_GEN=MySQL-shared-5.0.27-0.i386.rpm

#GPGME=gpgme

# !!
#MODEVASIVE=mod_evasive_1.10.1

# http://www.maxmind.com/app/c
# http://www.maxmind.com/download/geoip/api/c/
#
#GEOIP=GeoIP-1.4.4


# http://www.maxmind.com/app/perl
# http://www.maxmind.com/download/geoip/api/perl/
#
#GEOIPPERLMOD=Geo-IP-1.33


# http://www.maxmind.com/app/mod_geoip
# http://www.maxmind.com/download/geoip/api/mod_geoip2/
#
#GEOIPAPI=mod_geoip2_1.2.3

