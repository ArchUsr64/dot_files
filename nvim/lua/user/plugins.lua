local vim = vim

vim.cmd [[packadd packer.nvim]]

require("lsp-inlayhints").setup(
	{
		inlay_hints = {
			parameter_hints = {
				show = true,
				prefix = "<-",
				separator = ", ",
				remove_colon_start = false,
				remove_colon_end = true,
			},
			type_hints = {
				-- type and other hints
				show = true,
				prefix = "",
				separator = ", ",
				remove_colon_start = false,
				remove_colon_end = false,
			},
			only_current_line = false,
			-- separator between types and parameter hints. Note that type hints are
			-- shown before parameter
			labels_separator = " | ",
			max_len_align = false,
			max_len_align_padding = 1,
			highlight = "LspInlayHint",
		},
		debug_mode = false,
	}
)
require 'nvim-treesitter.configs'.setup {
	ensure_installed = { "c", "lua", "rust", "cpp", "json" },
	sync_install = false,
	auto_install = true,
	ignore_install = { "javascript" },

	highlight = {
		enable = true,
		disable = {},
		additional_vim_regex_highlighting = false,
	},
}

require('lualine').setup()
require('nvim-tree').setup()
require('telescope').load_extension("fzf")
require "telescope".load_extension("frecency")
require "telescope".load_extension("file_browser")
require('Comment').setup()
vim.cmd("let g:Hexokinase_highlighters = ['foreground']")
vim.cmd("let g:auto_save = 1")
vim.cmd("let g:auto_save_silent = 1")
vim.cmd("let g:auto_save_write_all_buffers = 1")
vim.cmd("let g:undotree_WindowLayout = 4")

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use 'mbbill/undotree'
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}
	use 'neovim/nvim-lspconfig'

	-- Debugging
	use 'nvim-lua/plenary.nvim'
	use 'mfussenegger/nvim-dap'

	use { "RRethy/vim-hexokinase", run = 'make hexokinase' }
	use { 'hrsh7th/nvim-cmp' }
	use { 'hrsh7th/cmp-buffer' }
	use { 'hrsh7th/cmp-path' }
	use { 'hrsh7th/cmp-nvim-lua' }
	use { 'hrsh7th/cmp-nvim-lsp' }
	use { 'onsails/lspkind.nvim' }
	use { 'L3MON4D3/LuaSnip' }
	use { 'rafamadriz/friendly-snippets' }
	use {
		'numToStr/Comment.nvim',
		config = function()
			require('Comment').setup()
		end
	}
	use "907th/vim-auto-save"
	use "farmergreg/vim-lastplace"
	use 'mhinz/vim-signify'

	-- Telescope
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.0',
		requires = { { 'nvim-lua/plenary.nvim' } }
	}
	use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
	use {
		"nvim-telescope/telescope-frecency.nvim",
		requires = { "tami5/sqlite.lua" }
	}
	use "nvim-telescope/telescope-file-browser.nvim"
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}
	use "kyazdani42/nvim-tree.lua"
end)
