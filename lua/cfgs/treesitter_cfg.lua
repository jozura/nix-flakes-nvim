local M = {}

function M.setup()
    require 'nvim-treesitter.configs'.setup {
      highlight = {
        enable = true,
        disable = {},
        additional_vim_regex_highlighting = false,
      },
    }
end

return M
