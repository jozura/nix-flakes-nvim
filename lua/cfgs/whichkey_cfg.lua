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
				b = { "<cmd>Gitsigns blame_line<cr>", "Git Blame" },
				d = { "<cmd>Gitsigns diffthis<cr>", "Git Diff" },
				c = { "<cmd>Telescope git_commits<cr>", "Git commits" },
				w = { "<cmd>Telescope git stash<cr>", "Show Git Stash" },
				a = { "<cmd>Gitsign stage_hunk<cr>", "Stage hunk" },
				u = { "<cmd>Gitsign undo_stage_hunk<cr>", "Undo stage hunk" },
				f = { "<cmd>Gitsign stage_buffer<cr>", "Stage buffer" },
				h = { "<cmd>Gitsign toggle_linehl<cr>", "Toggle line highlight" },
			},
			s = {
				name = "+gitsigns",
				h = { "<cmd>Gitsigns toggle_linehl<cr>", "Toggle line hl" },
				b = { "<cmd>Gitsigns toggle_current_line_blame<cr>", "Toggle current line blame" },
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
				name = "+telescope",
				d = { "<cmd>Telescope lsp_definitions<cr>", "Definitions" },
				i = { "<cmd>Telescope lsp_implementations<cr>", "Implementations" },
				r = { "<cmd>Telescope lsp_references<cr>", "References" },
				e = { "<cmd>Telescope diagnostics<cr>", "Diagnostics" },
				h = { "<cmd>Telescope harpoon marks<cr>", "Harpoon" },
			},
            h = {
                name = "+harpoon",
                m = { "<cmd>lua require(\"harpoon.mark\").add_file()<cr>", "Mark file" },
                n = { "<cmd>lua require(\"harpoon.ui\").nav_next()<cr>", "Nav next" },
                p = { "<cmd>lua require(\"harpoon.ui\").nav_prev()<cr>", "Nav prev" },
                l = { "<cmd>lua require(\"harpoon.ui\").toggle_quick_menu()<cr>", "Nav prev" },
                ["1"] = { "<cmd>lua require(\"harpoon.ui\").nav_file(1)<cr>", "Nav 1" },
                ["2"] = { "<cmd>lua require(\"harpoon.ui\").nav_file(2)<cr>", "Nav 2" },
                ["3"] = { "<cmd>lua require(\"harpoon.ui\").nav_file(3)<cr>", "Nav 3" },
                ["4"] = { "<cmd>lua require(\"harpoon.ui\").nav_file(4)<cr>", "Nav 4" },
                ["5"] = { "<cmd>lua require(\"harpoon.ui\").nav_file(5)<cr>", "Nav 5" },
            },
             p = {
                name = "definitioninsplit",
                v = { "<cmd>vsplit | lua vim.lsp.buf.definition()<cr>", "Vertical" },
                h = { "<cmd>belowright split | lua vim.lsp.buf.definition()<cr>", "Horizontal" },
            },
		},
	})
end

return M
