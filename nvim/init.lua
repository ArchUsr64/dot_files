local vim = vim
local nvim_lsp = require("lspconfig")

local on_attach =
function() Lsp_maps() end

require("user.keymap")
require("user.plugins")
require("user.cmp")
require("user.rust_tools")
require("user.set")
require("user.color")

nvim_lsp.sumneko_lua
		.setup {
			on_attach = on_attach,
		}

nvim_lsp.clangd.setup {
	on_attach = on_attach,
}

vim.api.nvim_create_autocmd({ "BufEnter" },
	{ command = "lua fix_settings()" })
