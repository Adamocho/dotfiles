#!/bin/bash

SCRIPT_PATH=$( realpath "$0" | xargs dirname )
CONFIG_PATH="${SCRIPT_PATH}/../etc"
BACKUP_DIR="${HOME}/.config/dotfiles_backup"

LOCAL_DOTFILES=$( find "${CONFIG_PATH}" -maxdepth 2 -type f -name ".*" -printf "%f\n" )
GLOBAL_DOTFILES=$( find "${HOME}" -maxdepth 1 -type f -name ".*" -printf "%f\n" )
GLOBAL_DOTLINKS=$( find "${HOME}" -maxdepth 1 -type l -name ".*" -printf "%f\n" )

[[ -d "${BACKUP_DIR}" ]] || { mkdir "${BACKUP_DIR}"; }

for global_file in $GLOBAL_DOTFILES
do
    for local_dotfile in $LOCAL_DOTFILES
    do
        [[ "${local_dotfile}" = "${global_file}" ]] && {
            echo "FOUND FILE MATCH"

            LINKFILE=$( find "${CONFIG_PATH}" -maxdepth 2 -type f -name "${local_dotfile}" | head -n 1 )

            mv -iuv "${HOME}/${global_file}" "${BACKUP_DIR}"

            ln -siv "${LINKFILE}" "${HOME}/${global_file}"
        } 
    done
done

for local_dotfile in $LOCAL_DOTFILES
do
    LINKFILE=$( find "${CONFIG_PATH}" -maxdepth 2 -type f -name "${local_dotfile}" | head -n 1 )

    ln -siv "${LINKFILE}" "${HOME}/${local_dotfile}"
done