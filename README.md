# Personal Dotfiles

1. Clone repo into new hidden directory

```zsh
# Use SSH (if set up)...
git clone git@github.com:Adamocho/dotfiles.git ~/.dotfiles

# ...or use HTTPS and switch remotes later.
git clone https://github.com/Adamocho/dotfiles.git ~/.dotfiles
```

2. Create symlinks in the Home directory to the real files in the repo.

```zsh
# Automating this process with a script or bootsrapping tool is a great idea

ln -s ~/.dotfiles/.bashrc ~/.bashrc
ln -s ~/.dotfiles/.zshrc ~/.zshrc
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
ln -s ~/.dotifles/.vimrc ~/.vimrc
```

## TODO list

- Learn how to use defaults to record and restore System Preferences and other linux configurations.
- Organize these growing steps into multiple script files.
- Automate symlinking and run script files with a bootstrapping tool like Dotbot.
- Revisit the list in [`.zshrc`](.zshrc) to customize the shell.
- Make a checklist of steps to decommission your computer before wiping your hard drive.
- Create a [bootable USB](https://rufus.ie/en/) installer for [linux](https://getfedora.org/pl/workstation/download/).
- Integrate other cloud services into your Dotfiles process (Dropbox, Google Drive, etc.).
- Find inspiration and examples in other Dotfiles repositories at [dotfiles.github.io](https://dotfiles.github.io/).