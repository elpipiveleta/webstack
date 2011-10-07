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

