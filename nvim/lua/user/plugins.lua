local vim = vim

vim.cmd [[packadd packer.nvim]]

require('lualine').setup()
require('telescope').load_extension("fzf")
require "telescope".load_extension("frecency")
require "telescope".load_extension("file_browser")
require('Comment').setup()
vim.cmd("let g:Hexokinase_highlighters = ['foreground']")
vim.cmd("let g:rainbow_conf = {'operators': '_\\.\\|,\\|;\\|:_',}")
vim.cmd("let g:rainbow_active = 1")
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
	use 'simrat39/rust-tools.nvim'

	-- Debugging
	use 'nvim-lua/plenary.nvim'
	use 'mfussenegger/nvim-dap'

	use { "RRethy/vim-hexokinase", run = 'make hexokinase' }
	use "luochen1990/rainbow"
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
end)
