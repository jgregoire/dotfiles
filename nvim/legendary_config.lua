-- Setup for legendary.nvim plugin.

local std_opts = { noremap = true }

require('legendary').setup({
    include_builtin = true,
    include_legendary_cmds = true,
    select_prompt = nil,
    formatter = nil,
    col_separator_char = '|',
    most_recent_item_at_top = false,

    kepmaps = {},

    commands = {},

    functions = {},

    autocmds = {},
    
    scratchpad = {
        display_results = 'float'
    },
})
