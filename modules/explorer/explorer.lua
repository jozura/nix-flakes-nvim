explorer = {}

print("hello exp1")
explorer.setup = require("explorerSetup")
print("hello exp2")
explorer.setkeys = require("explorerKeymaps").setKeys
explorer.test = "asd"
return explorer
