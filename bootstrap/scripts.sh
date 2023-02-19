#!/bin/bash

SCRIPT_PATH=$(dirname "$0")
SCRIPTS=$( find "$SCRIPT_PATH"/../bin/* -printf "%f " | xargs )

for SCRIPT in $SCRIPTS
do
    cp -uiv "$SCRIPT_PATH/../bin/$SCRIPT" ~/.local/bin && {
        printf "\033[92mDONE\033[00m: script installed\n"
    } || {
        printf "\033[91mERROR\033[00m: installation failed\n"
    }
done