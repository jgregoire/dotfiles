vim.notify('Entered legendary config file')
-- Setup for legendary.nvim plugin.
-- N.B. I use Norman keymap and ErgoDox keyboard with Auto Shift. Below is an extreme remapping
-- of vim commands to suit my setup. Choices may be surprising and controversial.
-- Some sacrifices are made, but I find the result to have super mnemonics to the
-- vim default mappings. Some decisions I made:
-- 	-Arrow keys over hjkl. I have better uses for my home row.
-- 	-Retain intuitive use of Z/X/C/V keys for Undo/Cut/Copy/Paste.
-- 	-Emphasis on Flash for motion. De-emphasis of default vim motions.
-- 	-Priorities: Ergonomics > Mnemonics > Defaults > Aesthetics.
-- 	-Modifiers: Ctrl for commands when the ideal key is already used, Alt for buffers, leader for plugin commands.

-- These are set in init.lua
-- vim.g.vim.g.mapleader = ' '
-- vim.g.maplocalleader = '-'

local defaults = { noremap = true }

require('legendary').setup({
    include_builtin = false, -- Ditch all default vim maps.
    include_legendary_cmds = true,
    formatter = nil,
    col_separator_char = '|',
    most_recent_item_at_top = false,
    select_prompt = 'Legendary',
    extensions = {
        -- lazy_nvim = true,
    },

    -- Modifiers:
    --  C - C
    --  S - Shift
    --  A - Alt
    --  M - Alt (No meta key)

    -- Modes:
    -- nil - normal
    -- n   - normal
    -- i   - insert
    -- l   - insert, command-line, lang-arg
    -- c   - command-line
    -- t   - terminal
    -- v   - visual and select
    -- s   - select
    -- x   - visual
    -- o   - operator-pending

    keymaps = {
        -- Modes
        { 'i',               mode = { 'n' }, description = 'Insert before cursor' },
        { 'I',               mode = { 'n' }, description = 'Insert at beginning of line' },
        { 'a',               mode = { 'n' }, description = 'Append after cursor' },
        { 'A',               mode = { 'n' }, description = 'Append at end of line' },
        { 'n',     'o',      mode = { 'n' }, description = 'Append new line below', opts = defaults },
        { 'N',     'O',      mode = { 'n' }, description = 'Append new line above', opts = defaults },
        { '<C-b>', '<C-v>',  mode = { 'n' }, description = 'Visual Block mode', opts = defaults },
        { 'v',               mode = { 'n' }, description = 'Visual Char mode' },
        { 'V',               mode = { 'n' }, description = 'Visual Line mode' },

        -- Editing
        { '<C-s>', '<cmd>w<CR>', mode = { 'n', 'i' }, description = 'Save', opts = defaults },
        { '<C-z>', { n = 'u',     i = '<C-o>u' },     description = 'Undo', opts = defaults },
        { '<C-y>', { n = '<C-r>', i = '<C-o><C-r>' }, description = 'Redo', opts = defaults },
        { '<C-v>', { n = 'P',     i = '<C-o>P' },     description = 'Paste before cursor', opts = defaults },
        { 'x',     'd',     mode = { 'n', 'v' },      description = 'Cut/delete [MOTION]', opts = defaults },
        { 'xw',    'dw',    mode = { 'n' },           description = 'Cut from cursor to start of next word', opts = defaults },
        { 'xx',    'dd',    mode = { 'n' },           description = 'Cut line', opts = defaults },
        { 'X',     'd$',    mode = { 'n' },           description = 'Cut to end of line', opts = defaults },
        { 'c',     'y',     mode = { 'n', 'v' },      description = 'Copy/yank [MOTION]', opts = defaults },
        { 'cw',    'yw',    mode = { 'n' },           description = 'Copy from cursor to start of next word', opts = defaults },
        { 'cc',    'yy',    mode = { 'n' },           description = 'Copy line', opts = defaults },
        { 'C',     'y$',    mode = { 'n' },           description = 'Copy to end of line', opts = defaults },
        { 'e',     'c',     mode = { 'n', 'v' },      description = 'Edit/change [MOTION]', opts = defaults },
        { 'EE',    'R',     mode = { 'n' },           description = 'Replace characters until ESC', opts = defaults },
        { 'ee',    'cc',    mode = { 'n' },           description = 'Edit entire line', opts = defaults },
        { 'E',     'C',     mode = { 'n' },           description = 'Edit to end of line', opts = defaults },
        { 'es',    'r',     mode = { 'n' },           description = 'Replace character', opts = defaults },
        { 'j',     'J',     mode = { 'n' },           description = 'Join line below to current line retaining whitespace', opts = defaults },
        { 'J',     'gJ',    mode = { 'n' },           description = 'Join line below to current line with a space between', opts = defaults },
        { '<C-n>', '<A-o>', mode = { 'i' },           description = 'Begin new line', opts = defaults },
        { '>',              mode = { 'n', 'v' },      description = 'Indent [MOTION]' },
        { '>>',             mode = { 'n' },           description = 'Indent line' },
        { '<',              mode = { 'n', 'v' },      description = 'De-indent [MOTION]' },
        { '<<',             mode = { 'n' },           description = 'De-indent line' },
        { '<C-.>',          mode = { 'i' },           description = 'Indent line' },
        { '<C-,>',          mode = { 'i' },           description = 'De-indent line' },
        { '=',              mode = { 'n', 'v' },      description = 'Auto-indent [MOTION]' },
        { '<C-j>', 's<CR>', mode = { 'n', 'v' },      description = 'Split line at cursor', opts = defaults },

        -- Textobjects
        { 'aw', mode = { 'v', 'o' }, description = 'Select a word' },
        { 'ab', mode = { 'v', 'o' }, description = 'Select a ( ) block' },
        { 'aB', mode = { 'v', 'o' }, description = 'Select a { } block' },
        { 'at', mode = { 'v', 'o' }, description = 'Select a < > block' },
        { 'ib', mode = { 'v', 'o' }, description = 'Select inside a ( ) block' },
        { 'iB', mode = { 'v', 'o' }, description = 'Select inside a { } block' },
        { 'it', mode = { 'v', 'o' }, description = 'Select inside a < > block' },

        -- Treesitter textobjects
        { 'af', mode = { 'v', 'o' }, description = 'Select around a function' },
        { 'if', mode = { 'v', 'o' }, description = 'Select inside a function' },
        { 'at', mode = { 'v', 'o' }, description = 'Select around a table' },
        { 'it', mode = { 'v', 'o' }, description = 'Select inside a table' },
        { 'ic', mode = { 'v', 'o' }, description = 'Select inside a function call' },

        -- Chording
        { 'i',      mode = { 'o' }, description = 'Inside (Chording)' },
        { 'a',      mode = { 'o' }, description = 'Around (Chording)' },
        { 't',      mode = { 'o' }, description = 'To [CHAR] (Chording)' },
        { 'r', 'l', mode = { 'o' }, description = 'Character to right', opts = defaults },
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

        -- Navigation
        { 'b',  '%',  mode = { 'n', 'v' }, description = 'Jump to matching bracket', opts = defaults },
        { 'B',  '%<Right>', mode = { 'n', 'v' }, description = 'Jump after matching bracket', opts = defaults },
        { 'w',  '^',  mode = { 'n', 'v' }, description = 'First non-blank char', opts = defaults },
        { 'W',  '0',  mode = { 'n', 'v' }, description = 'Start of line', opts = defaults },
        { 'd',  'b',  mode = { 'n', 'v' }, description = 'Start of previous word', opts = defaults },
        { 'D',  'B',  mode = { 'n', 'v' }, description = 'Start of previous Word', opts = defaults },
        { 'f',  'ge', mode = { 'n', 'v' }, description = 'End of previous word', opts = defaults },
        { 'F',  'gE', mode = { 'n', 'v' }, description = 'End of previous Word', opts = defaults },
        { 'u',  'w',  mode = { 'n', 'v' }, description = 'Start of next word', opts = defaults },
        { 'U',  'W',  mode = { 'n', 'v' }, description = 'Start of next Word', opts = defaults },
        { 'r',  'e',  mode = { 'n', 'v' }, description = 'End of next word', opts = defaults },
        { 'R',  'E',  mode = { 'n', 'v' }, description = 'End of next Word', opts = defaults },
        { 'l',  '$',  mode = { 'n', 'v' }, description = 'End of line', opts = defaults },
        { 'L',  'g_', mode = { 'n', 'v' }, description = 'Last non-blank character of line', opts = defaults },

        -- Search
        { '/',              mode = { 'n' }, description = 'Search forward' },
        { '?',              mode = { 'n' }, description = 'Search backward' },
        { '*',              mode = { 'n' }, description = 'Find next occurrence of word under cursor' },
        { '#',              mode = { 'n' }, description = 'Find previous occurrence of word under cursor' },
        { '<C-Right>', 'n', mode = { 'n' }, description = 'Jump to next result', opts = defaults },
        { '<C-Left>',  'N', mode = { 'n' }, description = 'Jump to previous result', opts = defaults },
        { '<C-/>', '<cmd>nohl<CR>', mode = { 'n' }, description = 'Clear search highlight', opts = defaults },
        { '<C-_>', '<cmd>nohl<CR>', mode = { 'n' }, description = 'Clear search highlight', opts = defaults }, -- For compat. with some terminals.

        -- Buffers and such
        { '<A-o>',     ':e ',              mode = { 'n' }, description = 'Open/edit file...', opts = defaults },
        { '<A-q>',     '<cmd>bdelete<CR>', mode = { 'n' }, description = 'Close buffer', opts = defaults },
        { '<A-Right>', '<cmd>bn<CR>',      mode = { 'n' }, description = 'Next tab', opts = defaults },
        { '<A-Left>',  '<cmd>bp<CR>',      mode = { 'n' }, description = 'Previous tab', opts = defaults },

        -- Legendary
        { '<leader>l', '<cmd>Legendary<CR>', mode = { 'n' }, description = 'Legendary: Launch menu', opts = defaults },

        -- LuaSnip
        { '<C-e>', mode = { 'i', 's' }, description = 'Luasnip: Expand' },

        -- CMP
        { '<C-Space>',               description = 'CMP: Invoke' },
        { '<Tab>',   mode = { 's' }, description = 'CMP: Select next' },
        { '<C-Tab>', mode = { 's' }, description = 'CMP: Select previous' },
        { '<CR>',    mode = { 's' }, description = 'CMP: Confirm' },
        { '<C-c>',                   description = 'CMP: Cancel' },

        -- Telescope
        { '<leader>ff', '<cmd>Telescope find_files<cr>', mode = { 'n' }, description = 'Telescope: Find files', opts = defaults },
        { '<leader>fg', '<cmd>Telescope live_grep<cr>',  mode = { 'n' }, description = 'Telescope: Live grep', opts = defaults },
        { '<leader>fb', '<cmd>Telescope buffers<cr>',    mode = { 'n' }, description = 'Telescope: Buffers', opts = defaults },
        { '<leader>ft', '<cmd>Telescope help_tags<cr>',  mode = { 'n' }, description = 'Telescope: Help tags', opts = defaults },

        -- Autopairs
        { '<C-w>', mode = { 'n', 'i' }, description = 'Autopairs: Fast wrap' },

        -- Tabout
        { '<Tab>',   mode = { 'i' }, description = 'Tabout: Forward' },
        { '<S-Tab>', mode = { 'i' }, description = 'Tabout: Backward' },

        -- Nvim-Surround
        { 'ps',     mode = { 'n' }, description = 'Surround: Add [MOTION] [TYPE]' },
        { 'pS',     mode = { 'n' }, description = 'Surround: Add with newlines [MOTION] [TYPE]' },
        { 'Ps',     mode = { 'n' }, description = 'Surround: Add around line [TYPE]' },
        { 'PS',     mode = { 'n' }, description = 'Surround: Add around line with newlines [TYPE]' },
        { 'xs',     mode = { 'n' }, description = 'Surround: Delete [TYPE]' },
        { 'es',     mode = { 'n' }, description = 'Surround: Change [FROM TYPE] [TO TYPE]' },
        { 'eS',     mode = { 'n' }, description = 'Surround: Change with newlines [FROM TYPE] [TO TYPE]' },
        { 'ps',     mode = { 'v' }, description = 'Surround: Add [TYPE]'},
        { 'pS',     mode = { 'v' }, description = 'Surround: Add with newlines [TYPE]' },
        { '<C-p>s', mode = { 'i' }, description = 'Surround: Add [MOTION] [TYPE]' },
        { '<C-p>S', mode = { 'i' }, description = 'Surround: Add with newlines [MOTION] [TYPE]' },

        -- Nvim-comment
        { 'pcc', mode = { 'n' }, description = 'Comment: Toggle line comment' },
        { 'pc',  mode = { 'n' }, description = 'Comment: Toggle line comment [MOTION]' },

        -- Toggleterm
        { '<leader>t', mode = { 'n' }, description = 'Toggleterm: Launch' },
        { '<C-t>',     mode = { 'n' }, description = 'Toggleterm: Toggle' },

        -- Flash
        { 's',     mode = { 'n', 'x', 'o' }, description = 'Flash: Jump' },
        { 'S',     mode = { 'n', 'x', 'o' }, description = 'Flash: Treesitter' },
        { '<C-f>', mode = { 'i' },           description = 'Flash: Treesitter' },
        { 'm',     mode = { 'o' },           description = 'Flash: Remote [OPERATOR] [FLASH] [MOTION]' },
        { 'M',                               description = 'Flash: Treesitter search' },
        { '<C-f>', mode = { 'c' },           description = 'Flash: Toggle flash in search' },

        -- Neorg
        { '<leader>n', '<cmd>Neorg mode norg<CR>', mode = 'n',    description = 'Neorg: Enter norg mode', opts = defaults },
        { '<leader>tu', mode = { 'norg' }, description = 'Neorg: Set TODO task undone' },
        { '<leader>tp', mode = { 'norg' }, description = 'Neorg: Set TODO task pending' },
        { '<leader>td', mode = { 'norg' }, description = 'Neorg: Set TODO task done' },
        { '<leader>th', mode = { 'norg' }, description = 'Neorg: Set TODO task on hold' },
        { '<leader>tc', mode = { 'norg' }, description = 'Neorg: Set TODO task cancelled' },
        { '<leader>tr', mode = { 'norg' }, description = 'Neorg: Set TODO task recurring' },
        { '<leader>ti', mode = { 'norg' }, description = 'Neorg: Set TODO task important' },
        { '<leader>ta', mode = { 'norg' }, description = 'Neorg: Set TODO task ambiguous' },
        { '<C-Space>',  mode = { 'norg' }, description = 'Neorg: Toggle TODO task between states' },
        { '<CR>',       mode = { 'norg' }, description = 'Neorg: Hop to link location' },
        { '<A-CR>',     mode = { 'norg' }, description = 'Neorg: Open location in vsplit' },
        { '<leader>id', mode = { 'norg' }, description = 'Neorg: Insert date' },

        -- Nabla
        { '<leader>ep', mode = { 'n' }, description = 'Nabla: Render in popup', opts = defaults },
        { '<leader>ei', mode = { 'n' }, description = 'Nabla: Render inline', opts = defaults },

        -- Boole
        { '<C-Up>',   mode = { 'n' }, description = 'Boole: Increment value' },
        { '<C-Down>', mode = { 'n' }, description = 'Boole: Decrement value' },

        -- TS Incremental Selection
        { '<leader>ns', mode = { 'n' }, description = 'Treesitter: Select node at cursor', opts = defaults },
        { '<leader>is', mode = { 'n' }, description = 'Treesitter: Increment node selection', opts = defaults },
        { '<leader>id', mode = { 'n' }, description = 'Treesitter: Decrement node selection', opts = defaults },
        { '<leader>si', mode = { 'n' }, description = 'Treesitter: Increment scope selection', opts = defaults },

        -- Better-digraphs
        { '<C-d>', mode = { 'i' }, description = 'Insert digraph' },
        { 'es<C-d>', mode = { 'n', 'v' }, description = 'Replace character with digraph' },
    },

    commands = {},

    funcs = {},

    autocmds = {
        {
            'UIEnter',
            function ()
                vim.opt.clipboard:append({ 'unnamedplus' })
            end,
            description = 'Set system clipboard',
        },
        {
            'FileType',
            ':setlocal ts=2',
            opts = { pattern = { 'ino' } },
            description = 'Use two-space tabs for Arduino'
        },
        {
            'FileType',
            -- ':setlocal conceallevel=2',
            function ()
                vim.opt_local.conceallevel = 2
                vim.opt_local.concealcursor = "nc"
            end,
            opts = { pattern = { 'norg' } },
            description = 'Set conceal for norg files'
        },
    },

    scratchpad = {
        display_results = 'float'
    },
})
