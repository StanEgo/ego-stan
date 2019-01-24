@ECHO OFF
SET TARGET=e:\OneDrive\Ego\Lab\labs\EgoFramework
SET SOURCE=%~dp0

IF EXIST %TARGET% RMDIR /S /Q %TARGET%
MKDIR %TARGET%

COPY %SOURCE%\*.sh %TARGET%\
COPY %SOURCE%\*.cmd %TARGET%\
COPY %SOURCE%\*.ps1 %TARGET%\

ROBOCOPY /S %SOURCE% %TARGET% README*.md /XD node_modules

ROBOCOPY /E %SOURCE%\project\ide\frames %TARGET%\project\ide\frames