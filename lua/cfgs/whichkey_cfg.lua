local M = {}

function M.setup()
	local wk = require("which-key")
    -- local telescope = require("telescope.builtin")
    -- local nvimtree = require('nvim-tree.api')
    -- nvimtree.fs.copy.absolute_path()
    -- telescope.live_grep()
	wk.add({
    { "<leader>f", group = "file" },
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find File" },
    { "<leader>fp", "<cmd>Telescope git_files<cr>", desc = "Find Git Project File" },
    { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Open Recent File" },
    { "<leader>fs", "<cmd>Telescope live_grep<cr>", desc = "Search In Files" },
    { "<leader>fv", "<cmd>Telescope help_tags<cr>", desc = "Search In Vim Help Files" },
    { "<leader>g", group = "git" },
    { "<leader>ga", "<cmd>Gitsign stage_hunk<cr>", desc = "Stage hunk" },
    { "<leader>gb", "<cmd>Gitsigns blame_line<cr>", desc = "Git Blame" },
    { "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Git commits" },
    { "<leader>gd", "<cmd>Gitsigns diffthis<cr>", desc = "Git Diff" },
    { "<leader>gf", "<cmd>Gitsign stage_buffer<cr>", desc = "Stage buffer" },
    { "<leader>gh", "<cmd>Gitsign toggle_linehl<cr>", desc = "Toggle line highlight" },
    { "<leader>gs", "<cmd>Telescope git_status<cr>", desc = "Git Status" },
    { "<leader>gu", "<cmd>Gitsign undo_stage_hunk<cr>", desc = "Undo stage hunk" },
    { "<leader>gw", "<cmd>Telescope git stash<cr>", desc = "Show Git Stash" },
    { "<leader>h", group = "harpoon" },
    { "<leader>h1", '<cmd>lua require("harpoon.ui").nav_file(1)<cr>', desc = "Nav 1" },
    { "<leader>h2", '<cmd>lua require("harpoon.ui").nav_file(2)<cr>', desc = "Nav 2" },
    { "<leader>h3", '<cmd>lua require("harpoon.ui").nav_file(3)<cr>', desc = "Nav 3" },
    { "<leader>h4", '<cmd>lua require("harpoon.ui").nav_file(4)<cr>', desc = "Nav 4" },
    { "<leader>h5", '<cmd>lua require("harpoon.ui").nav_file(5)<cr>', desc = "Nav 5" },
    { "<leader>hl", '<cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>', desc = "Nav prev" },
    { "<leader>hm", '<cmd>lua require("harpoon.mark").add_file()<cr>', desc = "Mark file" },
    { "<leader>hn", '<cmd>lua require("harpoon.ui").nav_next()<cr>', desc = "Nav next" },
    { "<leader>hp", '<cmd>lua require("harpoon.ui").nav_prev()<cr>', desc = "Nav prev" },
    { "<leader>n", group = "namespace" },
    { "<leader>nu", "<cmd>ConjureEval (in-ns 'user)<cr>", desc = "User ns" },
    { "<leader>l", group = "lsp" },
    { "<leader>lh", vim.lsp.buf.signature_help, desc = "Signature" },
    { "<leader>lf", vim.lsp.buf.format, desc = "Format", mode = "n" },
    { "<leader>lf", function()
                      vim.lsp.buf.format({
                        range = {
                          ["start"] = vim.api.nvim_buf_get_mark(0, "<"),
                          ["end"]   = vim.api.nvim_buf_get_mark(0, ">"),
                        },
                      })
                    end, desc = "Format selection (LSP)", mode = "v"
    },
    { "<leader>la", vim.lsp.buf.code_action, desc = "Code Action" },
    { "<leader>le", vim.diagnostic.open_float, desc = "Diagnostics" },
    { "<leader>lo", vim.lsp.buf.hover,  desc = "Hover" },
    { "<leader>ln", vim.diagnostic.goto_next, desc = "Next Problem" },
    { "<leader>lp", vim.diagnostic.goto_prev, desc = "Prev Problem"},
    { "<leader>lt", vim.lsp.buf.type_definition, desc = "Type Definition" },
    { "<leader>ld", vim.lsp.buf.definition, desc = "Definition" },
    { "<leader>ls", vim.lsp.buf.rename, desc = "Rename" },
    { "<leader>p", group = "definitioninsplit" },
    { "<leader>pd", "<cmd>vsplit | lua vim.lsp.buf.definition()<cr>", desc = "Vertical" },
    { "<leader>ph", "<cmd>belowright split | lua vim.lsp.buf.definition()<cr>", desc = "Horizontal" },
    { "<leader>pt", "<cmd>vsplit | lua vim.lsp.buf.type_definition()<cr>", desc = "Type Def" },
    { "<leader>r",  group = "reloaded-workflow" },
    { "<leader>rr", "<cmd>ConjureEval (do (in-ns 'user) (reset-reload))<cr>", desc = "Reset reload" },
    { "<leader>re", "<cmd>ConjureEval (do (in-ns 'user) (reset))<cr>", desc = "Reset" },
    { "<leader>s", group = "gitsigns" },
    { "<leader>sb", "<cmd>Gitsigns toggle_current_line_blame<cr>", desc = "Toggle current line blame" },
    { "<leader>sh", "<cmd>Gitsigns toggle_linehl<cr>", desc = "Toggle line hl" },
    { "<leader>t", group = "telescope" },
    { "<leader>td", "<cmd>Telescope lsp_definitions<cr>", desc = "Definitions" },
    { "<leader>te", "<cmd>Telescope diagnostics<cr>", desc = "Diagnostics" },
    { "<leader>th", "<cmd>Telescope harpoon marks<cr>", desc = "Harpoon" },
    { "<leader>ti", "<cmd>Telescope lsp_implementations<cr>", desc = "Implementations" },
    { "<leader>tr", "<cmd>Telescope lsp_references<cr>", desc = "References" },
  })
end

return M
