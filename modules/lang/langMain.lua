module = {}
local nvimCompSetup = require('_nvimCmpSetup')
local lspSetup = require('_lspSetup')
local lspKeymaps = require('_lspKeymaps')
local linterSetup = require('_linterSetup')
function runSetup()
	lspSetup(nvimCompSetup())
	lspKeymaps()
	linterSetup()
end

module.runSetup = runSetup

return module
