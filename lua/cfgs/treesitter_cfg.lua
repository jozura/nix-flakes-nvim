local M = {}

function M.setup()
    require 'nvim-treesitter.configs'.setup {
        -- The installed grammars are configured through nix "nvim-treesitter.withAllGrammars"
        ensure_installed = {},
        sync_install = false,
        auto_install = false,
        ignore_install = {},
        modules = {},

        highlight = {
            enable = true,
            disable = {},
            additional_vim_regex_highlighting = false,
        },
    }
end

return M
