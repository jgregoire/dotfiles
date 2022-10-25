-- Setup for legendary.nvim plugin.

local std_opts = { noremap = true }

require('legendary').setup({
    include_builtin = true,
    include_legendary_cmds = true,
    select_prompt = nil,
    formatter = nil,
    col_separator_char = '|',
    most_recent_item_at_top = false,

    keymaps = {
        { 's', 'i', description = 'Insert after cursor', opts = {}, mode = { 'n' } },
        { 'jk', '<ESC>', description = 'Back to Normal mode', opts = {} },
    },

    commands = {},

    functions = {},

    autocmds = {},
    
    scratchpad = {
        display_results = 'float'
    },
})
