local M = {}

local function setKeybindings()
	-- Move between windows
	vim.keymap.set("n", "<C-h>", "<C-w>h", {})
	vim.keymap.set("n", "<C-j>", "<C-w>j", {})
	vim.keymap.set("n", "<C-k>", "<C-w>k", {})
	vim.keymap.set("n", "<C-l>", "<C-w>l", {})
	-- Cycle between buffers
	vim.keymap.set("n", "<S-h>", ":bp<CR>", {})
	vim.keymap.set("n", "<S-l>", ":bn<CR>", {})
	-- Switch to next buffer and close previous one
	vim.keymap.set("n", "<C-q>", ":bn<CR>:bd #<CR>")
    -- Format and save
	vim.keymap.set("n", "<C-s>", ":lua vim.lsp.buf.format()<CR>:w<CR>")
end

function M.setup()
	-- Set <leader> key to spacebar
	vim.g.mapleader = " "
	-- Fix indenting / tab
	vim.opt.smartindent = true
	vim.opt.autoindent = true
	vim.opt.tabstop = 4
	vim.opt.shiftwidth = 4
	vim.opt.expandtab = true
	-- Use system clipboard
	vim.opt.clipboard = "unnamedplus"
	-- Enable mouse in normal and visual mode
	vim.opt.mouse = "nv"
	-- Set termguicolors to enable highlight groups
	vim.opt.termguicolors = true
	-- Highlight the whole line the cursor is on
	-- (only in the current window)
	vim.cmd([[
		augroup CursorLineHighlight
		  autocmd!
		  autocmd WinEnter * lua vim.wo.cursorline = true
		  autocmd WinLeave * lua vim.wo.cursorline = false
		augroup END
	]])
	-- vim.opt.cursorline = true
	-- Enable line numbers
	vim.wo.relativenumber = true
	-- Set a line length guide on column 110
	vim.opt.colorcolumn = "110"
	-- When doing a vertical split, put the new buffer on the right side
	vim.opt.splitright = true
	-- Disable netrw (the default file explorer)
	vim.g.loaded_netrw = 1
	vim.g.loaded_netrwPlugin = 1
	-- Ignore case in searching
	vim.opt.ignorecase = true
    -- Dont wrap lines
    vim.wo.wrap = false
	-- Except when explicitly searching for capital content
	vim.opt.smartcase = true
	-- Create a backup when overwriting a file
	vim.opt.backup = true
	-- Attempt to put it in ~/.nvim-backups, if the directory doesn't exist
	-- attempt to create /tmp/nvim-backups and put it there
	vim.opt.backupdir = "~/.nvim-backups,/tmp/nvim-backups"
	-- Persist undo history over restarts
	vim.opt.undofile = true
	vim.opt.undodir = "~/.nvim-undos,/tmp/nvim-undos"
	-- Show a confirmation when trying to quit a modified buffer
	vim.opt.confirm = true
	-- Stop highlighting words after a search
	vim.opt.hlsearch = false
	-- Configure completion menu
	vim.o.completeopt = "menuone,noselect"
	-- Always show a two character column next to the line number
	vim.wo.signcolumn = "yes"

    setKeybindings()
end


return M  -- Return the module table
