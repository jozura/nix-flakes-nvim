print("Enabled modules:")
for moduleName in string.gmatch(os.getenv("ENABLED_MODULES"), "%a+") do
    print("  "..moduleName)
    local moduleMain = moduleName.."Main"
    local module = require(moduleMain)
    if module.runSetup ~= nil then
        module.runSetup()
    end
    if module.setKeys ~= nil then
        module.setKeys()
    end
end
