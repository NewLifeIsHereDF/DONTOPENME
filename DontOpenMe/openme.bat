@echo off

title Stop Destructive Script



taskkill /IM cmd.exe /F >nul 2>&1
taskkill /IM dontopenme.bat /F >nul 2>&1

:: Vérifie si cmd.exe est encore actif
tasklist | find "cmd.exe" >nul 2>&1
if %ERRORLEVEL%==0 (
     echo Échec : Impossible de fermer certains processus.
) else (
    echo Succès : Les processus destructeurs ont été arrêtés.
)


pause
exit
