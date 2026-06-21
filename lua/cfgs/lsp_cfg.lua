local M = {}

function M.setup()
    local autoCompleteCapabilities = require('cmp_nvim_lsp').default_capabilities()

    -- Apply shared capabilities to all LSP servers
    vim.lsp.config('*', {
        capabilities = autoCompleteCapabilities,
    })

    vim.lsp.config('clojure_lsp', {
        capabilities = (function()
            local capabilities = autoCompleteCapabilities
            capabilities.experimental = capabilities.experimental or {}
            capabilities.experimental.testTree = true
            return capabilities
        end)(),
    })

    vim.lsp.config('zls', {
        settings = {
            semantic_tokens = "partial",
        },
    })

    vim.lsp.config('lua_ls', {
        settings = {
            Lua = {
                runtime = {
                    version = 'LuaJIT',
                },
                diagnostics = {
                    globals = { 'vim' },
                },
                workspace = {
                    library = vim.api.nvim_get_runtime_file("", true),
                },
                telemetry = {
                    enable = false,
                },
            },
        },
    })


    vim.lsp.config('clangd', require("esp32").lsp_config())

    vim.lsp.enable({
        'clojure_lsp',
        'zls',
        'basedpyright',
        'ts_ls',
        'nil_ls',
        'hls',
        'tailwindcss',
        'lua_ls',
        'clangd'
    })
end

return M
