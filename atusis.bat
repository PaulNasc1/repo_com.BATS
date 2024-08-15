@echo off
setlocal enabledelayedexpansion

REM Define o caminho da pasta de destino (C:\equipexe\exe)
set "pasta_destino=C:\equipexe\exe"

REM Verifica se o caminho da pasta de destino existe, caso contrário, cria-a
if not exist "!pasta_destino!" (
    mkdir "!pasta_destino!"
)

REM Define o nome do arquivo a ser verificado
set "arquivo_verificar=Atualiza_sistema.exe"

REM Verifica se o arquivo "Atualiza_sistema.exe" existe (ignorando letras maiúsculas/minúsculas)
for %%I in ("!pasta_destino!\!arquivo_verificar!") do (
    if not exist "%%~sI" (
        REM Se o arquivo não existe, copia o arquivo do diretório atual (onde o script está)
        copy "Atualiza_sistema.exe" "!pasta_destino!"
        echo Arquivo "Atualiza_sistema.exe" copiado para a pasta de destino.
    )

    REM Aguarde 7 segundos
    timeout /t 7 /nobreak > nul

    REM Execute o arquivo "Atualiza_sistema.exe" mesmo que já exista no diretório
    start "" "!pasta_destino!\!arquivo_verificar!"
)

endlocal

PAUSE
