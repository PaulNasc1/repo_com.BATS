@echo off
setlocal

set "sourceFile=C:\equipexe\EquNet.ini"
set "backupFolder=C:\backup"

:: Verifica se o arquivo de origem existe
if not exist "%sourceFile%" (
    echo Arquivo de origem não encontrado.
    exit /b
)

:: Cria o diretório de backup se não existir
if not exist "%backupFolder%" (
    mkdir "%backupFolder%"
)

:: Define o nome do arquivo de backup com data e hora
for /f "tokens=2-4 delims=/ " %%a in ('date /t') do (
    for /f "tokens=1-2 delims=: " %%i in ('time /t') do (
        set "backupFile=%backupFolder%\EquNet_%date:~6,4%%date:~3,2%%date:~0,2%_%%i%%j.ini"
    )
)

:: Realiza o backup do arquivo de origem
copy "%sourceFile%" "%backupFile%"

:: Remove as linhas especificadas do arquivo de origem
(for /f "delims=" %%a in ('type "%sourceFile%" ^| findstr /v /c:"BloqFran=3" /c:"EquipeX=3" /c:"TesteB2=33" /c:"Teste2T=2" /c:"TesteB3=5" /c:"Tested2=39g4;j98;=" /c:"Tested4=19g4=j98;=" /c:"EquipeZ=43565" /c:"TesteW1=43565" /c:"Tested2=39g55j98;=" /c:"Tested4=1:g57j98;="') do (
    echo %%a
)) > "%sourceFile%.tmp"

:: Substitui o arquivo de origem com as linhas removidas
move /y "%sourceFile%.tmp" "%sourceFile%"

:: Limpa a variável de ambiente
set "backupFile="
endlocal

:: Aguarda 5 segundos
timeout /t 5

:: Execute o script atusis.bat que está na pasta "atusiste"
