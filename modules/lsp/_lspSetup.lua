function setup()
	local lspconfig = require("lspconfig")
	lspconfig.clojure_lsp.setup{}

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

	-- Doesnt seem to work, probably need to set the cmd and add jls to path
--	lspconfig.java_language_server.setup{}
--
	require("lspsaga").setup({
  		preview = {
  		  lines_above = 0,
  		  lines_below = 10,
  		},
  		scroll_preview = {
  		  scroll_down = "<C-f>",
  		  scroll_up = "<C-b>",
  		},
  		request_timeout = 2000,

  		-- See Customizing Lspsaga's Appearance
  		-- ui = { ... },

  		-- For default options for each command, see below
  		-- finder = { ... },
  		-- code_action = { ... }
  		-- etc.
	})
end

return setup
