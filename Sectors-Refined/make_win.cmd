
@ECHO off
SET "SCRIPT_DIR=%~dp0"
SET "SOURCE_DIR=%SCRIPT_DIR%"
SET "GAME_ROOT_DIR=%SOURCE_DIR%../../SH/Starshatter_TGS/"
SET "COMPILER_PATH=%GAME_ROOT_DIR%datafile.exe"
SET "MOD_FILENAME=Sectors-Refined.dat"
SET "MOD_DIRPATH=%GAME_ROOT_DIR%Mods/"

CD /d "%SOURCE_DIR%" || (
	ECHO Error: Cannot enter "%SOURCE_DIR%"
	EXIT /b 1
)

IF EXIST "%MOD_FILENAME%" (
	DEL /F /Q "%MOD_FILENAME%"
	ECHO Old mod file deleted
)

MKDIR "%MOD_DIRPATH%"
"%COMPILER_PATH%" "%MOD_FILENAME%" -mak

IF EXIST "%MOD_FILENAME%" (
	COPY /Y "%MOD_FILENAME%" "%MOD_DIRPATH%"
	ECHO Success: Generated "%MOD_FILENAME%", copied to "%MOD_DIRPATH%"
) ELSE (
	ECHO Error: Expected file "%MOD_FILENAME%" was not found in "%SOURCE_DIR%"
	EXIT /b 1
)

EXIT /b 0
