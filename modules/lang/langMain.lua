module = {}
local treesitterSetup = require('_treesitterSetup')
local autocompleteSetup = require('_autocompleteSetup')
local lspSetup = require('_lspSetup')
function runSetup()
	lspSetup(autocompleteSetup())
	treesitterSetup()
end

module.runSetup = runSetup

return module
