@ECHO OFF
ECHO Now unregister Services for appserver.io...

cd "$INSTALL_PATH"

set nssm=php\nssm.exe

%nssm% stop appserver
%nssm% remove appserver confirm

ECHO Successfully unregistered Service appserver

%nssm% stop appserver-php5-fpm
%nssm% remove appserver-php5-fpm confirm

ECHO Successfully unregistered Service appserver-php5-fpm