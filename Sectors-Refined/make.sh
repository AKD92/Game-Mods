#!/bin/bash

SCRIPT_DIR=$(dirname "$(realpath "$0")")
SOURCE_DIR="$SCRIPT_DIR"
GAME_ROOT_DIR="$HOME/Games/Starshatter-TGS-HLP"
COMPILER_PATH="$GAME_ROOT_DIR/datafile.exe"
MOD_FILENAME="Sectors-Refined.dat"
MOD_DIRPATH="$GAME_ROOT_DIR/Mods"

cd "$SOURCE_DIR" || { echo "Error: Cannot enter $SOURCE_DIR"; exit 1; }

if [ -f "$MOD_FILENAME" ]; then
	rm -f "$MOD_FILENAME"
	echo "Old mod file deleted"
fi

mkdir -p "$MOD_DIRPATH"
wine "$COMPILER_PATH" "$MOD_FILENAME" -mak

if [ -f "$MOD_FILENAME" ]; then
	cp -f "$MOD_FILENAME" "$MOD_DIRPATH/"
	echo "Success: Generated $MOD_FILENAME, copied to $MOD_DIRPATH"
else
	echo "Error: Expected file $MOD_FILENAME was not found in $SOURCE_DIR"
	exit 1
fi

exit 0
