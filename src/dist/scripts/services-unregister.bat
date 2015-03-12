@ECHO OFF

ECHO Now unregister Services for appserver.io...

REM Change to the installation directory
cd "$INSTALL_PATH"

REM Initialize the variable with the NSSM binary 
set nssm=php\nssm.exe

SC QUERY appserver > NUL

IF ERRORLEVEL 1060 GOTO MISSING
    
    REM Stop + Remvoe the Service appserver
    %nssm% stop appserver > NUL
    %nssm% remove appserver confirm > NUL

    ECHO Service appserver has successfully been removed
    
GOTO END

:MISSING

    REM Write a message that the Service appserver has not been registered
    ECHO Successfully unregistered Service appserver

:END

SC QUERY appserver-watcher > NUL

IF ERRORLEVEL 1060 GOTO MISSING
    
    REM Stop + Remvoe the Service appserver-watcher
    %nssm% stop appserver-watcher > NUL
    %nssm% remove appserver-watcher confirm > NUL

    ECHO Service appserver-watcher has successfully been removed
    
GOTO END

:MISSING

    REM Write a message that the Service appserver-watcher has not been registered
    ECHO Successfully unregistered Service appserver-watcher

:END

SC QUERY appserver-php5-fpm > NUL

IF ERRORLEVEL 1060 GOTO MISSING
    
    REM Stop + Remvoe the Service appserver-php5-fpm
    %nssm% stop appserver-php5-fpm > NUL
    %nssm% remove appserver-php5-fpm confirm > NUL

    ECHO Service appserver-php5-fpm has successfully been removed
    
GOTO END

:MISSING

    REM Write a message that the Service appserver-php5-fpm has not been registered
    ECHO Successfully unregistered Service appserver-php5-fpm

:END