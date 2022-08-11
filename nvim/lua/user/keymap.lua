local g = vim.g
local leader = " "
g.mapleader = leader
g.maplocalleader = leader

function Map(m, k, v)
    vim.keymap.set(m, k, v, { noremap = true, silent = true })
end

function Map_multi_mode(m, k, v)
	for i, mode in pairs(m) do
		Map(mode, k, v)
	end
end

Map("n", "<leader>", "<Nop>")

-- Splits
Map("n", "<c-h>", "<c-w>h")
Map("n", "<c-j>", "<c-w>j")
Map("n", "<c-k>", "<c-w>k")
Map("n", "<c-l>", "<c-w>l")
Map("n", "<leader>rv", ":vertical resize ")
Map("n", "<leader>rh", ":resize ")
--map("n", "<leader>tv", "<c-w>t<c-w>H")
--map("n", "<leader>th", "<c-w>t<c-w>V")

Map("i", "<c-h>", "<LEFT>")
Map("i", "<c-j>", "<DOWN>")
Map("i", "<c-k>", "<UP>")
Map("i", "<c-l>", "<RIGHT>")
Map("i", "{", "{}<LEFT>")
Map("i", "[", "[]<LEFT>")
Map("i", "(", "()<LEFT>")
Map("i", "'", "''<LEFT>")
Map("i", "\"", "\"\"<LEFT>")

-- LSP
function Lsp_maps()
	Map("n", "K", vim.lsp.buf.hover)
	Map("n", "gd", vim.lsp.buf.definition)
	Map("n", "gt", vim.lsp.buf.type_definition)
	Map("n", "gi", vim.lsp.buf.implementation)
	Map("n", "g]", vim.diagnostic.goto_next)
	Map("n", "g[", vim.diagnostic.goto_prev)
	Map("n", "gr", vim.lsp.buf.references)
	Map("n", "<leader>rn", vim.lsp.buf.rename)
	Map("n", "<leader>k", vim.diagnostic.open_float)
end
