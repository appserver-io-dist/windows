@ECHO OFF
ECHO Installing appserver.io...

cd "$INSTALL_PATH"

set php=php\php.exe
set ini=php\php.ini

%php% -c %ini% -dappserver.php_sapi=appserver server.php -s install %*