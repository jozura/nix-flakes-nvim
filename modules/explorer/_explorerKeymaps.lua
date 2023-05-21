keymaps = {}

function keymaps.keymaps()
	-- Toggle the tree
	vim.keymap.set('n', '<F6>', ':NvimTreeToggle<CR>', {})
	-- Find the currently focused file in the tree
	vim.keymap.set('n', '<F5>', ':NvimTreeFindFile<CR>', {})
end

-- Need to set these keymaps in an exported function that is imported in
-- nvim-tree.lua because nvim-tree sets them when it is toggled on
function keymaps.mapKeysOnAttach(api, opts)
	-- Default bindings that I frequently use. Specified here
	-- in case I ever wish to migrate to a different file explorer
	vim.keymap.set('n', '<CR>', api.node.open.edit,
		opts('Open'))
	vim.keymap.set('n', 'a', api.fs.create,
		opts('Create'))
	vim.keymap.set('n', 'd', api.fs.remove,
		opts('Delete'))
	vim.keymap.set('n', 'r', api.fs.rename,
		opts('Rename'))
	vim.keymap.set('n', 'x', api.fs.cut,
		opts('Cut'))
	vim.keymap.set('n', 'c', api.fs.copy.node,
		opts('Copy'))
	vim.keymap.set('n', 'p', api.fs.paste,
		opts('Paste'))
	vim.keymap.set('n', '<C-v>', api.node.open.vertical,
		opts('Open: Vertical Split'))

	-- Custom mappings
	vim.keymap.set('n', '<C-u>', api.node.open.horizontal,
		opts('Open: Horizontal Split'))
	vim.keymap.set('n', '<F7>', api.tree.change_root_to_node,
		opts('CD'))
end

return keymaps
