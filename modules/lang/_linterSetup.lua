function setup()
	-- Not sure if I really need this
	-- local lint = require('lint')
	-- lint.linters_by_ft = {
	-- 	markdown = {'vale',},
	-- }

	-- vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	-- 	callback = function()
	-- 		lint.try_lint()
	-- 	end,
	-- })
end

return setup
