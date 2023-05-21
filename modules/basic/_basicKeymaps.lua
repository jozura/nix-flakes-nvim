function keymaps()
	-- Move between buffers
    vim.keymap.set("n", "<leader>h", "<C-w>h", {})
    vim.keymap.set("n", "<leader>j", "<C-w>j", {})
    vim.keymap.set("n", "<leader>k", "<C-w>k", {})
    vim.keymap.set("n", "<leader>l", "<C-w>l", {})

	-- Launch the brave browser, (obviously need to have brave installed)
    vim.keymap.set("n", "<F10>", ":! nohup brave &> /dev/null &<CR>", {})
end

return keymaps

