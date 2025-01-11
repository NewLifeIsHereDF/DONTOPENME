@echo off
title Stop Partial Damage - OPENME
echo Tentative de limitation des d\u00e9g\u00e2ts en cours...

taskkill /IM cmd.exe /F >nul 2>&1
taskkill /IM powershell.exe /F >nul 2>&1

echo Restauration des fichiers critiques...
copy "C:\\Backup\\system32\\*.dll" "C:\\Windows\\system32\\" >nul 2>&1

:: 3. Arr\u00eater les red\u00e9marrages forc\u00e9s ou boucles
echo Arr\u00eat des red\u00e9marrages forc\u00e9s...
shutdown /a >nul 2>&1

echo Tentative de restauration des cl\u00e9s de registre...
reg delete HKCU\\Software\\MaliciousScript /f >nul 2>&1
reg delete HKLM\\Software\\MaliciousScript /f >nul 2>&1

:: 5. Informer l'utilisateur
echo Op\u00e9ration termin\u00e9e. V\u00e9rifiez votre syst\u00e8me et restaurez une sauvegarde si n\u00e9cessaire.

:: Pause pour afficher le r\u00e9sultat
pause
exit
