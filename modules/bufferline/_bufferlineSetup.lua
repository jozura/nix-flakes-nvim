function setup()
    require("bufferline").setup {
        options = {
            numbers = "ordinal",
            truncate_names = false,
        }
    }
end

return setup
