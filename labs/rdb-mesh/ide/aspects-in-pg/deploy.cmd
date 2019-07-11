@echo off
cls
set lc_messages=C

echo|set /p="Deploying... "

psql.exe --host=127.0.0.1 --dbname=iderun --username=postgres --file=index.sql --quiet

echo OK