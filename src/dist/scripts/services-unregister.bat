@ECHO OFF

ECHO Now unregister Services for appserver.io...

REM Change to the installation directory
cd "$INSTALL_PATH"

REM Initialize the variable with the NSSM binary 
set nssm=php\nssm.exe

SC QUERY appserver > NUL

IF ERRORLEVEL 1060 GOTO MISSING
    
    REM Stop + Remvoe the Service appserver
    %nssm% stop appserver
    %nssm% remove appserver confirm

    ECHO Service appserver has successfully been removed
    
GOTO END

:MISSING

    REM Write a message that the Service appserver has not been registered
    ECHO Successfully unregistered Service appserver

:END

IF ERRORLEVEL 1060 GOTO MISSING
    
    REM Stop + Remvoe the Service appserver-php5-fpm
    %nssm% stop appserver-php5-fpm
    %nssm% remove appserver-php5-fpm confirm

    ECHO Service appserver-php5-fpm has successfully been removed
    
GOTO END

:MISSING

    REM Write a message that the Service appserver-php5-fpm has not been registered
    ECHO Successfully unregistered Service appserver-php5-fpm

:END