function keymaps()
	-- Move between windows
	vim.keymap.set("n", "<C-h>", "<C-w>h", {})
	vim.keymap.set("n", "<C-j>", "<C-w>j", {})
	vim.keymap.set("n", "<C-k>", "<C-w>k", {})
	vim.keymap.set("n", "<C-l>", "<C-w>l", {})
	-- Cycle between buffers
	vim.keymap.set("n", "<S-h>", ":bp<CR>", {})
	vim.keymap.set("n", "<S-l>", ":bn<CR>", {})
	-- Switch to next buffer and close the previous one
	vim.keymap.set("n", "<C-q>", ":bn<CR>:bd #<CR>")
	-- Launch the brave browser, (obviously need to have brave installed)
	vim.keymap.set("n", "<F10>", ":! nohup brave &> /dev/null &<CR>", {})
end

return keymaps
