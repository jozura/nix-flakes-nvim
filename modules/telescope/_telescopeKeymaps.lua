function keymaps()
    local builtin = require('telescope.builtin')

    -- Movement
    vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
    vim.keymap.set('n', '<C-p>', builtin.git_files, {})
    vim.keymap.set('n', '<leader>ps', builtin.live_grep, {})
    vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})

    -- Git
    vim.keymap.set('n', '<leader>gs', builtin.git_status, {})
    vim.keymap.set('n', '<leader>gd', builtin.lsp_definitions, {})
    vim.keymap.set('n', '<leader>im', builtin.lsp_implementations, {})
    vim.keymap.set('n', '<leader>re', builtin.lsp_references, {})
end

return keymaps

