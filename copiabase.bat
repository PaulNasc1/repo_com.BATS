@echo off

rem Verifica se a pasta "equipexe" no disco local C: existe
if exist "C:\equipexe" (
    rem Compacta a pasta "equipexe" em um arquivo .rar na Área de Trabalho
    "%ProgramFiles%\WinRAR\Rar.exe" a -r "%userprofile%\Desktop\equipexe.rar" "C:\equipexe"
    echo Tarefa concluída!
) else (
    echo A pasta "equipexe" no disco local C: não foi encontrada.
)

pause
