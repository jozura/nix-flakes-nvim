local M = {}

-- TODO: MAIN_BRANCH
local MAIN_BRANCH = os.getenv("PROJECT_MAIN_BRANCH") or "main"
M.MAIN_BRANCH = MAIN_BRANCH

local telescope = require('telescope');
local previewers = require('telescope.previewers')
local pickers = require('telescope.pickers')
local sorters = require('telescope.sorters')
local finders = require('telescope.finders')

M.changed_on_branch = function()
    pickers.new({}, {
        prompt_title = "Git Changed Files",
        results_title = "Modified on current branch",
        finder = finders.new_oneshot_job(
            { 'git', 'diff', '--name-only', '--diff-filter=ACMR', '--relative', MAIN_BRANCH }, {}),
        sorter = sorters.get_fuzzy_file({}),
        previewer = previewers.new_termopen_previewer {
            get_command = function(entry)
                return { 'git', 'diff', '--diff-filter=ACMR', '--relative', MAIN_BRANCH, '--', entry.value }
            end
        },
    }):find()
end

function M.setup()
    telescope.setup()
end

return M
