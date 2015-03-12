@ECHO OFF
ECHO Starting PHP FastCGI...

set php=php\php-cgi.exe
set ini=php\php.ini

%php% -c %ini% -b 127.0.0.1:9010