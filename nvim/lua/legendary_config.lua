-- Setup for legendary.nvim plugin and Norman keymap.

vim.g.mapleader = ' '

local defaults = { noremap = true }

require('legendary').setup({
    include_builtin = false, -- Ditch all default vim maps.
    include_legendary_cmds = true,
    formatter = nil,
    col_separator_char = '|',
    most_recent_item_at_top = false,
    select_prompt = 'Legendary',

    -- Modifiers:
    --  C - C
    --  S - Shift
    --  A - Alt
    --  M - Alt (No meta key)

    keymaps = {
        -- Modes
        { 'jk',    '<ESC>',  mode = { 'i' },      description = 'Back to Normal mode', opts = defaults },
        { 'i',               mode = { 'n' },      description = 'Insert before cursor' },
        { 'I',               mode = { 'n' },      description = 'Insert at beginning of line' },
        { 'a',               mode = { 'n' },      description = 'Append after cursor' },
        { 'A',               mode = { 'n' },      description = 'Append at end of line' },
        { 'n',     'o',      mode = { 'n' },      description = 'Append new line below', opts = defaults },
        { 'N',     'O',      mode = { 'n' },      description = 'Append new line above', opts = defaults },
        -- { 's',               mode = { 'n' },      description = 'Delete character and insert' },
        { '<C-b>', '<C-v>',  mode = { 'n', 'i' }, description = 'Visual Block mode', opts = defaults },
        { '<C-v>', 'v',      mode = { 'n', 'i' }, description = 'Visual Char mode', opts = defaults },
        { '<C-l>', 'V',      mode = { 'n', 'i' }, description = 'Visual Line mode', opts = defaults },

        -- Editing
        { 'z',     'u',      mode = { 'n' },      description = 'Undo', opts = defaults },
        { 'y',     '<C-r>',  mode = { 'n' },      description = 'Redo', opts = defaults },
        { 'x',     'd',      mode = { 'n', 'v' }, description = 'Cut/delete [MOTION]', opts = defaults },
        { 'xw',    'dw',     mode = { 'n' },      description = 'Cut from cursor to start of next word', opts = defaults },
        { 'xx',    'dd',     mode = { 'n' },      description = 'Cut line', opts = defaults },
        { 'X',     'd$',     mode = { 'n' },      description = 'Cut to end of line', opts = defaults },
        { 'c',     'y',      mode = { 'n', 'v' }, description = 'Copy/yank [MOTION]', opts = defaults },
        { 'cw',    'yw',     mode = { 'n' },      description = 'Copy from cursor to start of next word', opts = defaults },
        { 'cc',    'yy',     mode = { 'n' },      description = 'Copy line', opts = defaults },
        { 'C',     'y$',     mode = { 'n' },      description = 'Copy to end of line', opts = defaults },
        { '<C-v>', 'p',      mode = { 'n' },      description = 'Paste after cursor', opts = defaults },
        { 'P',     'P',      mode = { 'n' },      description = 'Paste before cursor', opts = defaults },
        { 'E',     'r',      mode = { 'n' },      description = 'Replace single character', opts = defaults },
        { 'e',     'c',      mode = { 'n' },      description = 'Edit/change [MOTION]', opts = defaults },
        { 'EE',    'R',      mode = { 'n' },      description = 'Replace characters until ESC', opts = defaults },
        { 'ee',    'cc',     mode = { 'n' },      description = 'Edit entire line', opts = defaults },
        { 'el',    'C',      mode = { 'n' },      description = 'Edit to end of line', opts = defaults },
        { 'j',     'gJ',     mode = { 'n' },      description = 'Join line below to current line', opts = defaults },
        { 'J',               mode = { 'n' },      description = 'Join line below to current line with a space between' },
	{ '<C-s>', ':w<CR>', mode = { 'n' },      description = 'Save file', opts = defaults },
	{ '<C-v>', '<C-r>\"',mode = { 'i' },      description = 'Paste from \" register', opts = defaults },
        { '<C-w>',           mode = { 'i' },      description = 'Delete word before cursor', opts = defaults },
        { '<C-n>', '<C-j>',  mode = { 'i' },      description = 'Begin new line', opts = defaults },
        { '>',               mode = { 'n' },      description = 'Indent [MOTION]' },
        { '>>',              mode = { 'n' },      description = 'Indent line' },
        { '<',               mode = { 'n' },      description = 'De-indent [MOTION]' },
        { '<<',              mode = { 'n' },      description = 'De-indent line' },
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
        -- { 'r', 'l', mode = { 'o' }, description = 'Character to right' },
        { 'l', 'h', mode = { 'o' }, description = 'Character to left', opts = defaults },
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
        { 'b',  '%',  mode = { 'n' }, description = 'Jump to matching bracket', opts = defaults },
--        { 'I', 'zz',  mode = { 'n' }, description = 'Center screen on cursor', opts = defaults },
        { 'w',  '^',  mode = { 'n' }, description = 'First non-blank char', opts = defaults },
        { 'W',  '0',  mode = { 'n' }, description = 'Start of line', opts = defaults },
        { 'd',  'b',  mode = { 'n' }, description = 'Start of previous word', opts = defaults },
        { 'D',  'B',  mode = { 'n' }, description = 'Start of previous Word', opts = defaults },
        { 'f',  'ge', mode = { 'n' }, description = 'End of previous word', opts = defaults },
        { 'F',  'gE', mode = { 'n' }, description = 'End of previous Word', opts = defaults },
        { 'u',  'w',  mode = { 'n' }, description = 'Start of next word', opts = defaults },
        { 'U',  'W',  mode = { 'n' }, description = 'Start of next Word', opts = defaults },
        { 'r',  'e',  mode = { 'n' }, description = 'End of next word', opts = defaults },
        { 'R',  'E',  mode = { 'n' }, description = 'End of next Word', opts = defaults },
        { 'l',  '$',  mode = { 'n' }, description = 'End of line', opts = defaults },
        { 'L',  'g_', mode = { 'n' }, description = 'Last non-blank character of line', opts = defaults },

        -- Tabs and such
        { '<A-t>',     ':tabnew<CR>',         mode = { 'n' }, description = 'Create new tab', opts = defaults },
        { '<A-q>',     ':BufferClose<CR>',    mode = { 'n' }, description = 'Close tab', opts = defaults },
        { '<A-Q>',     ':tabdo -q<CR>',       mode = { 'n' }, description = 'Close all tabs', opts = defaults },
        { '<A-qq>',    ':tabonly<CR>',        mode = { 'n'} , description = 'Close other tabs', opts = defaults },
        { '<A-o>',     ':e ',                 mode = { 'n' }, description = 'Open/edit file', opts = defaults },
        { '<A-Right>', ':BufferNext<CR>',     mode = { 'n' }, description = 'Barbar: Next tab', opts = defaults },
        { '<A-Left>',  ':BufferPrevious<CR>', mode = { 'n' }, description = 'Barbar: Previous tab', opts = defaults },
	{ '<A-1>',     ':BufferGoto 1<CR>',   mode = { 'n' }, description = 'Barbar: Go to tab 1', opts = defaults },
	{ '<A-2>',     ':BufferGoto 2<CR>',   mode = { 'n' }, description = 'Barbar: Go to tab 2', opts = defaults },
	{ '<A-3>',     ':BufferGoto 3<CR>',   mode = { 'n' }, description = 'Barbar: Go to tab 3', opts = defaults },
        { '<A-4>',     ':BufferGoto 4<CR>',   mode = { 'n' }, description = 'Barbar: Go to tab 4', opts = defaults },
        { '<A-5>',     ':BufferGoto 5<CR>',   mode = { 'n' }, description = 'Barbar: Go to tab 5', opts = defaults },
        { '<A-6>',     ':BufferGoto 6<CR>',   mode = { 'n' }, description = 'Barbar: Go to tab 6', opts = defaults },
        { '<A-7>',     ':BufferGoto 7<CR>',   mode = { 'n' }, description = 'Barbar: Go to tab 7', opts = defaults },
        { '<A-8>',     ':BufferGoto 8<CR>',   mode = { 'n' }, description = 'Barbar: Go to tab 8', opts = defaults },
        { '<A-9>',     ':BufferGoto 9<CR>',   mode = { 'n' }, description = 'Barbar: Go to tab 9', opts = defaults },
        { '<A-0>',     ':BufferGoto 10<CR>',  mode = { 'n' }, description = 'Barbar: Go to tab 10', opts = defaults },

        -- Legendary
        { '<leader>l', ':Legendary<CR>', mode = { 'n' }, description = 'Legendary: Launch menu', opts = defaults },

        -- CMP
        { '<C-Space>', description = 'CMP: Complete' },
        { '<Tab>',   mode = { 'i', 's' }, description = 'CMP: Previous' },
        { '<C-Tab>', mode = { 'i', 's' }, description = 'CMP: Next' },
        { '<CR>',                         description = 'CMP: Confirm' },
        { '<Esc>',                        description = 'CMP: Cancel' },

        -- Telescope
        { '<leader>ff', '<cmd>Telescope find_files<cr>', mode = { 'n' }, description = 'Telescope: Find files', opts = defaults },
        { '<leader>fg', '<cmd>Telescope live_grep<cr>',  mode = { 'n' }, description = 'Telescope: Live grep', opts = defaults },
        { '<leader>fb', '<cmd>Telescope buffers<cr>',    mode = { 'n' }, description = 'Telescope: Buffers', opts = defaults },
        { '<leader>ft', '<cmd>Telescope help_tags<cr>',  mode = { 'n' }, description = 'Telescope: Help tags', opts = defaults },

	-- Autopairs
	{ '<M-e>', mode = { 'n', 'i' }, description = 'Autopairs: Fast wrap' },

        -- Nvim-Surround
        { 'ps',     mode = { 'n' }, description = 'Surround: Add [MOTION] [TYPE]' },
        { 'pS',     mode = { 'n' }, description = 'Surround: Add with newlines [MOTION] [TYPE]' },
        { 'Ps',     mode = { 'n' }, description = 'Surround: Add around line [TYPE]' },
        { 'PS',     mode = { 'n' }, description = 'Surround: Add around line with newlines [TYPE]' },
        { 'xs',     mode = { 'n' }, description = 'Surround: Delete [TYPE]' },
        { 'es',     mode = { 'n' }, description = 'Surround: Change [FROM TYPE] [TO TYPE]'},
        { 'S',      mode = { 'v' }, description = 'Surround: Add [TYPE]'},
	{ 'gS',     mode = { 'v' }, description = 'Surround: Add with newlines [TYPE]' },
	{ '<C-p>s', mode = { 'i' }, description = 'Surround: Add [MOTION] [TYPE]' },
	{ '<C-p>S', mode = { 'i' }, description = 'Surround: Add with newlines [MOTION] [TYPE]' },

        -- Nvim-comment
        { 'pcc', mode = { 'n' }, description = 'Comment: Toggle line comment' },
        { 'pc',  mode = { 'n' }, description = 'Comment: Toggle line comment [MOTION]' },

        -- Toggleterm
        { '<C-t>', mode = { 'n' }, description = 'Toggleterm: Toggle terminal' },

        -- Leap
        { 's', '<Plug>(leap-forward-to)',  mode = { 'n' }, description = 'Leap: forward to [CHAR1][CHAR2][LABEL]', opts = defaults },
        { 'S', '<Plug>(leap-backward-to)', mode = { 'n' }, description = 'Leap: backward to [CHAR1][CHAR2][LABEL]', opts = defaults },

        -- Leap (Spooky)
        { 'r', mode = { 'o' }, description = 'Leap (Spooky): Restful [MOTION] at [CHAR1][CHAR2][LABEL]' },
        { 'R', mode = { 'o' }, description = 'Leap (Spooky): Restful [MOTION] in another window at [CHAR1][CHAR2][LABEL]' },
        { 'm', mode = { 'o' }, description = 'Leap (Spooky): Magnetic [MOTION] at [CHAR1][CHAR2][LABEL]' },
        { 'M', mode = { 'o' }, description = 'Leap (Spooky): Magnetic [MOTION] in another window at [CHAR1][CHAR2][LABEL]' },
    },

    commands = {},

    funcs = {},

    autocmds = {},

    scratchpad = {
        display_results = 'float'
    },
})
