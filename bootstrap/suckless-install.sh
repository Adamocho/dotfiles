#! /usr/bin/env bash

SOFTWARE="dwm dmenu"
DWM_LINK="https://dl.suckless.org/dwm/dwm-6.4.tar.gz"
DWM_FILE=$( echo "${DWM_LINK}" | cut -d/ -f 5 )
DMENU_LINK="https://dl.suckless.org/tools/dmenu-5.2.tar.gz"
DMENU_FILE=$( echo "${DMENU_LINK}" | cut -d/ -f 5 )
SUCKLESS_DIR="$HOME/dotfiles/misc/suckless"

#INSTALL_PATH="$HOME/.local/share"
INSTALL_PATH="$HOME/test"

# Create dir if doesn't exist
[[ -d "${INSTALL_PATH}" ]] || { mkdir "${INSTALL_PATH}"; }
cd "${INSTALL_PATH}" || exit

echo "$DWM_LINK"
echo "$DWM_FILE"
echo "$DMENU_LINK"
echo "$DMENU_FILE"
echo "$INSTALL_PATH"
echo "$SUCKLESS_DIR"

# Download and unzip the file
wget -N "$DWM_LINK"
tar -xf "${INSTALL_PATH}/${DWM_FILE}"

wget -N "$DMENU_LINK"
tar -xf "${INSTALL_PATH}/${DMENU_FILE}"

for package in $SOFTWARE
do
    read -p "Do you want to modify ${package} with files in ${SUCKLESS_DIR}/${package}? [Y/n] "

    [ "${REPLY}" = y ] || [ -z "${REPLY}" ] && {
        # Locate the desired directory
        directory=$( find -maxdepth 1 -type d -name "${package}*" -printf %f ) 
        
        # Locate files
        files=$( find "${SUCKLESS_DIR}/${package}" -maxdepth 1 -type f )

        # Copy contents from dotfiles to that directory
        cp -iv "${files}" "${INSTALL_PATH}/${directory}" && {
            printf "\033[92mDONE\033[00m: config changed\n"
        } || {
            printf "\033[91mERROR\033[00m: failed\n"
        }
    } || {
        printf "\033[93mNOTE\033[00m: omitted\n"
    }
done

