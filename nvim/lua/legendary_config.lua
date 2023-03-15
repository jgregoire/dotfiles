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
        { 'jk',    '<ESC>', mode = { 'i' },      description = 'Back to Normal mode', defaults },
        { 'i',              mode = { 'n' },      description = 'Insert before cursor' },
        { 'I',              mode = { 'n' },      description = 'Insert at beginning of line' },
        { 'a',              mode = { 'n' },      description = 'Append after cursor' },
        { 'A',              mode = { 'n' },      description = 'Append at end of line' },
        { 'n',     'o',     mode = { 'n' },      description = 'Append new line below', defaults },
        { 'N',     'O',     mode = { 'n' },      description = 'Append new line above', defaults },
        { 's',              mode = { 'n' },      description = 'Delete character and insert' },
        { '<C-b>', '<C-v>', mode = { 'n', 'i' }, description = 'Visual Block mode', defaults },
        { '<C-v>', 'v',     mode = { 'n', 'i' }, description = 'Visual Char mode', defaults },
        { '<C-l>', 'V',     mode = { 'n', 'i' }, description = 'Visual Line mode', defaults },

        -- Editing
        { 'z',   'u',        mode = { 'n' },      description = 'Undo', defaults },
        { 'y',   '<C-r>',    mode = { 'n' },      description = 'Redo', defaults },
        { 'x',   'd',        mode = { 'n', 'v' }, description = 'Cut/delete [MOTION]', defaults },
        { 'xw',  'dw',       mode = { 'n' },      description = 'Cut from cursor to start of next word', defaults },
        { 'xx',  'dd',       mode = { 'n' },      description = 'Cut line', defaults },
        { 'X',   'd$',       mode = { 'n' },      description = 'Cut to end of line', defaults },
        { 'c',   'y',        mode = { 'n', 'v' }, description = 'Copy/yank [MOTION]', defaults = { noremap = true } },
        { 'cw',  'yw',       mode = { 'n' },      description = 'Copy from cursor to start of next word', defaults },
        { 'cc',  'yy',       mode = { 'n' },      description = 'Copy line', defaults },
        { 'C',   'y$',       mode = { 'n' },      description = 'Copy to end of line', defaults },
        { 'v',   'p',        mode = { 'n' },      description = 'Paste after cursor', defaults },
        { 'V',   'P',        mode = { 'n' },      description = 'Paste before cursor', defaults },
        { 'E',   'r',        mode = { 'n' },      description = 'Replace single character', defaults },
        { 'e',   'c',        mode = { 'n' },      description = 'Edit/change [MOTION]', defaults },
        { 'EE',  'R',        mode = { 'n' },      description = 'Replace characters until ESC', defaults },
        { 'ee',  'cc',       mode = { 'n' },      description = 'Edit entire line', defaults },
        { 'el',  'C',        mode = { 'n' },      description = 'Edit to end of line', defaults },
        { 'j',   'gJ',       mode = { 'n' },      description = 'Join line below to current line', defaults },
        { 'J',               mode = { 'n' },      description = 'Join line below to current line with a space between' },
	{ '<C-s>', ':w<CR>', mode = { 'n', 'i' }, description = 'Save file', defaults },
        { '<C-v>', 'v',      mode = { 'n', 'i' }, description = 'Paste after cursor', defaults },
        { '<C-w>',           mode = { 'i' },      description = 'Delete word before cursor'},
        { '<C-n>', '<C-j>',  mode = { 'i' },      description = 'Begin new line', defaults },
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
        { 'b',  '%',  mode = { 'n' }, description = 'Jump to matching bracket', defaults },
