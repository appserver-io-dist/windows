@ECHO OFF

ECHO Now register Services for appserver.io...

REM Change to the installation directory
cd "$INSTALL_PATH"

REM Initialize the variable with the NSSM binary 
set nssm=php\nssm.exe
    
SC QUERY appserver > NUL

IF ERRORLEVEL 1060 GOTO MISSING
    
    REM Restart the Service appserver
    %nssm% restart appserver > NUL
    
    ECHO Service appserver has successfully been restarted
    
GOTO END

:MISSING

    REM Install + Start the appserver service
    %nssm% install appserver "$INSTALL_PATH\php\php.exe" > NUL
    %nssm% set appserver AppDirectory "$INSTALL_PATH" > NUL
    %nssm% set appserver AppParameters -c php\php.ini "-dappserver.php_sapi=appserver" server.php > NUL
    %nssm% set appserver Start SERVICE_DEMAND_START > NUL
    %nssm% start appserver > NUL

    ECHO Successfully registered Service appserver

:END

SC QUERY appserver-watcher > NUL

IF ERRORLEVEL 1060 GOTO MISSING
    
    REM Restart the Service appserver-watcher
    %nssm% restart appserver-watcher > NUL
    
    ECHO Service appserver-watcher has successfully been restarted
    
GOTO END

:MISSING

    REM Install + Start the appserver-watcher service
    %nssm% install appserver-watcher "$INSTALL_PATH\php\php.exe" > NUL
    %nssm% set appserver-watcher AppDirectory "$INSTALL_PATH" > NUL
    %nssm% set appserver-watcher AppParameters -c php\php.ini "-dappserver.php_sapi=appserver" server.php -w > NUL
    %nssm% set appserver-watcher Start SERVICE_DEMAND_START > NUL
    %nssm% start appserver-watcher > NUL

    ECHO Successfully registered Service appserver-watcher

:END

SC QUERY appserver-php5-fpm > NUL

IF ERRORLEVEL 1060 GOTO MISSING
    
    REM Restart the Service appserver-php5-fpm
    %nssm% restart appserver-php5-fpm > NUL
    
    ECHO Service appserver-php5-fpm has successfully been restarted
    
GOTO END

:MISSING

    REM Install + Start the PHP-FPM service
    %nssm% install appserver-php5-fpm "$INSTALL_PATH\php\php-cgi.exe" > NUL
    %nssm% set appserver-php5-fpm AppDirectory "$INSTALL_PATH" > NUL
    %nssm% set appserver-php5-fpm AppParameters -c php\php.ini -b 127.0.0.1:9010 > NUL
    %nssm% set appserver-php5-fpm Start SERVICE_DEMAND_START > NUL
    %nssm% start appserver-php5-fpm > NUL

    ECHO Successfully registered Service appserver-php5-fpm

:END