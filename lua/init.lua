local basic = require("basic_cfg")
local nvimTree = require("nvim_tree_cfg")
local gitsigns = require("gitsigns_cfg")
local bufferline = require("bufferline_cfg")
local colorscheme = require("colorscheme_cfg")
local lualine = require("lualine_cfg")
local treesitter = require("treesitter_cfg")
local lsp = require("lsp_cfg")
local nvimCmp = require("nvim_cmp_cfg")
local whichkey = require("whichkey_cfg")
local nvimAutopair = require("nvim_autopair_cfg")

basic.setup()
nvimTree.setup()
gitsigns.setup()
bufferline.setup()
colorscheme.setup()
lualine.setup()
treesitter.setup()
lsp.setup()
nvimCmp.setup()
whichkey.setup()
nvimAutopair.setup()
