local vim = vim
local leader = " "
vim.g.mapleader = leader
vim.g.maplocalleader = leader


local function Map(m, k, v)
	vim.keymap.set(m, k, v, { noremap = true, silent = true })
end

Map("n", "<leader>", "<Nop>")
Map("n", "<BS>", "<Nop>")
Map("i", "<S-BS>", "<DEL>")

Map("n", "<c-h>", "<c-w>h")
Map("n", "<c-j>", "<c-w>j")
Map("n", "<c-k>", "<c-w>k")
Map("n", "<c-l>", "<c-w>l")
Map("n", "H", "<cmd>bp<CR>")
Map("n", "L", "<cmd>bn<CR>")
Map("n", "<leader>c", "<cmd>bdelete<CR>")

Map("i", "<c-a>", "<HOME>")
Map("i", "<c-j>", "<c-e>")
Map("i", "<c-k>", "<c-y>")
Map("i", "<c-e>", "<END>")
Map("i", "<c-BS>", "<c-w>")

-- Bracket comp
Map("i", "{", "{}<LEFT>")
Map("i", "[", "[]<LEFT>")
Map("i", "(", "()<LEFT>")
Map("i", "\"", "\"\"<LEFT>")

Map("n", "<leader>n", "<cmd>nohl<cr>")

Map("n", "<leader>f", "<cmd>ClangFormat<cr>")

Map("n", "<leader>b", "<cmd>NvimTreeToggle<cr>")
-- Telescope
Map("n", "tf", "<cmd>Telescope find_files<cr>")
Map("n", "ty", "<cmd>Telescope frecency<cr>")
Map("n", "tb", "<cmd>Telescope file_browser<cr>")
Map("n", "tl", "<cmd>Telescope live_grep<cr>")

local function Map(m, k, v)
	vim.keymap.set(m, k, v, { noremap = true, silent = true, buffer = 0 })
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
	vim.cmd([[if (&filetype == "openscad" || &filetype == "arduino")
	echo("Bruh")
	noremap <leader>f :ClangFormat<CR>
else
	:lua vim.keymap.set("n", "<leader>f", vim.lsp.buf.formatting, {noremap = true, silent = true, buffer = 0})
endif ]])
end

--Plugin
Map("n", "<leader>u", "<cmd>UndotreeToggle<CR>")
