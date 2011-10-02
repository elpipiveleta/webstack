<?php

system('clear') ;

# to be fetch from somewhere
$phpversion="5.1.6" ;
$phpversion="5.2.8" ; // mango & kiwi (64 bit)

$httpdversion="2.0.59" ;
$httpdversion="2.2.11" ;

# APACHE ENVIRONMENT
####################

$installdir="/usr/local/webstack" ;
#$installdir="/usr/local" ;

$httpdbin="$installdir/httpd-".$httpdversion."/bin/apachectl" ;

echo "**HTTPD Checks:**\n\n";

echo "1.- Self compiled httpd is executable: \n" ;
if ( is_executable($httpdbin) ) {
  echo "    OK ".$httpdbin." is executable\n" ;
} else {
  echo "    **ERROR**: ".$httpdbin." is not executable\n" ;
}


echo "2.- /usr/sbin/apachectl points to self compiled httpd: \n" ;
if ( is_link('/usr/sbin/apachectl') ) {
  echo "    OK /usr/sbin/apachectl is a symlink and points to" ;
  echo  readlink('/usr/sbin/apachectl')."\n" ;
}else{
  echo "    **ERROR**: /usr/sbin/apachectl is not present, it SHOULD be a symlink to ".$httpdbin."\n" ;
}

echo "3.- /etc/init.d/httpd points to $httpdbin bin \n" ;
if ( is_link('/etc/init.d/httpd') ) {
  if ( readlink('/etc/init.d/httpd') == $httpdbin ) {
    echo "    OK /etc/init.d/httpd is a symlink and points to" ;
    echo readlink('/etc/init.d/httpd') ."\n" ;
  }else{
    echo "    **ERROR***: /etc/init.d/httpd is pointing to ".readlink('/etc/init.d/httpd')." and it should be pointing to $httpdbin containing chkconfig's  management definition  \n" ;
  }
}else{
  echo "    **ERROR**: /etc/init.d/httpd is not present, and it should be pointing to $httpdbin containing chkconfig's management definition \n" ;
}

echo "4.- ".$installdir."/httpd-".$httpdversion."/conf config dir symlinks to /etc/httpd/conf\n" ;
if ( is_link ($installdir."/httpd-".$httpdversion."/conf") ) {
  echo "    OK: ".$installdir."/httpd-".$httpdversion."/conf is a symlink and points to ";
  echo readlink($installdir."/httpd-".$httpdversion."/conf") ."\n" ;
}else{
  echo "    **ERROR**: ".$installdir."/httpd-$httpdversion/conf SHOULD be a symlink to /etc/httpd/conf \n" ; 
}

echo "5.- /etc/httpd directory is in CVS server´s config dir:  TODO \n" ;
 

# PHP ENVIRONMENT
#################

$phpbin=$installdir."/php-".$phpversion."/bin/php" ;


echo "\n";
echo "**PHP Checks:**\n\n";

echo "1.- Self compiled php-cli is executable: \n" ;
if ( is_executable($phpbin) ) {
  echo "    OK ".$phpbin." is executable\n" ;
} else {
  echo "    **ERROR**: ".$phpbin." is not executable\n" ;
}

echo "2.- /usr/bin/php points to self compiled php-cli: \n" ;
if ( is_link('/usr/bin/php') ) {
  echo "    OK /usr/bin/php is a symlink and points to " ;
  echo readlink('/usr/bin/php') ."\n" ;
}else{
  echo "    **ERROR**: /usr/bin/php is not a symlink, it SHOULD be a symlink to ".$installdir."/php-$phpversion/bin/php \n" ;
}

echo "3.- /usr/local/bin/php points to self compiled php-cli: \n";
if ( is_link('/usr/local/bin/php') ) {
  echo "    OK /usr/local/bin/php is a symlink and points to " ;
  echo readlink('/usr/local/bin/php')."\n" ;
}else{
  echo "    **ERROR**: /usr/local/bin/php is not a symlink to the self compiled php-cli binary ".$installdir."/php-$phpversion/bin/php \n" ;
}

echo "4.- /etc/php5/php.ini points to common php.ini-prod \n" ;
if ( is_link('/etc/php5/php.ini') && readlink('/etc/php5/php.ini')=='/home/admin/common/apache/conf/php.ini-prod' ) {
  echo "    OK /etc/php5/php.ini is a symlink and points to " ;
  echo readlink('/etc/php5/php.ini')."\n" ;
}else{
  if ( is_link('/etc/php5/php.ini') ) {
    echo "    **ERROR**: /etc/php5/php.ini is not a symlink to the production version of php.ini, it's pointing to " ;
    echo readlink('/etc/php5/php.ini')."\n" ;
  }else{
    echo "    **ERROR**: /etc/php5/php.ini is not a symlink to /home/admin/common/apache/conf/php.ini-prod \n" ;
  } 
}

# MYSQL ENVIRENMENT
###################

#$phpbin="/usr/local/php-".$phpversion."/bin/php" ;

echo "\n";
echo "**MySQL Checks:**\n\n";

echo "1.- MySQL's data directory is /home/mysql \n" ;
//clearstatcache() ;
if ( is_link('/var/lib/mysql') ) {
  echo "    OK /var/lib/mysql is a symlink and points to " ;
  echo readlink('/var/lib/mysql')."\n"  ;
}else{
  echo "    **ERROR*** MySQL wont be backed up, move /var/lib/mysql/ to /home/mysql and symlink it \n" ;
}

echo "\n\n" ;
echo "** chkconfig configuration strings to be added to $httpdbin \n"  ;
echo "# Comments to support chkconfig on RedHat Linux \n" ;
echo "# chkconfig: 2345 64 36 \n" ;
echo "# description: httpd - apache server \n" ;
