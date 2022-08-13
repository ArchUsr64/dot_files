local vim = vim

vim.cmd [[packadd packer.nvim]]

require('lualine').setup()
require('tabline').setup()
require('telescope').load_extension('fzf')
require('Comment').setup()
vim.cmd("let g:Hexokinase_highlighters = ['foreground']")
vim.cmd("let g:rainbow_conf = {'operators': '_\\.\\|,\\|;\\|:_',}")
vim.cmd("let g:rainbow_active = 1")

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
	use {
	  'nvim-lualine/lualine.nvim',
	  requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}
	use 'neovim/nvim-lspconfig'
	use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.0',
	  requires = { {'nvim-lua/plenary.nvim'} }
	}
	use 'simrat39/rust-tools.nvim'

	-- Debugging
	use 'nvim-lua/plenary.nvim'
	use 'mfussenegger/nvim-dap'

	use {"RRethy/vim-hexokinase", run = 'make hexokinase'}
	use "luochen1990/rainbow"
	use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
	use {'hrsh7th/nvim-cmp'}
	use {'hrsh7th/cmp-buffer'}
	use {'hrsh7th/cmp-path'}
	use {'hrsh7th/cmp-nvim-lua'}
	use {'hrsh7th/cmp-nvim-lsp'}
	use {'onsails/lspkind.nvim'}
	use {'L3MON4D3/LuaSnip'}
	use {'rafamadriz/friendly-snippets'}
	use {
	    'numToStr/Comment.nvim',
	    config = function()
	        require('Comment').setup()
	    end
	}
	use {
	  'kdheepak/tabline.nvim',
	  config = function()
	    require'tabline'.setup {
	      enable = true,
	      options = {
	        section_separators = {'', ''},
	        component_separators = {'', ''},
	        max_bufferline_percent = 66, -- set to nil by default, and it uses vim.o.columns * 2/3
	        show_tabs_always = false, -- this shows tabs only when there are more than one tab or if the first tab is named
	        show_devicons = true, -- this shows devicons in buffer section
	        show_bufnr = false, -- this appends [bufnr] to buffer section,
	        show_filename_only = false, -- shows base filename only instead of relative path in filename
	        modified_icon = "+ ", -- change the default modified icon
	        modified_italic = false, -- set to true by default; this determines whether the filename turns italic if modified
	        show_tabs_only = false, -- this shows only tabs instead of tabs + buffers
	      }
	    }
	    vim.cmd[[
	      set guioptions-=e " Use showtabline in gui vim
	      set sessionoptions+=tabpages,globals " store tabpages and globals in session
	    ]]
	  end,
	  requires = { { 'hoob3rt/lualine.nvim', opt=true }, {'kyazdani42/nvim-web-devicons', opt = true} }
	}
end)
