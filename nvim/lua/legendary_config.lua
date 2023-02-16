-- Setup for legendary.nvim plugin and Norman keymap.

vim.g.mapleader = ' '

require('legendary').setup({
    include_builtin = false,
    include_legendary_cmds = true,
    select_prompt = nil,
    formatter = nil,
    col_separator_char = '|',
    most_recent_item_at_top = false,

    -- Modifiers:
    --  C - Ctrl
    --  S - Shift
    --  A - Alt
    --  M - Alt (No meta key)
    --  A-S-C - Meh

    keymaps = {
        -- Modes
        { 'jk',    '<ESC>', mode = { 'i' },      description = 'Back to Normal mode' },
        { 'i',              mode = { 'n' },      description = 'Insert before cursor' },
        { 'I',              mode = { 'n' },      description = 'Insert at beginning of line' },
        { 'a',              mode = { 'n' },      description = 'Append after cursor' },
        { 'A',              mode = { 'n' },      description = 'Append at end of line' },
        { 'n',     'o',     mode = { 'n' },      description = 'Append new line below' },
        { 'N',     'O',     mode = { 'n' },      description = 'Append new line above' },
        { 's',              mode = { 'n' },      description = 'Delete character and insert' },
        { '<C-b>', '<C-v>', mode = { 'n', 'i' }, description = 'Visual Block mode' },
        { '<C-v>', 'v',     mode = { 'n', 'i' }, description = 'Visual Char mode' },
        { '<C-l>', 'V',     mode = { 'n', 'i' }, description = 'Visual Line mode' },

        -- Editing
        { 'z',   'u',        mode = { 'n' },      description = 'Undo' },
        { 'y',   '<C-r>',    mode = { 'n' },      description = 'Redo' },
        { 'x',   'd',        mode = { 'n', 'v' }, description = 'Cut/delete [MOTION]' },
        { 'xw',  'dw',       mode = { 'n' },      description = 'Cut from cursor to start of next word' },
        { 'xx',  'dd',       mode = { 'n' },      description = 'Cut line' },
        { 'X',   'd$',       mode = { 'n' },      description = 'Cut to end of line' },
        { 'c',   'y',        mode = { 'n', 'v' }, description = 'Copy/yank [MOTION]' },
        { 'cw',  'yw',       mode = { 'n' },      description = 'Copy from cursor to start of next word' },
        { 'cc',  'yy',       mode = { 'n' },      description = 'Copy line' },
        { 'C',   'y$',       mode = { 'n' },      description = 'Copy to end of line' },
        { 'v',   'p',        mode = { 'n' },      description = 'Paste after cursor' },
        { 'V',   'P',        mode = { 'n' },      description = 'Paste before cursor' },
        { 'E',   'r',        mode = { 'n' },      description = 'Replace single character' },
        { 'e',   'c',        mode = { 'n' },      description = 'Edit/change [MOTION]'},
        { 'EE',  'R',        mode = { 'n' },      description = 'Replace characters until ESC' },
        { 'ee',  'cc',       mode = { 'n' },      description = 'Edit entire line' },
        { 'el',  'C',        mode = { 'n' },      description = 'Edit to end of line' },
        { 'j',   'gJ',       mode = { 'n' },      description = 'Join line below to current line' },
        { 'J',               mode = { 'n' },      description = 'Join line below to current line with a space between' },
	{ '<C-s>', ':w<CR>', mode = { 'n', 'i' }, description = 'Save file' },
        { '<C-v>', 'v',      mode = { 'n', 'i' }, description = 'Paste after cursor' },
        { '<C-w>',           mode = { 'i' },      description = 'Delete word before cursor'},
        { '<C-n>', '<C-j>',  mode = { 'i' },      description = 'Begin new line' },
        { '<C-t>',           mode = { 'i' },      description = 'Indent line' },
        { '<C-d>',           mode = { 'i' },      description = 'De-indent line' },
        -- This one's a doozy!
        { '<C-e>', [[<C-\><C-n>:call search('[>)\]}"'']', 'W')<CR>a]], mode = { 'i' }, description = 'Jump out of brackets or quotes' },

        -- Visual Mode
        { 'aw', mode = { 'v' }, description = 'Select a word' },
        { 'ab', mode = { 'v' }, description = 'Select a ( ) block' },
        { 'aB', mode = { 'v' }, description = 'Select a { } block' },
        { 'at', mode = { 'v' }, description = 'Select a < > block' },
        { 'ib', mode = { 'v' }, description = 'Select inside a ( ) block' },
        { 'iB', mode = { 'v' }, description = 'Select inside a { } block' },
        { 'it', mode = { 'v' }, description = 'Select inside a < > block' },

        -- Chording
        { 'i',      mode = { 'o' }, description = 'Inside (Chording)' },
        { 'a',      mode = { 'o' }, description = 'Around (Chording)' },
        { 't',      mode = { 'o' }, description = 'To [CHAR] (Chording)' },
        { 'r', 'l', mode = { 'o' }, description = 'Character to right' },
        { 'l', 'h', mode = { 'o' }, description = 'Character to left' },
        { 'w',      mode = { 'o' }, description = 'Word (Chording)' },
        { 'b',      mode = { 'o' }, description = '() Block (Chording)' },
        { ')',      mode = { 'o' }, description = '() Block (Chording)' },
        { '(',      mode = { 'o' }, description = '( ) Block (Chording)' },
        { 'B',      mode = { 'o' }, description = '{} Block (Chording)' },
        { '}',      mode = { 'o' }, description = '{} Block (Chording)' },
        { '{',      mode = { 'o' }, description = '{ } Block (Chording)' },
        { 't',      mode = { 'o' }, description = '<> Block (Chording)' },
        { '>',      mode = { 'o' }, description = '<> Block (Chording)' },
        { '<',      mode = { 'o' }, description = '< > Block (Chording)' },
        { ']',      mode = { 'o' }, description = '[] Block (Chording)' },
        { '[',      mode = { 'o' }, description = '[ ] Block (Chording)' },
        { '\'',     mode = { 'o' }, description = 'Single quotes (Chording)' },
        { '\"',     mode = { 'o' }, description = 'Double quotes (Chording)' },

        -- Motions
        { 'b',  '%',  mode = { 'n' }, description = 'Jump to matching bracket' },
--        { 'I', 'zz',  mode = { 'n' }, description = 'Center screen on cursor' },
        { 'w',  '^',  mode = { 'n' }, description = 'First non-blank char' },
        { 'W',  '0',  mode = { 'n' }, description = 'Start of line' },
        { 'd',  'b',  mode = { 'n' }, description = 'Start of previous word' },
        { 'D',  'B',  mode = { 'n' }, description = 'Start of previous Word' },
        { 'f',  'ge', mode = { 'n' }, description = 'End of previous word' },
        { 'F',  'gE', mode = { 'n' }, description = 'End of previous Word' },
        { 'u',  'w',  mode = { 'n' }, description = 'Start of next word' },
        { 'U',  'W',  mode = { 'n' }, description = 'Start of next Word' },
        { 'r',  'e',  mode = { 'n' }, description = 'End of next word' },
        { 'R',  'E',  mode = { 'n' }, description = 'End of next Word' },
        { 'l',  '$',  mode = { 'n' }, description = 'End of line' },
        { 'L', 'g_',  mode = { 'n' }, description = 'Last non-blank character of line' },

        -- Tabs and such
        { '<A-t>',     ':tabnew<CR>',         mode = { 'n' }, description = 'Create new tab' },
        { '<A-q>',     ':tabclose<CR>',       mode = { 'n' }, description = 'Close tab' },
        { '<A-Q>',     ':tabdo -q<CR>',       mode = { 'n' }, description = 'Close all tabs' },
        { '<A-qq>',    ':tabclose<CR>',       mode = { 'n'} , description = 'Close other tabs' },
        { '<A-o>',     ':e ',                 mode = { 'n' }, description = 'Open/edit file' },
        { '<A-Right>', ':BufferNext<CR>',     mode = { 'n' }, description = 'Barbar: Next tab' },
        { '<A-Left>',  ':BufferPrevious<CR>', mode = { 'n' }, description = 'Barbar: Previous tab' },

        -- Legendary
        { '<leader>l', ':Legendary<CR>', mode = { 'n' }, description = 'Legendary: Launch menu' },

        -- CMP
        { '<C-Space>', description = 'CMP: Complete' },
        { '<Tab>',   mode = { 'i', 's' }, description = 'CMP: Previous' },
        { '<C-Tab>', mode = { 'i', 's' }, description = 'CMP: Next' },
        { '<CR>',                         description = 'CMP: Confirm' },
        { '<Esc>',                        description = 'CMP: Cancel' },

        -- Telescope
        { '<leader>ff', '<cmd>Telescope find_files<cr>', mode = { 'n' }, description = 'Telescope: Find files' },
        { '<leader>fg', '<cmd>Telescope live_grep<cr>',  mode = { 'n' }, description = 'Telescope: Live grep' },
        { '<leader>fb', '<cmd>Telescope buffers<cr>',    mode = { 'n' }, description = 'Telescope: Buffers' },
        { '<leader>ft', '<cmd>Telescope help_tags<cr>',  mode = { 'n' }, description = 'Telescope: Help tags' },

        -- Nvim-Surround
        { 'ps', mode = { 'n' }, description = 'Surround: Add [MOTION] [TYPE]' },
        { 'pS', mode = { 'n' }, description = 'Surround: Add with newlines [MOTION] [TYPE]' },
        { 'Ps', mode = { 'n' }, description = 'Surround: Add around line [TYPE]' },
        { 'PS', mode = { 'n' }, description = 'Surround: Add around line with newlines [TYPE]' },
        { 'xs', mode = { 'n' }, description = 'Surround: Delete [TYPE]' },
        { 'es', mode = { 'n' }, description = 'Surround: Change [FROM TYPE] [TO TYPE]'},
        { 'S',  mode = { 'v' }, description = 'Surround: Add [TYPE]'}

    },

    commands = {},

    funcs = {},

    autocmds = {},

    scratchpad = {
        display_results = 'float'
    },
})
