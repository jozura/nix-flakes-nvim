local basic = require("basic_cfg")
local nvimTree = require("nvim_tree_cfg")
local gitsigns = require("gitsigns_cfg")
local colorscheme = require("colorscheme_cfg")
local lualine = require("lualine_cfg")
local treesitter = require("treesitter_cfg")
local lsp = require("lsp_cfg")
local nvimCmp = require("nvim_cmp_cfg")
local whichkey = require("whichkey_cfg")
local nvimAutopair = require("nvim_autopair_cfg")
local marks = require("marks_cfg")
local telescope = require("telescope_cfg")

-- Conjure setup; disables LSP diagnostics from the Conjure output buffer =>
-- no ugly red markings
vim.api.nvim_create_autocmd('DiagnosticChanged', {
  pattern = {"conjure-log-*"},
  callback = function(args)
    local diagnostics = args.data.diagnostics

    if (diagnostics[1] ~= nil) then
      local bufnr = diagnostics[1]["bufnr"]
      local namespace = diagnostics[1]["namespace"]
      vim.diagnostic.disable(bufnr)
      vim.diagnostic.reset(namespace, bufnr)
    end
  end,
})

basic.setup()
nvimTree.setup()
gitsigns.setup()
colorscheme.setup()
lualine.setup()
treesitter.setup()
lsp.setup()
nvimCmp.setup()
whichkey.setup()
nvimAutopair.setup()
marks.setup()
telescope.setup()

require('clojure-test-tree').setup()
