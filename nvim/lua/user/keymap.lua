local vim = vim
local leader = " "
vim.g.mapleader = leader
vim.g.maplocalleader = leader


local function Map(m, k, v)
    vim.keymap.set(m, k, v, { noremap = true, silent = true})
end

Map("n", "<leader>", "<Nop>")
Map("n", "<BS>", "<Nop>")

Map("n", "<c-h>", "<c-w>h")
Map("n", "<c-j>", "<c-w>j")
Map("n", "<c-k>", "<c-w>k")
Map("n", "<c-l>", "<c-w>l")

Map("i", "<c-a>", "<HOME>")
Map("i", "<c-j>", "<c-e>")
Map("i", "<c-k>", "<c-y>")
Map("i", "<c-e>", "<END>")
Map("i", "<c-BS>", "<c-w>")

-- Bracket comp
Map("i", "{", "{}<LEFT>")
Map("i", "[", "[]<LEFT>")
Map("i", "(", "()<LEFT>")
Map("i", "'", "''<LEFT>")
Map("i", "\"", "\"\"<LEFT>")

local function Map(m, k, v)
    vim.keymap.set(m, k, v, { noremap = true, silent = true, buffer = 0})
end

function Lsp_maps()
	Map("n", "K", vim.lsp.buf.hover)
	Map("n", "gd", vim.lsp.buf.definition)
	Map("n", "gt", vim.lsp.buf.type_definition)
	Map("n", "gi", vim.lsp.buf.implementation)
	Map("n", "]d", vim.diagnostic.goto_next)
	Map("n", "[d", vim.diagnostic.goto_prev)
	Map("n", "gr", vim.lsp.buf.references)
	Map("n", "<leader>rn", vim.lsp.buf.rename)
	Map("n", "<leader>k", vim.diagnostic.open_float)
	Map("n", "<leader>qf", vim.lsp.buf.code_action)
end
