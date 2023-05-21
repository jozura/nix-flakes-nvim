module = {}
local nvimCompSetup = require('_nvimCmpSetup')
local lspSetup = require('_lspSetup')
local lspKeymaps = require('_lspKeymaps')
function runSetup()
	lspSetup(nvimCompSetup())
	lspKeymaps()
end

module.runSetup = runSetup

return module
