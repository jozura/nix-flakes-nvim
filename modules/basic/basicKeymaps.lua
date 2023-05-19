function setKeys()
    vim.keymap.set("n", "<leader>h", "<C-w>h", {})
    vim.keymap.set("n", "<leader>j", "<C-w>j", {})
    vim.keymap.set("n", "<leader>k", "<C-w>k", {})
    vim.keymap.set("n", "<leader>l", "<C-w>l", {})

    vim.keymap.set("n", "<leader>qa", ":qa<CR>", {})
    vim.keymap.set("n", "<leader>sa", ":wqa!<CR>", {})
end

return setKeys
