@echo off
setlocal enabledelayedexpansion

REM Define a pasta alvo
set "pasta_alvo=C:\EQUIPExe"

REM Define a pasta de backup
set "pasta_backup=C:\Backup"

REM Define a pasta de exceção
set "pasta_excecao=C:\Excecao"

REM Verifica se a pasta de backup existe, caso contrário, cria-a
if not exist "%pasta_backup%" (
    mkdir "%pasta_backup%"
)

REM Define os nomes de arquivo alvo
set "alvos=EquipeParam.ini EquFranquias.ini"

REM Percorre os arquivos na pasta alvo
for %%a in (%alvos%) do (
    set "arquivo=%%a"
    set "caminho_original=%pasta_alvo%\!arquivo!"
    set "caminho_backup=%pasta_backup%\!arquivo!"

    REM Verifica se o arquivo alvo existe
    if exist "!caminho_original!" (
        REM Move o arquivo para a pasta de backup
        move "!caminho_original!" "!caminho_backup!"
        echo Arquivo "!arquivo!" movido para a pasta de backup.
    ) else (
        echo Arquivo "!arquivo!" não encontrado na pasta alvo.
    )
)

REM Move os arquivos de backup para a pasta de exceção
for %%a in (%alvos%) do (
    set "arquivo=%%a"
    set "caminho_backup=%pasta_backup%\!arquivo!"
    set "caminho_excecao=%pasta_excecao%\!arquivo!"

    REM Verifica se o arquivo de backup existe
    if exist "!caminho_backup!" (
        move "!caminho_backup!" "!caminho_excecao!"
        echo Arquivo de backup "!arquivo!" movido para a pasta de exceção.
    )
)

echo Concluído com sucesso. Arquivos "EquipeParam" e "EquFranquias" apagados, backup criado em C:\Backup.

pause
endlocal
