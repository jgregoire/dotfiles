-- Colorscheme
require('onedarkpro').setup({
    styles = {
        comments = 'italic',
    },
    plugins = {
        all = false,
        diffview = true,
--        flash_nvim = true,
        gitsigns = true,
        indentline = true,
        lsp_semantic_tokens = true,
        nvim_cmp = true,
        nvim_lsp = true,
        telescope = true,
        toggleterm = true,
        treesitter = true,
    },
    options = {
        transparency = true,
        cursorline = true,
        highlight_inactive_windows = true,
    },
})
-- vim.cmd('colorscheme onedark_vivid')

vim.opt.background = 'dark'
vim.g.gruvbox_material_background = 'hard'
vim.g.gruvbox_material_foreground = 'material'
vim.g.gruvbox_material_enable_italic = true
vim.g.gruvbox_material_enable_bold = true
vim.cmd.colorscheme('gruvbox-material')

-- Keybinds
require('legendary').setup(require('legendary_config'))

-- Treesitter
---@diagnostic disable-next-line: missing-fields
require('nvim-treesitter.configs').setup({
    ensure_installed = { 'lua', 'vim', 'vimdoc', 'query', 'c'},
    sync_install = false,
    auto_install = false,
    highlight = {
        enable = true,
        -- Also use vim built-in highlighting alongside TS for these languages
        additional_vim_regex_hightlighting = { 'neorg' },
    },
    -- Use TS for = indentation. Experimental.
    indent = {
        enable = true
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection    = '<leader>ns',
            node_incremental  = '<leader>is',
            node_decremental  = '<leader>id',
            scope_incremental = '<leader>si',
        },
    },
    endwise = {
        enable = true
    },
    textobjects = {
        select = {
            enable = true,
            lookahead = true,
            keymaps = {
                ['af'] = '@function.outer',
                ['if'] = '@function.inner',
                ['at'] = '@parameter.outer',
                ['it'] = '@parameter.inner',
                ['ic'] = '@call.inner',
            },
        },
    },
})

-- Autopairs
require('nvim-autopairs').setup({
    fast_wrap = {
        -- Before       Input   After
        -- ---------------------------------
        -- (|foobar     <M-e>l  (|foobar)
        -- (|)(foobar)  <M-e>a  (|(foobar))
        map = '<C-w>', -- Launch fastwrap
        chars = { '{', '[', '(', '"', "'", '<' },
        end_key = 'w', -- End of line
        keys = 'asetnioh', -- Home row keys for position markers
    },
    enable_check_bracket_line = false, -- Don't add pair if it already has close pair in same line.
    enable_bracket_in_quote = false, -- Don't add a pair inside quotes.
    check_ts = true, -- Use Treesitter to check for pairs
})

-- Luasnip
require('luasnip_config')

-- Completion
require('cmp_config')

-- External tools
require('mason').setup({
    ui = {
        border = 'rounded',
        icons = {
            package_installed = "✔",
            package_pending = "",
            package_uninstalled = "",
        }
    }
})
require('mason-lspconfig').setup({
    ensure_installed = {
        'arduino_language_server',
        'bashls',
        'clangd',
        'jsonls',
        'ltex',
        'lua_ls',
        'openscad_lsp',
        'pyright',
        'rust_analyzer',
        'typos_lsp',
        'yamlls',
    },
})
require('lsp_config')

require('gitsigns').setup({
    signs = {
        add          = { text = '' },
        change       = { text = '' },
        delete       = { text = '' },
        topdelete    = { text = '‾' },
        changedelete = { text = '' },
        untracked    = { text = '┆' },
    }
})

-- Lualine
require('lualine').setup({
    options = {
        -- theme = 'auto',
        theme = 'gruvbox-material',
        component_separators = {
            left  = '│',
            right = '│'
        },
        section_separators = {
            left  = '',
            right = ''
        },
    },
    extensions = {
        'toggleterm',
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = {
            'branch',
            {
                'diff',
                symbols = {
                    added    = ' ',
                    modified = ' ',
                    removed  = ' ',
                },
            },
            {
                'diagnostics',
                symbols = {
                    error = ' ',
                    warn  = ' ',
                    info  = ' ',
                    hint  = ' ',
                },
            },
        },
        lualine_c = {
            {
                'buffers',
                mode = 2, -- show name and index
                symbols = {
                    modified = ' '
                },
            },
        },
        lualine_x = {
            'encoding',
            'fileformat',
            'filetype' },
        lualine_y = { 'progress', },
        lualine_z = { 'location', },
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
    },
})

