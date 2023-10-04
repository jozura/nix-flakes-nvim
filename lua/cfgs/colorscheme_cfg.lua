local M = {}

function M.setup()
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
            palette = {},
            theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
        },
        theme = "wave",
        background = {
            dark = "dragon",
            light = "lotus"
        },
    })


    vim.cmd("colorscheme kanagawa")
end

return M