--        { 'I', 'zz',  mode = { 'n' }, description = 'Center screen on cursor', defaults },
        { 'w',  '^',  mode = { 'n' }, description = 'First non-blank char', defaults },
        { 'W',  '0',  mode = { 'n' }, description = 'Start of line', defaults },
        { 'd',  'b',  mode = { 'n' }, description = 'Start of previous word', defaults },
        { 'D',  'B',  mode = { 'n' }, description = 'Start of previous Word', defaults },
        { 'f',  'ge', mode = { 'n' }, description = 'End of previous word', defaults },
        { 'F',  'gE', mode = { 'n' }, description = 'End of previous Word', defaults },
        { 'u',  'w',  mode = { 'n' }, description = 'Start of next word', defaults },
        { 'U',  'W',  mode = { 'n' }, description = 'Start of next Word', defaults },
        { 'r',  'e',  mode = { 'n' }, description = 'End of next word', defaults },
        { 'R',  'E',  mode = { 'n' }, description = 'End of next Word', defaults },
        { 'l',  '$',  mode = { 'n' }, description = 'End of line', defaults },
        { 'L', 'g_',  mode = { 'n' }, description = 'Last non-blank character of line', defaults },

        -- Tabs and such
        { '<A-t>',     ':tabnew<CR>',         mode = { 'n' }, description = 'Create new tab', defaults },
        { '<A-q>',     ':BufferClose<CR>',    mode = { 'n' }, description = 'Close tab', defaults },
        { '<A-Q>',     ':tabdo -q<CR>',       mode = { 'n' }, description = 'Close all tabs', defaults },
        { '<A-qq>',    ':tabonly<CR>',        mode = { 'n'} , description = 'Close other tabs', defaults },
        { '<A-o>',     ':e ',                 mode = { 'n' }, description = 'Open/edit file', defaults },
        { '<A-Right>', ':BufferNext<CR>',     mode = { 'n' }, description = 'Barbar: Next tab', defaults },
        { '<A-Left>',  ':BufferPrevious<CR>', mode = { 'n' }, description = 'Barbar: Previous tab', defaults },
	{ '<A-1>',     ':BufferGoto 1<CR>',   mode = { 'n' }, description = 'Barbar: Go to tab 1', defaults },
	{ '<A-2>',     ':BufferGoto 2<CR>',   mode = { 'n' }, description = 'Barbar: Go to tab 2', defaults },
	{ '<A-3>',     ':BufferGoto 3<CR>',   mode = { 'n' }, description = 'Barbar: Go to tab 3', defaults },
        { '<A-4>',     ':BufferGoto 4<CR>',   mode = { 'n' }, description = 'Barbar: Go to tab 4', defaults },
        { '<A-5>',     ':BufferGoto 5<CR>',   mode = { 'n' }, description = 'Barbar: Go to tab 5', defaults },
        { '<A-6>',     ':BufferGoto 6<CR>',   mode = { 'n' }, description = 'Barbar: Go to tab 6', defaults },
        { '<A-7>',     ':BufferGoto 7<CR>',   mode = { 'n' }, description = 'Barbar: Go to tab 7', defaults },
        { '<A-8>',     ':BufferGoto 8<CR>',   mode = { 'n' }, description = 'Barbar: Go to tab 8', defaults },
        { '<A-9>',     ':BufferGoto 9<CR>',   mode = { 'n' }, description = 'Barbar: Go to tab 9', defaults },
        { '<A-0>',     ':BufferGoto 10<CR>',  mode = { 'n' }, description = 'Barbar: Go to tab 10', defaults },

        -- Legendary
        { '<leader>l', ':Legendary<CR>', mode = { 'n' }, description = 'Legendary: Launch menu', defaults },

        -- CMP
        { '<C-Space>', description = 'CMP: Complete' },
        { '<Tab>',   mode = { 'i', 's' }, description = 'CMP: Previous' },
        { '<C-Tab>', mode = { 'i', 's' }, description = 'CMP: Next' },
        { '<CR>',                         description = 'CMP: Confirm' },
        { '<Esc>',                        description = 'CMP: Cancel' },

        -- Telescope
        { '<leader>ff', '<cmd>Telescope find_files<cr>', mode = { 'n' }, description = 'Telescope: Find files', defaults },
        { '<leader>fg', '<cmd>Telescope live_grep<cr>',  mode = { 'n' }, description = 'Telescope: Live grep', defaults },
        { '<leader>fb', '<cmd>Telescope buffers<cr>',    mode = { 'n' }, description = 'Telescope: Buffers', defaults },
        { '<leader>ft', '<cmd>Telescope help_tags<cr>',  mode = { 'n' }, description = 'Telescope: Help tags', defaults },

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

        -- Leap
        { 'l', '<Plug>(leap-forward-to)',  mode = { 'n' }, description = 'Leap forward to [CHAR1][CHAR2][LABEL]', defaults },
        { 'L', '<Plug>(leap-backward-to)', mode = { 'n' }, description = 'Leap backward to [CHAR1][CHAR2][LABEL]', defaults },

        -- Leap (Spooky)
        { 'r', mode = { 'o' }, description = 'Leap (Spooky): Restful [MOTION] at [CHAR1][CHAR2][LABEL]' },
        { 'R', mode = { 'o' }, description = 'Leap: (Spooky): Restful [MOTION] in another window at [CHAR1][CHAR2][LABEL]' },
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
