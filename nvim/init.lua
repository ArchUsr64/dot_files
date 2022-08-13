local vim = vim
local nvim_lsp = require("lspconfig")

require("user.keymap")
require("user.plugins")
require("user.cmp")
require("user.rust_tools")
require("user.set")
require("user.color")

nvim_lsp.sumneko_lua.setup{
	on_attach = Lsp_maps,
}

nvim_lsp.clangd.setup{
	on_attach = Lsp_maps,
}

vim.api.nvim_create_autocmd({"TextChanged", "InsertLeave"},
	{pattern = {"*.c", "*.lua", "*.cpp", "*.c", "*.hpp", "*.h", ".toml", "*.rs"},
	command = "w"})
