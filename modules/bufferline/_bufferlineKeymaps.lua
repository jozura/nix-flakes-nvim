function keymaps()
    -- Cycle between buffers
    vim.keymap.set("n", "<C-Left>", ":bp<CR>", {})
    vim.keymap.set("n", "<C-Right>", ":bn<CR>", {})
    -- Switch to next buffer and close the previous one
    vim.keymap.set("n", "<C-q>", ":bn<CR>:bd #<CR>")
end

return keymaps
