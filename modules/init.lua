print("Enabled modules:")
local e = os.getenv("ENABLED_MODULES")
assert(e, "ENABLED_MODULES environment variable is not set")
for moduleName in string.gmatch(e, "%a+") do
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
