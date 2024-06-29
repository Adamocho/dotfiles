# PDE
Personal Development Environment - In Neovim

## Installing
Clone the directory using
```bash
git clone --depth 1 https://github.com/Adamocho/pde-nvim.git "$XDG_CONFIG_HOME/nvim"
# OR
git clone --depth 1 https://github.com/Adamocho/pde-nvim.git "$HOME/.config/nvim"
```

Following steps
- Install the nvim plugin manager listed in the config - `nvim packer`
- Start vim and install the plugins - `:PackerSync`
- Lsp setup - `:Mason`
- Bring back colors - `:lua ColorMyPencils()`
- Install `dotfiles` repo for tmux config

