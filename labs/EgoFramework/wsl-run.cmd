@ECHO OFF
PUSHD
CD %~dp0
wsl export HOME=$PWD; /bin/bash --init-file ~/ide.sh
POPD
