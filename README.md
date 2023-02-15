![# Dotfiles](logo.svg)
My Unix config files

## Table of content
- [Getting the repo](#getting-the-repo)
- [Removing the repo](#removing-the-repo)
- [Installing](#installing)
    - [Configuration files](#configuration-files)
    - [Packages](#packages)
        - [Manual](#manual)
        - [Automated](#automated)

## Getting the repo

```sh
git clone https://github.com/Adamocho/Dotfiles.git ~/.dotfiles
```

## Removing the repo

Just delete the `.dotfiles` folder from the GUI or using the terminal

> NOTE:  
> Be careful with the `rm` command, as it can cause some serious damage

```sh
rm -rf ~/.dotfiles
```

## Installing

The following section is split into segments according to what is needed

### Configuration files

```sh
~/.dotfiles/bootstrap/configure.sh
```

The script is interactive and allows user to pick which folders are to be copied

Below is a fragment from the terminal

```
Do you want to install git? [Y/n] 
DONE: config installed
Do you want to install vim? [Y/n] n
NOTE: config omitted
Do you want to install wallpaper? [Y/n] n
NOTE: config omitted
```

### Scripts

Can be found in the `bin` directory

### Packages

Split in two, according to the way of installing

#### Manual

The list of packages with direct links is located in the **software/manual/** directory

Its purpose is to be a list of software that I use personally, located in one, easy to find, place.

Follow the links and from there install the packages by hand

#### Automated

A little interactive script for managing packages.

The script will look for any files located inside **software/packages** directory. From there, it will prompt for each entry found, excluding blank lines and those starting with the comment `#` sign.

```
Do you want to iterate through graphical.txt? [Y/n] n
Do you want to iterate through terminal.txt? [Y/n] 
Install coreutils? [Y/n] 
DONE: package added
Install htop? [Y/n] 
DONE: package added
Install plocate? [Y/n] 
DONE: package added
Install tree? [Y/n] 
DONE: package added
Install vim? [Y/n] n
NOTE: package omitted
Install cron? [Y/n] n
NOTE: package omitted
```

As a result, `< ~/.config/packages_list.txt` file is created, containing a roaster of wanted software.

```
coreutils
htop
plocate
tree
```

Now the last part is to pipe it to your package manager of choice. Examples below:

> NOTE:
> The `-y` flag means "assume yes". In practice, it agrees on every prompt, saving some time

apt
```sh
< ~/.config/packages_list.txt xargs sudo apt install -y
```

apt-get
```sh
< ~/.config/packages_list.txt xargs sudo apt-get install -y
```

emerge
```sh
< ~/.config/packages_list.txt xargs sudo emerge
```

pacman
```sh
< ~/.config/packages_list.txt xargs sudo pacman -S
```

dnf
```sh
< ~/.config/packages_list.txt xargs sudo dnf install -y
```

yum
```sh
< ~/.config/packages_list.txt xargs sudo yum install -y
```

brew
```sh
< ~/.config/packages_list.txt xargs brew install
```

homebrew
```sh
< ~/.config/packages_list.txt xargs homebrew install
```
