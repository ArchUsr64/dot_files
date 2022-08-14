local vim = vim

vim.api.nvim_create_autocmd("TextYankPost", {
	command = "silent! lua vim.highlight.on_yank({timeout=150})",
})

vim.cmd("set list listchars=tab:\\⏽\\ ,trail:,eol:")
vim.cmd("highlight NonText guifg=#333333")
vim.cmd("highlight PMenu guifg=#ffffff guibg=#222222")
vim.cmd("highlight PMenuSel guifg=#000000 guibg=#888888")
vim.cmd("highlight ColorColumn guifg=#ffffff guibg=#222222")
vim.cmd("highlight SignColumn guibg=#222222")
vim.cmd("highlight CursorLine guibg=#222222")
vim.cmd("highlight CursorLineNr guifg=#ffffff guibg=#222222")
vim.cmd("highlight LineNrAbove guifg=#888888")
vim.cmd("highlight LineNrBelow guifg=#888888")

--[[
nvim_lsp.sumneko_lua
		.setup {
			on_attach = on_attach,
		}
		]]
