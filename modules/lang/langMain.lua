module = {}
local nvimCompSetup = require('_nvimCmpSetup')
local lspSetup = require('_lspSetup')
function runSetup()
	lspSetup(nvimCompSetup())
end

module.runSetup = runSetup

return module
