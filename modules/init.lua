local enabledModules = os.getenv("ENABLED_MODULES")
assert(enabledModules, "ENABLED_MODULES environment variable is not set")

-- print("Enabled modules:")
for moduleName in string.gmatch(enabledModules, "%a+") do
    -- print("  " .. moduleName)
    local moduleMain = moduleName .. "Main"
    local module = require(moduleMain)
    if module.runSetup ~= nil then
        module.runSetup()
    end
    if module.setKeys ~= nil then
        module.setKeys()
    end
end
