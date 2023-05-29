function setup()
    -- Kanagawa colorscheme --
    -- Default options:
    require('kanagawa').setup({
        compile = false,  -- enable compiling the colorscheme
        undercurl = true, -- enable undercurls
        commentStyle = { italic = true },
        functionStyle = {},
        keywordStyle = { italic = true },
        statementStyle = { bold = true },
        typeStyle = {},
        transparent = false,   -- do not set background color
        dimInactive = false,   -- dim inactive window `:h hl-NormalNC`
        terminalColors = true, -- define vim.g.terminal_color_{0,17}
        colors = {
                               -- add/modify theme and palette colors
            palette = {},
            theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
        },
        --overrides = function(colors) -- add/modify highlights
        --    return {}
        --end,
        -- Load "wave" theme when 'background' option is not set
        theme = "wave",
        -- map the value of 'background' option to a theme
        background = {
            dark = "dragon", -- try "dragon" !
            light = "lotus"
        },
    })


    vim.cmd("colorscheme kanagawa")

    --  Add indentation guidelines --
    require("indent_blankline").setup {
        -- for example, context is off by default, use this to turn it on
        show_current_context = true,
        show_current_context_start = true,
    }
end

return setup
