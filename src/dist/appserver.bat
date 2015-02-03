@ECHO OFF
ECHO Starting appserver.io...

set php=php\php.exe
set ini=php\php.ini

%php% -c %ini% -dappserver.php_sapi=appserver server.php %*