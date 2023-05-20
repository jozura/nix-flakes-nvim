--local basic = require("basicMain")
--local bufferline = require("bufferlineMain")
--local explorer = require("explorerMain")
--local colorscheme = require("colorschemeMain")
--local fuzzyfinder = require("fuzzyfinderMain")
--local treesitter = require("treesitterMain")

--for modulePath in string.gmatch(package.path, "([^"..";".."]+)") do
--	print(modulePath)
--end
print("hello")
print(os.getenv("ENABLED_MODULES"))
for moduleName in string.gmatch(os.getenv("ENABLED_MODULES"), "%a+") do
    print(moduleName)
    local moduleMain = moduleName.."Main"
    local module = require(moduleMain)
    if module.runSetup ~= nil then
        module.runSetup()
    end
    if module.setKeys ~= nil then
        module.setKeys()
    end
end
--print(package.path)
--basic.setKeys()
--basic.runSetup()
--print ("Basic setup")
--bufferline.setKeys()
--bufferline.runSetup()
--print ("Bufferline setup")
--explorer.runSetup()
--explorer.setKeys()
--print ("Explorer setup")
--colorscheme.runSetup()
--print ("Colorscheme setup")
--fuzzyfinder.setKeys()
--print ("Fuzzyfinder setup")
--treesitter.runSetup()
--print ("Treesitter setup")
