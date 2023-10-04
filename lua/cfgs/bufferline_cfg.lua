local M = {}

local function setKeybindings()
	vim.keymap.set("n", "<leader>1", function() require("bufferline").go_to(1, true) end, {})
	vim.keymap.set("n", "<leader>2", function() require("bufferline").go_to(2, true) end, {})
	vim.keymap.set("n", "<leader>3", function() require("bufferline").go_to(3, true) end, {})
	vim.keymap.set("n", "<leader>4", function() require("bufferline").go_to(4, true) end, {})
	vim.keymap.set("n", "<leader>5", function() require("bufferline").go_to(5, true) end, {})
	vim.keymap.set("n", "<leader>6", function() require("bufferline").go_to(6, true) end, {})
	vim.keymap.set("n", "<leader>7", function() require("bufferline").go_to(7, true) end, {})
	vim.keymap.set("n", "<leader>8", function() require("bufferline").go_to(8, true) end, {})
	vim.keymap.set("n", "<leader>9", function() require("bufferline").go_to(9, true) end, {})
	vim.keymap.set("n", "<leader>$", function() require("bufferline").go_to(-1, true) end, {})
end

function M.setup()
    require("bufferline").setup {
        options = {
            numbers = "ordinal",
            truncate_names = false,
        }
    }

    setKeybindings()
end


return M
