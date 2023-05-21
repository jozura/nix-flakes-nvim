function setup()
	local lspconfig = require("lspconfig")
	lspconfig.clojure_lsp.setup{}
	lspconfig.tsserver.setup{}
	lspconfig.nil_ls.setup{}
	require'lspconfig'.lua_ls.setup {
	  settings = {
	    Lua = {
	      runtime = {
	        version = 'LuaJIT',
	      },
	      diagnostics = {
	        -- Get the language server to recognize the `vim` global
	        globals = {'vim'},
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

return setup
