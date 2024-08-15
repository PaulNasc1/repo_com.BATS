@echo off

rem Define o caminho para a pasta "equipexe/exe"
set "caminho=C:\equipexe\exe"

rem Verifica se o diretório existe
if exist "%caminho%" (
    rem Entra no diretório
    pushd "%caminho%"

    rem Verifica se o arquivo "EquEstruAtu.exe" existe e o executa
    if exist "EquEstruAtu.exe" (
        start EquEstruAtu.exe
    ) else (
        echo O arquivo EquEstrutuAtu.exe não foi encontrado.
    )

    rem Volta para o diretório anterior
    popd
) else (
    echo O diretório "equipexe/exe" não foi encontrado.
)

pause
