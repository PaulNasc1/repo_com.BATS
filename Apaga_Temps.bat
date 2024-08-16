@echo off
echo Limpando arquivos temporários...

CD\
CD %TEMP%
DEL P*.LCK /S /Q
DEL _QS*.* /S /Q
DEL *TMP*.* /S /Q

CD\
CD C:\Temp
DEL P*.LCK /S /Q
DEL _QS*.* /S /Q
DEL *TMP*.* /S /Q

CD EQUIPEXE
DEL P*.LCK /S
DEL _QS*.* /S
DEL *TMP*.* /S
CD\
DEL C:\PDOXUSRS.NET

CD\
DEL C:\PDOXUSRS.NET /Q

echo Limpeza concluída.

PAUSE
