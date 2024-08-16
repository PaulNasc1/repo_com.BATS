@echo off
:Finaliza
taskkill /f /im Lavsoft.exe
cls
taskkill /f /im LavFacillan.exe
cls
taskkill /f /im PecLav.exe
cls
taskkill /f /im Financ.exe
cls
taskkill /f /im Sat.exe
cls
taskkill /f /im Financeiro.exe
cls
taskkill /f /im EquEstruAtu.exe
cls
taskkill /f /im Alerta.exe
cls
taskkill /f /im Boletos.exe
cls
taskkill /f /im LiveUpdate.exe
cls

C:
CD\
CD TEMP
DEL TMP*.* /S
CD\
CD EQUIPEXE
DEL P*.LCK /S
DEL _QS*.* /S
DEL TMP*.* /S
CD\
DEL C:\PDOXUSRS.NET 
