#! /usr/bin/env bash

# Use `re-stowing` to re-manage some dotfiles

stow -v -d ~/dotfiles/ --restow .config/ .local/
