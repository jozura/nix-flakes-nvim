local basic = require("basic")
local explorer = require("explorer")
print("hello")
basic.setKeys()
basic.runSetup()
print(basic.asd)
print(explorer.asd)
function getTableKeys(tab)
  local keyset = {}
  for k,v in pairs(tab) do
    keyset[#keyset + 1] = k
  end
  return keyset
end

print(explorer.test)
-- basic.setKeys()

-- explorer.setup()
-- explorer.setKeys()
