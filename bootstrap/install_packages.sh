#!/bin/sh

# Script that looks into /software/packages/*
# And asks for every entry
# When it's done, just use the package manager to install
# With  `< packages.txt xargs sudo apt-get install` with ignore missing

pwd