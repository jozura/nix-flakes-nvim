local M = {}

function M.setup()
    require("catppuccin").setup({
        flavour = "macchiato", -- latte, frappe, macchiato, mocha
        auto_integrations = true,
    })

    -- setup must be called before loading
    vim.cmd.colorscheme "catppuccin"
end

return M
