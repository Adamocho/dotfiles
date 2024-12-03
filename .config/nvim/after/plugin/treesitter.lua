require("nvim-treesitter.configs").setup({
    ensure_installed = {
        "c",
        "nix",
        "lua",
        "vim",
        "vimdoc",
        "query",
        "rust",
        "python",
        -- "markdown", -- maybe remark?
        "typescript",
        "haskell",
    },

	auto_install = false,

    indent = {
		enable = true,
		disable = { "yaml", "python" },
	},

    highlight = {
		enable = true,
		disable = { "yaml" },
		additional_vim_regex_highlighting = false,
	},
})
