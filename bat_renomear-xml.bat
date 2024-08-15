@echo off
pushd C:\Equipexe\Sincroniza\Retorno
powershell.exe -Command "$path = 'C:\Equipexe\Sincroniza\Retorno'; Get-ChildItem -Path $path -Filter *.xml | ForEach-Object { Rename-Item $_.FullName ($_.Name -replace '_', '') }"
popd
