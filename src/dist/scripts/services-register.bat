@ECHO OFF
ECHO Now register Services for appserver.io...

cd "$INSTALL_PATH"

set nssm=php\nssm.exe

%nssm% install appserver "$INSTALL_PATH\php\php.exe"
%nssm% set appserver AppDirectory "$INSTALL_PATH"
%nssm% set appserver AppParameters -c php\php.ini "-dappserver.php_sapi=appserver" server.php
%nssm% set appserver Start SERVICE_DEMAND_START
%nssm% start appserver

ECHO Successfully registered Service appserver

%nssm% install appserver-php5-fpm "$INSTALL_PATH\php\php-cgi.exe"
%nssm% set appserver-php5-fpm AppDirectory "$INSTALL_PATH"
%nssm% set appserver-php5-fpm AppParameters -c php\php.ini -b 127.0.0.1:9010
%nssm% set appserver-php5-fpm Start SERVICE_DEMAND_START
%nssm% start appserver-php5-fpm

ECHO Successfully registered Service appserver-php5-fpm