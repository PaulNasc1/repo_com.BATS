@echo off
setlocal

:: Define o caminho para o disco local C:\
set "localDisk=C:\"

:: Lista das pastas a serem verificadas
set "folders=Equipexe Equipe_Copia temporario Temp"

:: Loop para verificar e criar as pastas
for %%f in (%folders%) do (
    if not exist "%localDisk%%%f\" (
        echo A pasta %localDisk%%%f\ não foi encontrada. Criando...
        mkdir "%localDisk%%%f" 2>nul
        if errorlevel 1 (
            echo Falha ao criar a pasta %localDisk%%%f\.
        ) else (
            echo Pasta %localDisk%%%f\ criada com sucesso.
        )
    ) else (
        echo A pasta %localDisk%%%f\ já existe.
    )
)

PAUSE

:: Encerra o script
endlocal
