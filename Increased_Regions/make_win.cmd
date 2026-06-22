
@echo off
cd /d "%~dp0"
del Sectors-Refind.dat
echo "file deleted"
"../../SH/Starshatter_TGS/datafile.exe" Sectors-Refind.dat -mak
copy /Y Sectors-Refind.dat "../../SH/Starshatter_TGS/Mods/"
echo "Mod file copied"