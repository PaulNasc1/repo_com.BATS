@echo off

rem Define o caminho para o programa LiveUpdate.exe
set "caminho=C:\equipexe\exe\Tutil32.exe"

rem Verifica se o arquivo Tutil32.exe existe
if exist "%caminho%" (
    rem Inicia o programa Tutil32.exe
    start "" "%caminho%"
) else (
    echo O arquivoTutil32.exe não foi encontrado.
)

pause
