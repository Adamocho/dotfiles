#!/bin/bash

HOSTNAME=$( uname -n )
KERNEL_VERSION=$( uname -r ) # | cut -d '-' -f1 )
OS_TYPE=$( cat /etc/*-release | grep "^NAME=\"" | cut -d "\"" -f2 )
ARCH=$( uname -m )
MEMORY=$( vmstat -s --unit M | head -n 2 | xargs )
TOTAL_MEMORY=$( printf "${MEMORY}" | cut -d ' ' -f1-2 )
USED_MEMORY=$( printf "${MEMORY}" | cut -d ' ' -f5-6 )
SHELL_TYPE=$( printf "${SHELL}" | tr '/' '\n' | tail -n 1 )
UPTIME=$( uptime | xargs | cut -d ' ' -f3 | tr -d ',' )
SHELL_VERSION=$( "${SHELL}" --version | grep -o "[0-9]\.[0-9]*\.*[0-9]*" | head -n 1 )
EDITOR_VERSION=$( "${EDITOR}" --version | grep -o "[0-9]\.[0-9]*\.*[0-9]*" | head -n 1 )


printf "\033[93mUser\033[00m: ${USER}\n"
printf "\033[93mHost\033[00m: ${HOSTNAME}\n"
printf "\033[93mOS\033[00m: ${OS_TYPE}\n"
printf "\033[93mArch\033[00m: ${ARCH}\n"
printf "\033[93mKernel\033[00m: ${KERNEL_VERSION}\n"
printf "\033[93mTerminal\033[00m: ${TERM}\n"
printf "\033[93mEditor\033[00m: ${EDITOR} ${EDITOR_VERSION}\n"
printf "\033[93mShell\033[00m: ${SHELL_TYPE} ${SHELL_VERSION}\n"
printf "\033[93mDE\033[00m: ${XDG_SESSION_DESKTOP}\n"
printf "\033[93mUptime\033[00m: ${UPTIME}\n"
printf "\033[93mMemory (used/total)\033[00m: ${USED_MEMORY} / ${TOTAL_MEMORY}\n"
