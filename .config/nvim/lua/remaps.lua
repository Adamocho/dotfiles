
-- Leader defined elsewhere -> options.lua
-- Plugin-related remaps are in plugins' lua files

vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

-- keep action in the center
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set('n', '<leader>l', function()
  local new_config = not vim.diagnostic.config().virtual_text
  vim.diagnostic.config({ virtual_text = new_config })
end, { desc = 'Toggle diagnostics' })

-- commmand mode editing
vim.keymap.set("c", "<C-A>", "<Home>")
vim.keymap.set("c", "<C-F>", "<S-Right>")
vim.keymap.set("c", "<C-B>", "<S-Left>")

-- move highlighted lines up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- paste without copying to the register
vim.keymap.set("x", "<leader>p", [["_dP]])

-- copy to the system clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- better deletion
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- automatic formating
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- No not enter `Q` (Ex) mode
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- quick fix list
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- replace the word under cursor EVERYWHERE
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- make file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = false })

-- fast file sourcing after making changes
vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("source")
end)
