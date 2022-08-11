local api = vim.api

require("user.keymap")
require("user.plugins")
require("user.set")

require("lspconfig").rust_analyzer.setup{
		on_attach = Lsp_maps,
}

require("lspconfig").sumneko_lua.setup{
	on_attach = Lsp_maps,
}

require("lspconfig").clangd.setup{
	on_attach = Lsp_maps,
}

api.nvim_create_autocmd("TextYankPost", {
  command = "silent! lua vim.highlight.on_yank()",
})

api.nvim_create_autocmd("TextChanged", {command = "w"})
