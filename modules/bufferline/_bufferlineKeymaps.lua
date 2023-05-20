function keymaps()
    -- Cycle buffers
    vim.keymap.set("n", "<C-H>", ":bp<CR>", {})
    vim.keymap.set("n", "<C-L>", ":bn<CR>", {})
end

return keymaps

