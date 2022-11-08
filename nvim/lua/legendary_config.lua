-- Setup for legendary.nvim plugin and Norman keymap.

vim.g.mapleader = ','
--vim.o.langmap = 'nh,ik,oj,hl'

local std_opts = { noremap = true }

require('legendary').setup({
    include_builtin = false,
    include_legendary_cmds = true,
    select_prompt = nil,
    formatter = nil,
    col_separator_char = '|',
    most_recent_item_at_top = false,

    keymaps = {
        -- Modes
        { 'jk',    '<ESC>', mode = { 'i' },      description = 'Back to Normal mode' },
        { 's',     'i',     mode = { 'n' },      description = 'Insert before cursor' },
        { 'S',     'I',     mode = { 'n' },      description = 'Insert at beginning of line' },
        { 'a',              mode = { 'n' },      description = 'Append after cursor' },
        { 'A',              mode = { 'n' },      description = 'Append at end of line' },
        { '<C-b>', '<C-v>', mode = { 'n', 'i' }, description = 'Visual Block mode' },
        { '<C-v>', 'v',     mode = { 'n', 'i' }, description = 'Visual Char mode' },
        { '<C-l>', 'V',     mode = { 'n', 'i' }, description = 'Visual Line mode' },

        -- Arrows
        { 'n', 'h', mode = { 'n', 'v' }, description = 'Left' },
        { 'N', 'h', mode = { 'n', 'v' }, description = 'Left' },
        { 'i', 'k', mode = { 'n', 'v' }, description = 'Up' },
        { 'I', 'k', mode = { 'n', 'v',}, description = 'Up' },
        { 'o', 'j', mode = { 'n', 'v' }, description = 'Down' },
        { 'O', 'j', mode = { 'n', 'v' }, description = 'Down' },
        { 'h', 'l', mode = { 'n', 'v' }, description = 'Right' },
        { 'H', 'l', mode = { 'n', 'v' }, description = 'Right' },

        -- Editing
        { 'z',  'u',     mode = { 'n' }, description = 'Undo' },
        { 'y',  '<C-r>', mode = { 'n' }, description = 'Redo' },
        { 'x',  'd',     mode = { 'n' }, description = 'Cut/delete' },
        { 'xx', 'dd',    mode = { 'n' }, description = 'Cut line' },
        { 'X',  'd$',    mode = { 'n' }, description = 'Cut to end of line' },
        { 'c',  'y',     mode = { 'n' }, description = 'Copy/yank' },
        { 'cc', 'yy',    mode = { 'n' }, description = 'Copy line' },
        { 'C',  'y$',    mode = { 'n' }, description = 'Copy to end of line' },
        { 'v',  'p',     mode = { 'n' }, description = 'Paste after cursor' },
        { 'V',  'P',     mode = { 'n' }, description = 'Paste before cursor' },
        { 'g',  'c',     mode = { 'n' }, description = 'Change character' },
        { 'gg', 'cc',    mode = { 'n' }, description = 'Change entire line' },
        { 'G',  'C',     mode = { 'n' }, description = 'Change to end of line' },
        { 'e',  's',     mode = { 'n' }, description = 'Substitute character' },
        { 'E',  'S',     mode = { 'n' }, description = 'Substitute line' },

        -- Chording
        { 'i',           mode = { 'o' }, description = 'Inside (Chording)' },
        { 'a',           mode = { 'o' }, description = 'Around (Chording)' },
        { 'w',           mode = { 'o' }, description = 'Word (Chording)' },
        { 'b',           mode = { 'o' }, description = '( ) Block (Chording)' },
        { 'B',           mode = { 'o' }, description = '{ } Block (Chording)' },
        { 't',           mode = { 'o' }, description = '< > Block (Chording)' },
        { '\'',          mode = { 'o' }, description = 'Single quotes (Chording)' },
        { '\"',          mode = { 'o' }, description = 'Double quotes (Chording)' },

        -- Motions
        { 'p',  '%',     mode = { 'n' }, description = 'Jump to matching paren' },
        { 'vv', 'zz',    mode = { 'n' }, description = 'Center screen on cursor' },
        { 'f',  'b',     mode = { 'n' }, description = 'Previous word' },
        { 'F',  'B',     mode = { 'n' }, description = 'Previous Word' },
        { 'd',  '^',     mode = { 'n' }, description = 'First non-blank char' },
        { 'D',  '0',     mode = { 'n' }, description = 'Start of line' },
        { 'u',  'e',     mode = { 'n' }, description = 'End of word' },
        { 'U',  'E',     mode = { 'n' }, description = 'End of Word' },
        { 'r',  'w',     mode = { 'n' }, description = 'Next word' },
        { 'R',  'W',     mode = { 'n' }, description = 'Next Word' },
        { 'l',  '$',     mode = { 'n' }, description = 'End of line' },

        -- Insert Mode Stuff
        { '<C-t>', '<C-t>', mode = { 'i' }, description = 'Increase indent' },
        { '<C-T>', '<C-d>', mode = { 'i' }, description = 'Decrease indent' },
        { '<C-f>', '<C-w>', mode = { 'i' }, description = 'Delete word before cursor' },
        { '<C-d>', '<C-u>', mode = { 'i' }, description = 'Delete line before cursor' },

        -- Plugins
        { '<leader>l', ':Legendary<CR>', mode = { 'n' },      description = 'Legendary: Launch menu' },
        { '<C-Space>',                                        description = 'CMP: Complete' },
        { '<Tab>',                       mode = { 'i', 's' }, description = 'CMP: Previous' },
        { '<C-Tab>',                     mode = { 'i', 's' }, description = 'CMP: Next' },
        { '<CR>',                                             description = 'CMP: Confirm' },
        { '<Esc>',                                            description = 'CMP: Cancel' },
    },

    commands = {},

    functions = {},

    autocmds = {},
    
    scratchpad = {
        display_results = 'float'
    },
})
