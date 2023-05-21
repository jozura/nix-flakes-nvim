function keymaps()
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
	vim.keymap.set("n", "<leader>lh", vim.lsp.buf.signature_help, {})
	vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, {})
	vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, {})
	vim.keymap.set("n", "<leader>le", vim.diagnostic.open_float, {})
	vim.keymap.set("n", "<leader>lo", vim.lsp.buf.hover, {})
	vim.keymap.set("n", "<leader>ln", vim.diagnostic.goto_next, {})
	vim.keymap.set("n", "<leader>lp", vim.diagnostic.goto_prev, {})
	vim.keymap.set("n", "<leader>lt", vim.lsp.buf.type_definition, {})
	vim.keymap.set("n", "<leader>ld", vim.lsp.buf.declaration, {})

	-- Telescope LSP bindings
	local telescope = require("telescope.builtin")
	vim.keymap.set('n', 'gd', telescope.lsp_definitions, {})
	vim.keymap.set('n', '<leader>li', telescope.lsp_implementations, {})
	vim.keymap.set('n', '<leader>lr', telescope.lsp_references, {})
	vim.keymap.set('n', '<leader>lx', telescope.diagnostics, {})
end

return keymaps
