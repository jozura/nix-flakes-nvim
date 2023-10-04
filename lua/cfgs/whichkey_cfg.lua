local M = {}

function M.setup()
	local wk = require("which-key")
	wk.register({
		["<leader>"] = {
			f = {
				name = "+file",
				f = { "<cmd>Telescope find_files<cr>", "Find File" },
				p = { "<cmd>Telescope git_files<cr>", "Find Git Project File" },
				s = { "<cmd>Telescope live_grep<cr>", "Search In Files" },
				v = { "<cmd>Telescope help_tags<cr>", "Search In Vim Help Files" },
				r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
			},
			g = {
				name = "+git",
				s = { "<cmd>Telescope git_status<cr>", "Git Status" },
				b = { "<cmd>Telescope git_branches<cr>", "Git Branches" },
				c = { "<cmd>Telescope git_commits<cr>", "Git commits" },
				w = { "<cmd>Telescope git stash<cr>", "Show Git Stash" },
			},
			l = {
				name = "+lsp",
				h = { vim.lsp.buf.signature_help, "Signature" },
				f = { vim.lsp.buf.format, "Format" },
				a = { vim.lsp.buf.code_action, "Code Action" },
				e = { vim.diagnostic.open_float, "Diagnostics" },
				o = { vim.lsp.buf.hover, "Hover" },
				n = { vim.diagnostic.goto_next, "Next Problem" },
				p = { vim.diagnostic.goto_prev, "Prev Problem" },
				t = { vim.lsp.buf.type_definition, "Type Definition" },
				d = { vim.lsp.buf.definition, "Definition" },
				s = { vim.lsp.buf.rename, "Set New Name" },
			},
			t = {
				name = "+telescope-lsp",
				d = { "<cmd>Telescope lsp_definitions<cr>", "Definitions" },
				i = { "<cmd>Telescope lsp_implementations<cr>", "Implementations" },
				r = { "<cmd>Telescope lsp_references<cr>", "References" },
				e = { "<cmd>Telescope diagnostics<cr>", "Diagnostics" },
			}
		},
	})
end

return M
