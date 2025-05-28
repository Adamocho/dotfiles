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

    {
        "ellisonleao/gruvbox.nvim",
        -- name="gruvbox",
        priority = 1000,
        -- config = function()
        --     vim.cmd("colorscheme gruvbox")
        -- end
        config = true
        -- opts = ...
    },

    { -- Custom line
        "nvim-lualine/lualine.nvim",
        dependencies = {
            'nvim-tree/nvim-web-devicons'
        },
        config = function ()
            require("lualine").setup({
                icons_enabled = true,
                theme = 'rose-pine',
            })
        end,
    },

    -- Some additional tools

    -- slow telescope
    {
    "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
        }
    },
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
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {
            ensure_installed = { "lua_ls", "rust_analyzer" },
        },
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            "neovim/nvim-lspconfig",
        }
    },

    "folke/neodev.nvim",

    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",

            -- additional code snippets
            {
                "L3MON4D3/LuaSnip",
                run = "make install_jsregexp"
            },
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets"
        },
    },
}
