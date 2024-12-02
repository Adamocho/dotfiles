#! /usr/bin/env bash

REPO_ADDRESS="https://github.com/github/gitignore"
FILE_ADDRESS="https://github.com/github/gitignore/raw/main"
FILE_DIR="$HOME/.cache/.gitignore"

FILES=$( wget "${REPO_ADDRESS}" --show-progress -nv -O - | grep -o "gitignore\">[a-zA-Z\/]*\.gitignore" | cut -d ">" -f 2 )

[[ -z "${FILES}" ]] && { echo "NO INTERNET CONNECTION" | dmenu; exit 0; }

CHOSEN_FILE=$( echo "${FILES}" | dmenu -i -p "Which file to copy?" )

[[ -z "${CHOSEN_FILE}" ]] && exit 0;

wget "${FILE_ADDRESS}/${CHOSEN_FILE}" --show-progress -nv -O "${FILE_DIR}"

RESULT=$( echo $'No\nYes' | dmenu -i -p "Copy file (${CHOSEN_FILE} as .gitignore) to \$PWD?" )

case "${RESULT}" in
    Yes)
        cp -iv "${FILE_DIR}" "${PWD}/.gitignore";;
    *)
        exit;;
esac
