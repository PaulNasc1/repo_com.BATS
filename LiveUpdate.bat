@echo off

rem Define o caminho para o programa LiveUpdate.exe
set "caminho=C:\equipexe\exe\LiveUpdate.exe"

rem Verifica se o arquivo LiveUpdate.exe existe
if exist "%caminho%" (
    rem Inicia o programa LiveUpdate.exe
    start "" "%caminho%"
) else (
    echo O arquivo LiveUpdate.exe não foi encontrado.
)

pause
