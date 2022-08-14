local vim = vim

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.wrap = false
vim.opt.autowriteall = true
vim.opt.hlsearch = true
vim.opt.hidden = true
vim.opt.smartindent = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = "/home/tuxusr/.nvim/undodir"
vim.opt.undofile = true
vim.opt.scrolloff = 10

vim.opt.clipboard = "unnamedplus"

vim.opt.relativenumber = true
vim.opt.number = true

vim.opt.mouse = "a"
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "100"
vim.opt.title = true
vim.opt.guifont = "Fira Code:h18"

function fix_settings()
	vim.opt.tabstop = 2
	vim.opt.shiftwidth = 2
	vim.opt.expandtab = false

	vim.opt.laststatus = 3
end

fix_settings()

vim.opt.timeout = false
vim.opt.termguicolors = true
vim.opt.cursorline = true

vim.opt.splitbelow = true
vim.opt.splitright = true
