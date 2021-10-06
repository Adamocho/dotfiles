# Personal Dotfiles

1. Clone repo into new hidden directory

```zsh
# Add it later for both SSH and HTTPS
git clone {github repo} ~/.dotfiles
```

2. Create symlinks in the Home directory to the real files in the repo.

```zsh
# Automating this process with a script or bootsrapping tool is a great idea

ln -s ~/.dotfiles/.bashrc ~/.bashrc
ln -s ~/.dotfiles/.zshrc ~/.zshrc
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
ln -s ~/.dotifles/.vimrc ~/.vimrc
```