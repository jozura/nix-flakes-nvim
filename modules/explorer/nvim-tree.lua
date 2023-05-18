-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
    highlight_git = true,

    icons = {
      git_placement = "after",
      show = {
        folder = true,
        folder_arrow = true,
    	file = false,
    	git = true,
	modified = false,
      },
      glyphs = {
        default = " ",
	folder = {
          open = "",
	  empty = " ",
	  default = " ",
	  arrow_open = "->",
	  arrow_closed = "-",
	},
      }
    }
  },
  modified = {
    enable = true,
  },
  filters = {
    dotfiles = true,
  },
})
