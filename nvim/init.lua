local vim = vim
local nvim_lsp = require("lspconfig")

local on_attach =
function()
	Lsp_maps()
end

require("user.keymap")
require("user.plugins")
require("user.cmp")
require("user.set")
require("user.color")

vim.cmd("autocmd! CursorHold,CursorHoldI * let @/='\\<'.expand('<cword>').'\\>'")
nvim_lsp.sumneko_lua
		.setup {
			on_attach = on_attach,
		}

nvim_lsp.clangd.setup {
	on_attach = on_attach,
}

nvim_lsp.rust_analyzer.setup {
	on_attach = function(c, b)
		require("lsp-inlayhints").on_attach(c, b)
		Lsp_maps()
	end,
	settings = {
		["rust-analyzer"] = {
			checkOnSave = {
				allFeatures = true,
				overrideCommand = {
					'cargo', 'clippy', '--workspace', '--message-format=json', '--all-targets', '--all-features'
				}
			}
		}
	}
}

nvim_lsp.jsonls.setup {
	on_attach = on_attach,
}

vim.api.nvim_create_autocmd({ "BufEnter" },
	{ command = "lua fix_settings()" })
