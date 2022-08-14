local vim = vim

local function ls_ready()
	print("Rust LS Ready!")
end

local rt = require("rust-tools")

local opts = {
	tools = { -- rust-tools options
		executor = require("rust-tools/executors").termopen,
		on_initialized = ls_ready,
		inlay_hints = {
			highlight = "Comment",
		},

		hover_actions = {
			border = {
				{ "", "FloatBorder" },
				{ "", "FloatBorder" },
				{ "", "FloatBorder" },
				{ "", "FloatBorder" },
				{ "", "FloatBorder" },
				{ "", "FloatBorder" },
				{ "", "FloatBorder" },
				{ "", "FloatBorder" },
			},
			auto_focus = false,
		},
	},

	server = {
		on_attach = function(client, bufnr)
			Lsp_maps()
			vim.keymap.set("n", "K", rt.hover_actions.hover_actions, { buffer = bufnr })
			vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
		end,
		standalone = true,
	},

	dap = {
		adapter = {
			type = "executable",
			command = "lldb-vscode",
			name = "rt_lldb",
		},
	},
}


rt.setup(opts)
rt.inlay_hints.enable()
