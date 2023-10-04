-- print("Enabled modules:")

local function getCwd()
    local pfile = io.popen('pwd')
    if (pfile == nil) then
        error("Could not print working directory with 'pwd'")
    else
        return pfile:read()
    end
end

local function getConfigs()
    local i, t = 0, {}
    local pfile = io.popen('ls -a "'..getCwd()..'"')
    if (pfile == nil) then
        error("Could not list directory contents.")
    else
        for filename in pfile:lines() do
            i = i + 1
            t[i] = filename
        end
        pfile:close()
        return t
    end
end

print(getConfigs())
