local M = {}

function M.setup()
    local npairs = require('nvim-autopairs')
    local Rule = require('nvim-autopairs.rule')
    npairs.setup({
        check_ts = true,
        disable_filetype = { "TelescopePrompt", "spectre_panel", "clj", "cljs", "cljc" },
    })
    local cmp_autopairs = require('nvim-autopairs.completion.cmp')
    local cmp = require('cmp')
    cmp.event:on(
        'confirm_done',
        cmp_autopairs.on_confirm_done()
    )


    local ts_conds = require('nvim-autopairs.ts-conds')


    -- press % => %% only while inside a comment or string
    npairs.add_rules({
        Rule("%", "%", "lua")
            :with_pair(ts_conds.is_ts_node({ 'string', 'comment' })),
        Rule("$", "$", "lua")
            :with_pair(ts_conds.is_not_ts_node({ 'function' }))
    })
end

return M
