local vim = vim

vim.api.nvim_create_autocmd("TextYankPost", {
	command = "silent! lua vim.highlight.on_yank({timeout=150})",
})

vim.cmd("set list listchars=tab:\\│\\ ,trail:")
vim.cmd("colorscheme delek")

function Fix_color()
	vim.cmd("hi LspInlayHint gui=italic guifg=#4444ff guibg=#ddddff ")

	vim.cmd("hi DiagnosticVirtualTextWarn gui=italic guifg=#888800 guibg=#eeee44")
	vim.cmd("hi DiagnosticSignWarn gui=italic guifg=#888800 guibg=#eeee44")
	vim.cmd("hi lualine_b_diagnostics_warn_normal gui=italic guifg=#aaaa00")
	vim.cmd("hi lualine_b_diagnostics_warn_insert gui=italic guifg=#aaaa00")

	vim.cmd("hi DiagnosticVirtualTextError gui=italic guifg=#880000 guibg=#ffdddd")
	vim.cmd("hi DiagnosticSignError gui=italic guifg=#880000 guibg=#ffdddd")
	vim.cmd("hi lualine_b_diagnostics_error_normal gui=italic guifg=#ff0000")
	vim.cmd("hi lualine_b_diagnostics_error_insert gui=italic guifg=#ff0000")

	vim.cmd("hi DiagnosticVirtualTextHint gui=italic guifg=#008800 guibg=#88dd88")
	vim.cmd("hi DiagnosticSignHint gui=italic guifg=#008800 guibg=#88dd88")
	vim.cmd("hi lualine_b_diagnostics_hint_normal gui=italic guifg=#008800")
	vim.cmd("hi lualine_b_diagnostics_hint_insert gui=italic guifg=#008800")

	vim.cmd("hi DiagnosticVirtualTextInfo gui=italic guifg=#008800 guibg=#88dd88")
	vim.cmd("hi DiagnosticSignInfo gui=italic guifg=#008800 guibg=#88dd88")
	vim.cmd("hi lualine_b_diagnostics_info_normal gui=italic guifg=#008800")
	vim.cmd("hi lualine_b_diagnostics_info_insert gui=italic guifg=#008800")

	vim.cmd("hi ColorColumn guifg=#dddddd guibg=#dddddd")
	vim.cmd("hi NonText guibg=None guifg=#bbbbbb")
	vim.cmd("hi SignColumn guibg=None")
	vim.cmd("hi CursorLine guibg=#dddddd")
	vim.cmd("hi CursorLineNr guifg=#000000 guibg=#dddddd gui=bold")
	vim.cmd("hi CursorLineSign guifg=#000000 guibg=#dddddd gui=bold")
	vim.cmd("hi LineNrAbove guifg=#888888")
	vim.cmd("hi LineNrBelow guifg=#888888")
	vim.cmd("hi Visual guifg=None guibg=#dddddd gui=bold")

	vim.cmd("hi GitSignsDelete guifg=#ff0000 guibg=#ffdddd")
	vim.cmd("hi lualine_b_diff_removed_insert gui=italic guifg=#ff0000")
	vim.cmd("hi lualine_b_diff_removed_normal gui=italic guifg=#ff0000")

	vim.cmd("hi GitSignsChange guifg=#000088 guibg=#8888dd")
	vim.cmd("hi lualine_b_diff_modified_insert gui=italic guifg=#8888dd")
	vim.cmd("hi lualine_b_diff_modified_normal gui=italic guifg=#8888dd")

	vim.cmd("hi GitSignsAdd guifg=#008800 guibg=#88dd88")
	vim.cmd("hi lualine_b_diff_added_insert gui=italic guifg=#008800")
	vim.cmd("hi lualine_b_diff_added_normal gui=italic guifg=#008800")
end

Fix_color()
vim.api.nvim_create_autocmd({ "ColorScheme" },
	{ command = "lua Fix_color()" })
