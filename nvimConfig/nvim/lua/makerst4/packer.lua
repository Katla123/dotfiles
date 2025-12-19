-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.8',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	use {
		'rose-pine/neovim',
		as = 'rose-pine',
		config = function()
			vim.cmd('colorscheme rose-pine')
		end
	}

	use({"nvim-treesitter/nvim-treesitter", branch = 'master', run = ":TSUpdate" })

	use { "nvim-lua/plenary.nvim" }

	use {
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		requires = { {"nvim-lua/plenary.nvim"} }
	}
	use { "mbbill/undotree" }
	use { "tpope/vim-fugitive" }
 -- 	use {
 -- 		'williamboman/mason.nvim',
 -- 		run = ":MasonUpdate"
 -- 	}
 -- 	use {
 -- 		"williamboman/mason-lspconfig.nvim",
 -- 		tag = "v1.32.0"
 -- 	}
  	use {
  		"neovim/nvim-lspconfig",
  		tag = "v2.5.0"
  	}
 -- 	use { "hrsh7th/nvim-cmp" }
 -- 	use { "hrsh7th/cmp-nvim-lsp" }
 -- 	use { "hrsh7th/cmp-buffer" }
 -- 	use { "hrsh7th/cmp-path" }
 -- 	use { "L3MON4D3/LuaSnip" }
 -- 	use { "saadparwaiz1/cmp_luasnip" }
    use {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v1.x",
        requires = {
            -- LSP support
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',

            -- Autocompletion
            'hrsh7th/nvim-cmp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'saadparwaiz1/cmp_luasnip',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-nvim-lua',

            -- Snippets
            'L3MON4D3/LuaSnip',
            'rafamadriz/friendly-snippets',
        },
    }
	use { "folke/trouble.nvim" }
	use {
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup{}
		end
	}
	use { "folke/zen-mode.nvim",
		opts = {}
	}
	use {
		'akinsho/toggleterm.nvim',
		version = "*",
		config = function()
			require("toggleterm").setup({
				size = 10,
				open_mapping = [[<F7>]],
				shading_factor = 2,
				direction = "float",
				float_opts = {
					border = "curved",
					title_pos = 'center',

				},
			})
		end,
	}
    use {
        "windwp/nvim-ts-autotag",
        config = function()
        require("nvim-ts-autotag").setup({
            opts = {
                enable_close = true,
                enable_rename = true,
                enable_close_on_slash = false,
            },
            per_filetype = {
                ["html"] = {
                    enable_close = false
                }
            }
        })
       end

    }
end)
