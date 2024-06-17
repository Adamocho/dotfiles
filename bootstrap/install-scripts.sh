#! /usr/bin/env bash

SCRIPT_PATH=$(dirname "$0")
SCRIPTS=$( find "${SCRIPT_PATH}/../bin/" -maxdepth 1 -type f)
OUTPUT_DIR="${HOME}/.local/bin"

for SCRIPT in $SCRIPTS
do
    cp -uiv "${SCRIPT}" "${OUTPUT_DIR}" && {
        printf "\033[92mDONE\033[00m: script installed\n"
    } || {
        printf "\033[91mERROR\033[00m: installation failed\n"
    }
done