function setup()
    require'nvim-treesitter.configs'.setup {
      highlight = {
        enable = true,
        disable = {},
        additional_vim_regex_highlighting = false,
      },
    }
end

return setup

