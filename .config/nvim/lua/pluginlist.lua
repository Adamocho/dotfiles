-- List of plugins used, returning an array
return {
	{ -- Commenting
		"numToStr/Comment.nvim",
		config = function ()
			require("Comment").setup()
		end
	},
	{ -- Theme
		"rose-pine/neovim",
		name = "rose-pine",
		priority = 1000,
		config = function()
			vim.cmd("colorscheme rose-pine")
		end
	},
	{ -- Custom line
		"nvim-lualine/lualine.nvim",
		config = function ()
			require("lualine").setup({
				theme = 'rose-pine',
			})
		end,
	},

	-- Some additional tools

	-- slow telescope
    "nvim-telescope/telescope.nvim",
	-- fast telescope
	-- {
	-- 	"nvim-telescope/telescope-fzf-native.nvim",
	-- 	build = "make",
	-- },


	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		performance = {
			reset_packpath = false,
			rtp = { reset = false }
		}
	},

    "mbbill/undotree",

	-- LSP
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",
	"folke/neodev.nvim",

	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			-- additional code snippets
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
		},
	},
}
