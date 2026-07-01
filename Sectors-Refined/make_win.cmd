
@echo off
cd /d "%~dp0"
del Sectors-Refined.dat
echo file deleted
"../../SH/Starshatter_TGS/datafile.exe" Sectors-Refined.dat -mak
copy /Y Sectors-Refined.dat "../../SH/Starshatter_TGS/Mods/"
echo Mod file copied
