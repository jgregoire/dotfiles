-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    print('Installing lazy.nvim...')
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable',
        lazypath,
    })
    print('Installed lazy.nvim!')
end
---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- Specify plugins
require('lazy').setup(
    { -- Plugins
        {
            'folke/persistence.nvim',
            event = 'BufReadPre',
        },
        {
            'olimorris/onedarkpro.nvim',
            priority = 1000, -- Ensure this loads first
            config = function()
                require('onedarkpro').setup({
                    styles = {
                        comments = 'italic',
                    },
                    plugins = {
                        all = false,
                        diffview = true,
                        flash_nvim = true,
                        gitsigns = true,
                        indentline = true,
                        nvim_cmp = true,
                        nvim_lsp = true,
                        nvim_notify = true,
                        telescope = true,
                        toggleterm = true,
                        treesitter = true,
                    }
                })
                vim.cmd('colorscheme onedark_vivid')
            end,
        },
        {
            'neovim/nvim-lspconfig',
        },
        {
            'RRethy/nvim-treesitter-endwise',
        },
        {
            'nvim-treesitter/nvim-treesitter',
            config = function()
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
                    endwise = {
                        enable = true
                    }
                })
            end,
            build = ':TSUpdate',
            -- build = function()
            --     local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            --     ts_update()
            -- end,
        },
        {
            'hrsh7th/nvim-cmp',
            dependencies = {
                'neovim/nvim-lspconfig',
                'hrsh7th/cmp-nvim-lsp',
                'hrsh7th/cmp-buffer',
                'hrsh7th/cmp-path',
                'hrsh7th/cmp-cmdline',
                'L3MON4D3/LuaSnip',
                'saadparwaiz1/cmp_luasnip',
                'hrsh7th/cmp-calc',
                'hrsh7th/cmp-nvim-lua',
            }
        },
        {
            'goolord/alpha-nvim',
            dependencies = { 'nvim-tree/nvim-web-devicons' },
            config = function()
                require('alpha').setup(require('dashboard').config)
            end,
        },
        {
            'rcarriga/nvim-notify',
            config = function()
                require('notify').setup({
                    render = 'compact',
                    fps = '60',
                    stages = 'static',
                })
            end,
        },
        {
            'folke/noice.nvim',
            dependencies = {
                'MunifTanjim/nui.nvim',
                'rcarriga/nvim-notify',
            },
            config = function()
                require('noice').setup({
                    health = { checker = false }, -- Don't bother running health checks anymore.
                    lsp = {
                        progress = { enabled = true },
                        override = {
                            ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
                            ['vim.lsp.util.stylize_markdown'] = true,
                            ['cmp.entry.get_documentation'] = true,
                        },
                    },
                    presets = {
                        bottom_search = false, -- use a classic bottom cmdline for search
                        command_palette = true, -- position the cmdline and popupmenu together
                        long_message_to_split = true, -- long messages will be sent to a split
                        inc_rename = false, -- enables an input dialog for inc-rename.nvim
                        lsp_doc_border = true, -- add a border to hover docs and signature help
                    },
                    views = {
                        cmdline_popup = {
                            position = {
                                row = -2,
                                col = '50%',
                            },
                        },
                        cmdline_popupmenu = {
                            position = {
                                row = -5,
                                col = '50%',
                            },
                        },
                    },
                    routes = {
                        { -- Disable mini popup (lsp_progress) in insert mode. Less distracting.
                            view = 'mini',
                            filter = { mode = 'i' },
                            opts = { skip = true },
                        },
                    },
                })
                require('telescope').load_extension('noice')
            end,
        },
        {
            'lewis6991/gitsigns.nvim',
            config = function()
                require('gitsigns').setup({
                    signs = {
                        add          = { text = '' },
                        change       = { text = '' },
                        delete       = { text = '' },
                        topdelete    = { text = '‾' },
                        changedelete = { text = '' },
                        untracked    = { text = '┆' },

                    },
                })
            end,
        },
        {
            'karb94/neoscroll.nvim',
            config = true,
        },
        {
            'nvim-telescope/telescope.nvim',
            dependencies = { 'nvim-lua/plenary.nvim' },
        },
        {
            'nvim-lualine/lualine.nvim',
            dependencies = { 'nvim-tree/nvim-web-devicons' },
            config = function()
                require('lualine').setup({
                    options = {
                        theme = 'auto',
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
                            {
                                -- Noice showcmd implementation
                                require('noice').api.statusline.command.get,
                                cond = require('noice').api.statusline.command.has,
                            },
                            'encoding',
                            'fileformat',
                            'filetype' },
                        lualine_y = { 'progress' },
                        lualine_z = { 'location' },
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
            end,
        },
        {
            'norcalli/nvim-colorizer.lua',
            config = true,
        },
        -- {
        --     'xiyaowong/nvim-transparent',
        --     config = true,
        -- },
        {
            'nat-418/boole.nvim',
            config = function()
                require('boole').setup({
                    mappings = {
                        increment = '<C-Up>',
                        decrement = '<C-Down>',
                    },
                })
            end,
        },
        {
            'folke/flash.nvim',
            config = function()
                require('flash').setup({
                    labels = 'asetniohqwdfurlgykjzxcvmbp',
                    label = {
                        -- Show jump label before the target, not after.
                        after = false,
                        before = true,
                    }
                })
            end,
        },
        {
            'lukas-reineke/indent-blankline.nvim',
            config = function()
                require('ibl').setup({
                    enabled = true,
                    indent = { char = '▏' },
                    scope = {
                        enabled = true,
                        show_start = true,
                    }
                })
            end,
        },
        {
            'abecodes/tabout.nvim',
            dependencies = {
                'nvim-treesitter/nvim-treesitter',
                'hrsh7th/nvim-cmp'
            },
            config = function()
                require('tabout').setup({
                    tabkey = '<Tab>',
                    backwards_tabkey = '<S-Tab>',
                    act_as_tab = true,
                    act_as_shift_tab = true,
                    default_tab = '<Tab>',
                    default_shift_tab = '<C-d>',
                    enable_backwards = true,
                    completion = true,
                    tabouts = {
                        { open = "'", close = "'" },
                        { open = '"', close = '"' },
                        { open = '`', close = '`' },
                        { open = '(', close = ')' },
                        { open = '[', close = ']' },
                        { open = '{', close = '}' },
                        { open = '<', close = '>' },
                        { open = '#', close = ']' }, -- Rust macros
                    },
                    ignore_beginning = false,
                    exclude = {},
                })
            end,

        },
        {
            'windwp/nvim-autopairs',
            config = function()
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
                })
            end,
        },
        {
            'kylechui/nvim-surround',
            config = function()
                ---@diagnostic disable-next-line: missing-fields
                require('nvim-surround').setup({
                    keymaps = {
                        insert          = '<C-p>s',
                        insert_line     = '<C-p>S',
                        normal          = 'ps',
                        normal_line     = 'pS',
                        normal_cur      = 'Ps',
                        normal_cur_line = 'PS',
                        delete          = 'xs',
                        change          = 'es',
                    }
                })
            end,
        },
        {
            'terrortylor/nvim-comment',
            config = function()
                require('nvim_comment').setup({
                    marker_padding = true, -- Add a space.
                    comment_empty = true,
                    comment_empty_trim_whitespace = true,
                    create_mappings = true,
                    line_mapping = 'pcc', -- Normal mode, toggle line comment.
                    operator_mapping = 'pc', -- Visual/operator mode
                    comment_chunk_text_object = 'ic', -- No idea what this is for
                })
            end,
        },
        {
            'cameron-wags/rainbow_csv.nvim',
            config = true,
            ft = {
                'csv',
                'tsv',
                'csv_semicolon',
                'csv_whitespace',
                'csv_pipe',
                'rfc_csv',
                'rfc_semicolon',
            },
            cmd = {
                'RainbowDelim',
                'RainbowDelimSimple',
                'RainbowDelimQuoted',
                'RainbowMultiDelim',
            },
        },
        {
            'jbyuki/nabla.nvim',
        },
        {
            'sindrets/diffview.nvim',
            dependencies = {
                'nvim-lua/plenary.nvim',
                'nvim-tree/nvim-web-devicons'
            },
            config = true,
        },
        {
            'akinsho/toggleterm.nvim',
            -- tag = '*',
            config = function()
                require('toggleterm').setup({
                    open_mapping = '<C-t>',
                    autochdir = true,
                    float_opts = {
                        border = 'curved',
                        width = 120,
                        height = 40,
                    },
                })
            end,
        },
        {
            'nvim-neorg/neorg',
            dependencies = {
                'nvim-treesitter/nvim-treesitter',
                'nvim-lua/plenary.nvim',
            },
            ft = 'norg',
            config = function()
                require('neorg').setup({
                    load = {
                        -- Subset of core.defaults:
                        ['core.esupports.hop'] = {},
                        ['core.esupports.indent'] = {},
                        ['core.esupports.metagen'] = {},
                        ['core.itero'] = {},
                        ['core.pivot'] = {},
                        ['core.promo'] = {},
                        ['core.qol.toc'] = {},
                        ['core.qol.todo_items'] = {},
                        ['core.keybinds'] = {
                            config = {
                                default_keybinds = true,
                                neorg_leader = '<LocalLeader>',
                            }
                        },
                        -- Non-defaults:
                        ['core.concealer'] = {
                            config = {
                                folds = true,
                                icons = {
                                    todo = {
                                        -- enabled = true,
                                        done      = { icon = "" },
                                        pending   = { icon = "⭘" },
                                        undone    = { icon = "" },
                                        uncertain = { icon = "" },
                                        on_hold   = { icon = "" },
                                        cancelled = { icon = "" },
                                        recurring = { icon = "" },
                                        urgent    = { icon = "" },
                                    },
                                },
                            },
                        },
                        ['core.dirman'] = {
                            config = {
                                workspaces = {
                                    notes = '~/neorg',
                                },
                            },
                        },
                        ['core.completion'] = {
                            config = { engine = 'nvim-cmp' },
                        },
                        ['core.highlights'] = {},
                    }, -- load
                })
            end,
        },
        {
            'mrjones2014/legendary.nvim',
            dependencies = {
                'nvim-telescope/telescope.nvim',
                'stevearc/dressing.nvim',
            },
        },
    },
    { -- Lazy Options
        install = {
            colorscheme = { 'onedark_vivid' },
        },
        ui = {
            border = 'rounded',
            icons = {
                cmd        = " ",
                config     = "",
                event      = "",
                ft         = " ",
                init       = " ",
                import     = " ",
                keys       = " ",
                lazy       = "󰒲 ",
                loaded     = "●",
                not_loaded = "○",
                plugin     = " ",
                runtime    = " ",
                require    = "󰢱 ",
                source     = " ",
                start      = "",
                task       = "✔ ",
                list = {
                    "●",
                    "➜",
                    "★",
                    "‒",
                },
            }
        },
        diff = { cmd = 'diffview.nvim' },
    }
)