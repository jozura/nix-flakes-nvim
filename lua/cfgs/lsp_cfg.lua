local M = {}

function M.setup()
    local autoCompleteCapabilities = require('cmp_nvim_lsp').default_capabilities()
    local lspconfig = require("lspconfig")
    lspconfig.clojure_lsp.setup { capabilities = autoCompleteCapabilities }
    lspconfig.zls.setup { capabilities = autoCompleteCapabilities }
    lspconfig.basedpyright.setup{ capabilities = autoCompleteCapabilities }
    lspconfig.ts_ls.setup { capabilities = autoCompleteCapabilities }
    lspconfig.nil_ls.setup { capabilities = autoCompleteCapabilities }
    lspconfig.hls.setup { capabilities = autoCompleteCapabilities }
    lspconfig.lua_ls.setup {
        capabilities = autoCompleteCapabilities,
        settings = {
            Lua = {
                runtime = {
                    version = 'LuaJIT',
                },
                diagnostics = {
                    -- Get the language server to recognize the `vim` global
                    globals = { 'vim' },
                },
                workspace = {
                    -- Make the server aware of Neovim runtime files
                    library = vim.api.nvim_get_runtime_file("", true),
                },
                telemetry = {
                    enable = false,
                },
            },
        },
    }
end

return M
