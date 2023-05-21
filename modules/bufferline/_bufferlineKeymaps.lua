function keymaps()
    -- Cycle between buffers
    vim.keymap.set("n", "<C-H>", ":bp<CR>", {})
    vim.keymap.set("n", "<C-L>", ":bn<CR>", {})
end

return keymaps

