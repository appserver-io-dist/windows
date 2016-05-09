@ECHO OFF
ECHO Starting appserver.io runner ...

set root=%~dp0
set php="%root%\php\php".exe
set ini="%root%\php\php".ini

%php% -c %ini% -dappserver.php_sapi=appserver "%root%/server".php -b="%root%/etc/appserver/conf.d/bootstrap-runner".xml -c="%root%/etc/appserver/appserver-runner".xml %*