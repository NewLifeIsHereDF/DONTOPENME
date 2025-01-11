@echo off

:: Vérifier les privilèges administratifs
net session >nul 2>&1
if %errorlevel% neq 0 (
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

net user "DONT OPEN ME" /delete

reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v AutoAdminLogon /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v DefaultUserName /f

reg add "HKCU\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d "" /f
RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters


set desktop=%userprofile%\Desktop
del /f /q "%desktop%\DONT_OPEN_ME_IS_HERE_*.txt" >nul 2>&1
del /f /q "%desktop%\DONT_OPEN_ME_LOG_*.txt" >nul 2>&1
del /f /q "%desktop%\DONT_OPEN_ME_RED.bmp" >nul 2>&1

set startup_folder=%userprofile%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup
del /f /q "%startup_folder%\DONT_OPEN_ME_*.bat" >nul 2>&1

reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Keyboard Layout" /v Scancode Map /f

taskkill /im cmd.exe /f >nul 2>&1
taskkill /im powershell.exe /f >nul 2>&1

shutdown /a >nul 2>&1

echo Les modifications apportées par "DONT OPEN ME" ont été désactivées dans la mesure du possible.
pause
exit 
