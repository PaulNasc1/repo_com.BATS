@echo off
setlocal

set "scriptDir=%~dp0"
set "targetDir=C:\Equipexe"
set "searchFile=Estruturas.rar"

for /R "%scriptDir%\.." %%A in (AttSis) do (
    if exist "%%~fA\%searchFile%" (
        echo Encontrado "%%~fA\%searchFile%"
        copy "%%~fA\%searchFile%" "%targetDir%"
        timeout /t 2 /nobreak > nul
        ren "%%~fA\Estruturas" "EstruturasOLD"
        goto :done
    )
)

echo Não foi encontrado "%searchFile%"

:done

endlocal

pause