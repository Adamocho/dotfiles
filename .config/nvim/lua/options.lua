-- leader is space
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- GUI options
-- vim.o.guicursor = ""
-- vim.o.clipboard = 'unnamedplus'

vim.o.termguicolors = true
vim.o.mouse = 'a'

vim.o.number = true
vim.o.relativenumber = true

vim.o.signcolumn = "yes"

vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

vim.o.smartindent = true

vim.o.wrap = false

vim.o.swapfile = false
vim.o.backup = false
vim.o.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.o.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.o.scrolloff = 8
vim.o.signcolumn = "yes"
-- For filenames that include an at `@` character
-- vim.o.isfname:append("@-@")

-- Smooth as butter
vim.o.updatetime = 300
-- Macros go FAST
vim.o.lazyredraw = true

vim.diagnostic.config({
  virtual_text = true
})

