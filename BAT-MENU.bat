@echo off
color 0e
mode con: cols=50 lines=10

:: Redimensionar a tela do console
mode con: cols=60 lines=20

cls
color

:: Exibindo o menu principal após a introdução
:menu
echo.
echo              ****************************
echo              *      Menu de Opcoes      *
echo              ****************************
echo.
echo 1. Faz Backup do C:\ Servidor na area de trabalho.
echo 2. Abre o EquEstruAtu.
echo 3. Abre o Tutil.
echo 4. Abre o LiveUpdate.
echo 5. Executar ApagaTemporarios e AjustaSistemas.
echo 6. Renomear todos os XML em C:\Equipexe\Sincroniza\Retorno.
echo 7. Resetar o Spool de impressao.
echo 8. Renova Trava Automaticamente.
echo 9. Cria pastas Lavsoft/Equipexe/Temp para instalacao.
echo 10. Instala BDE.
echo 11. Configura BDE.
echo.
echo 12. Sair.
echo.
set /p opcao=Escolha uma opcao: 

if "%opcao%"=="1" (
    call bats\copiaBase.bat
    cls
    goto menu
) else if "%opcao%"=="2" (
    call bats\EquEstruAtu.bat
    cls
    goto menu
) else if "%opcao%"=="3" (
    call bats\Tutil.bat
    cls
    goto menu
) else if "%opcao%"=="4" (
    call bats\LiveUpdate.bat
    cls
    goto menu
) else if "%opcao%"=="5" (
    call bats\ApagaTemp.bat
    call bats\AjustaSistemas.bat
    cls
    goto menu
) else if "%opcao%"=="6" (
    call bats\bat_renomear-xml.bat
    cls
    goto menu
) else if "%opcao%"=="7" (
    call bats\spoolRESET.bat
    cls
    goto menu
) else if "%opcao%"=="8" (
    call bats\RetiraTrava.bat
    call bats\rettrava.bat
    call bats\atusis
    cls
    goto menu
) else if "%opcao%"=="9" (
    call bats\cria_pastas.bat
    cls
    goto menu
) else if "%opcao%"=="10" (
    call bats\instalaBDE.bat
    cls
    goto menu
) else if "%opcao%"=="11" (
    call bats\configBDE.bat
    cls
    goto menu
) else if "%opcao%"=="12" (
    exit
) else (
    echo Opção inválida. Pressione qualquer tecla para continuar.
    pause > nul
    cls
    goto menu
)
