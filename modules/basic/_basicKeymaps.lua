function keymaps()
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

return keymaps
