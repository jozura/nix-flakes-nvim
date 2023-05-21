function keymaps()
    local builtin = require('telescope.builtin')

    -- Basic
    vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
    vim.keymap.set('n', '<C-p>', builtin.git_files, {})
    vim.keymap.set('n', '<leader>ps', builtin.live_grep, {})
    vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})

    -- Git
    vim.keymap.set('n', '<leader>gs', builtin.git_status, {})
    -- View branches
    -- keybinds:
    -- <CR> checkout
    -- <C-r> rebase
    -- <C-t> track
    -- <C-a> create
    -- <C-s> switch
    -- <C-d> delete
    -- <C-y> merge
    vim.keymap.set('n', '<leader>gb', builtin.git_branches, {})
    -- Apply stash <CR>
    vim.keymap.set('n', '<leader>gw', builtin.git_stash, {})
    -- View commits
    -- keybinds:
    -- <CR> checkout
    -- <C-r>s soft reset
    -- <C-r>h hard reset
    -- <C-r>m mixed reset
    vim.keymap.set('n', '<leader>gc', builtin.git_commits, {})
end

return keymaps
