function setup()
    -- Set leader to spacebar
    vim.g.mapleader = " "
    -- Fix indenting
    vim.opt.smartindent = true
    vim.opt.autoindent = true
    vim.opt.tabstop = 4
    vim.opt.shiftwidth = 4
    vim.opt.softtabstop = indent
    -- Use system clipboard
    vim.opt.clipboard = "unnamedplus"
    vim.opt.mouse = "n"
    -- Set termguicolors to enable highlight groups
    vim.opt.termguicolors = true
    -- Highlight the whole line the cursor is on
    vim.opt.cursorline = true
    -- Enable line numbers
    vim.wo.number = true
    vim.opt.colorcolumn = "80"
    -- Disable netrw
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
end

return setup

