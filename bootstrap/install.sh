#!/bin/bash

SCRIPT_PATH=$( realpath "$0" | xargs dirname )
CONFIG_PATH="${SCRIPT_PATH}/../etc"
BACKUP_DIR="${HOME}/.config/dotfiles_backup"
TMP_DIR="/tmp"

LOCAL_DOTFILES=$( find "${CONFIG_PATH}" -maxdepth 2 -type f -name ".*" -printf "%f\n" )
GLOBAL_DOTFILES=$( find "${HOME}" -maxdepth 1 -type f -name ".*" -printf "%f\n" )
# Links could be used in the future
# GLOBAL_DOTLINKS=$( find "${HOME}" -maxdepth 1 -type l -name ".*" -printf "%f\n" )

# Create backup directory if doesn't exist
[[ -d "${BACKUP_DIR}" ]] || { mkdir "${BACKUP_DIR}"; }

# Create temporary files for comparing (diff) local vs global results
TMP_FILE_LOCAL=$( mktemp tmp.XXXX -p "${TMP_DIR}")
TMP_FILE_GLOBAL=$( mktemp tmp.XXXX -p "${TMP_DIR}")

echo "$LOCAL_DOTFILES" | sort > "$TMP_FILE_LOCAL"
echo "$GLOBAL_DOTFILES" | sort > "$TMP_FILE_GLOBAL"

SWAPPABLE_FILES=$( comm -1 -2 "$TMP_FILE_LOCAL" "$TMP_FILE_GLOBAL" )

for file in $LOCAL_DOTFILES
do
    FOUND=$( echo "$SWAPPABLE_FILES" | grep -xc "$file" )
    [[ "${FOUND}" = 1 ]] && {
        printf "FOUND FILE MATCH\n"
        mv -iv "${HOME}/${file}" "${BACKUP_DIR}"
    } 
        LINKFILE=$( find "${CONFIG_PATH}" -maxdepth 2 -type f -name "${file}" | head -n 1 )
        ln -siv "${LINKFILE}" "${HOME}/${file}"
done