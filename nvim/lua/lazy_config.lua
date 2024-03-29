-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

---@diagnostic disable-next-line: undefined-field
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
require('lazy').setup({ -- Plugins
    {
        'olimorris/onedarkpro.nvim',
        priority = 1000, -- Ensure this loads first
        config = function ()
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
                    lsp_semantic_tokens = true,
                    nvim_cmp = true,
                    nvim_lsp = true,
                    nvim_notify = true,
                    telescope = true,
                    toggleterm = true,
                    treesitter = true,
                },
                options = {
                    transparency = true,
                    cursorline = true,
                    highlight_inactive_windows = true,
                },
                colors = {
                    --cursorline = '#000000' -- Set this if the default choice sucks.
                }
            })
            vim.cmd('colorscheme onedark_vivid')
        end,
    },
    {
        'vhyrro/luarocks.nvim',
        priority = 900,
        config = true
    },
    {
        'williamboman/mason.nvim',
        config = function ()
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
        end
    },
    {
        'williamboman/mason-lspconfig.nvim',
        dependencies = { 'williamboman/mason.nvim' },
        config = function ()
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
        end
    },
    {
        'neovim/nvim-lspconfig',
        dependencies = { 'williamboman/mason-lspconfig.nvim' },
        config = function ()
            require('lsp_config') -- Run my configuration file
        end
    },
    {
        'onsails/lspkind.nvim'
    },
    {
        'RRethy/nvim-treesitter-endwise',
    },
    {
        'nvim-treesitter/nvim-treesitter-textobjects'
    },
    {
        'nvim-treesitter/nvim-treesitter-context',
        dependencies = { 'nvim-treesitter/nvim-treesitter' },
    },
    {
        'nvim-treesitter/nvim-treesitter',
        config = function ()
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
        end,
        build = ':TSUpdate',
    },
    {
        'L3MON4D3/LuaSnip',
        config = function ()
            require('luasnip_config') -- Run my configuration file
        end
    },
    {
        'Gelio/cmp-natdat',
        event = 'UIEnter',
        config = true,
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
            'Gelio/cmp-natdat',
        },
        event = 'VeryLazy',
        config = function ()
            require('cmp_config') -- Run my configuration file
        end
    },
    {
        'rcarriga/nvim-notify',
        opts = {
            render = 'wrapped-compact',
            fps = '60',
            stages = 'static',
        },
    },
    {
        'folke/noice.nvim',
        dependencies = {
            'MunifTanjim/nui.nvim',
            'rcarriga/nvim-notify',
        },
        -- event = 'VeryLazy',
        config = function ()
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
        'miversen33/sunglasses.nvim',
        enabled = false,
        config = true,
        event = 'UIEnter',
        opts = {
            filter_type = 'SHADE',
            filter_percent = 0.25,
        }
    },
    {
        '0xAdk/full_visual_line.nvim',
        keys = 'V',
        opts = {}, -- Do not delete. Borks without.
    },
    {
        'lewis6991/gitsigns.nvim',
        opts = {
            signs = {
                add          = { text = '' },
                change       = { text = '' },
                delete       = { text = '' },
                topdelete    = { text = '‾' },
                changedelete = { text = '' },
                untracked    = { text = '┆' },

            },
        },
    },
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'BurntSushi/ripgrep',
        },
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function ()
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
        end,
    },
    {
        -- Only works with config function.
        'norcalli/nvim-colorizer.lua',
        priority = 0,
        config = function ()
            require('colorizer').setup({'*'},{
                RGB      = false, -- Do not colorize #XYZ values (these are usually git issue numbers)
                RRGGBBAA = true,
                css      = true,
                css_fn   = true,
                rgb_fn   = true,
            })
        end,
    },
    {
        'nat-418/boole.nvim',
        opts= {
            mappings = {
                increment = '<C-Up>',
                decrement = '<C-Down>',
            },
            additions = {
                { 'inc', 'dec' },
                { 'increment', 'decrement' },
                { 'Increment', 'Decrement' },
                { 'enable', 'disable' },
                { 'Enable', 'Disable' },
                { 'on', 'off' },
                { 'On', 'Off' },
                { 'yes', 'no' },
                { 'Yes', 'No' },
            },
        },
    },
    {
        'folke/flash.nvim',
        event = 'VeryLazy',
        opts = {
            labels = 'asetniohqwdfurlgykjzxcvmbp',
            label = {
                -- Show jump label before the target, not after.
                after = false,
                before = true,
            }
        },
        keys = {
            { 's', mode = { 'n', 'x', 'o' }, function () require('flash').jump() end, desc = 'Flash: Jump' },
            { 'S', mode = { 'n', 'x', 'o' }, function () require('flash').treesitter() end, desc = 'Flash: Treesitter' },
            { 'm', mode = 'o', function () require('flash').remote() end, desc = 'Flash: Remote' },
            { 'M', mode = { 'o', 'x' }, function () require('flash').treesitter_search() end, desc = 'Treesitter Search' },
            { '<C-f>', mode = { 'c' }, function () require('flash').toggle() end, desc = 'Flash: Toggle in search' },
            { '<C-f>', mode = { 'i' }, function () require('flash').treesitter() end, desc = 'Flash: Treesitter' },
        },
    },
    {
        'lukas-reineke/indent-blankline.nvim',
        main = 'ibl',
        opts = {
            enabled = true,
            indent = { char = '▏' },
            scope = {
                enabled = true,
                show_start = true,
            }
        },
    },
    {
        'abecodes/tabout.nvim',
        dependencies = {
            'nvim-treesitter/nvim-treesitter',
            'hrsh7th/nvim-cmp'
        },
        opts = {
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
        },

    },
    {
        'windwp/nvim-autopairs',
        opts = {
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
        },
    },
    {
        'kylechui/nvim-surround',
        opts = {
            keymaps = {
                insert          = '<C-p>s',
                insert_line     = '<C-p>S',
                normal          = 'ps',
                normal_line     = 'pS',
                normal_cur      = 'Ps',
                normal_cur_line = 'PS',
                delete          = 'xs',
                change          = 'es',
                change_line     = 'eS',
                visual          = 'ps',
                visual_line     = 'pS',
            }
        },
    },
    {
        'JoosepAlviste/nvim-ts-context-commentstring',
        ft = { 'norg' },
        config = function ()
            -- Skip backwards compatibility checks for faster load
            vim.g.skip_ts_context_commentstring_module = true
            require('ts_context_commentstring').setup({
                enable_autocmd = false,
            })
        end
    },
    {
        'terrortylor/nvim-comment',
        main = 'nvim_comment',
        opts = {
            marker_padding = true, -- Add a space.
            comment_empty = true,
            comment_empty_trim_whitespace = true,
            create_mappings = true,
            line_mapping = 'pcc', -- Normal mode, toggle line comment.
            operator_mapping = 'pc', -- Visual/operator mode
            comment_chunk_text_object = 'ic', -- No idea what this is for
            hook = function ()
                require('ts_context_commentstring').update_commentstring()
            end
        },
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
        keys = {
            {
                '<leader>ep',
                function ()
                    require('nabla').popup({ border = 'single' })
                end,
                mode = 'n',
                desc = 'Render in popup',
            },
            {
                '<leader>ei',
                function ()
                    require('nabla').toggle_virt({ autogen = true })
                end,
                mode = 'n',
                desc = 'Render inline',
            },
        },
    },
    {
        'sindrets/diffview.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-tree/nvim-web-devicons'
        },
        lazy = true,
        config = true,
    },
    {
        'akinsho/toggleterm.nvim',
        config = true,
        keys = {
            {
                '<leader>t',
                function ()
                    vim.api.nvim_command([[:TermExec go_back=0 direction=float cmd='cd ]] .. vim.fn.getcwd() .. [['<CR>]])
                end,
                mode = 'n',
                desc = 'Launch ToggleTerm',
            },
        },
        opts = {
            open_mapping = '<C-t>',
            autochdir = true,
            float_opts = {
                border = 'curved',
                width = 120,
                height = 40,
            },
        },
    },
    {
        '3rd/image.nvim',
        ft = {
            'norg',
            'markdown',
            'vimwiki',
        },
        opts = {
            backend = 'kitty',
            integrations = {
                markdown = {
                    enabled = true,
                    filetypes = { 'markdown', 'vimwiki' },
                },
                neorg = {
                    enabled = true,
                    filetypes = { 'norg' },
                },
            }
        }
    },
    {
        'nvim-neorg/neorg',
        dependencies = {
            'nvim-treesitter/nvim-treesitter',
            'nvim-treesitter/nvim-treesitter-textobjects',
            'hrsh7th/nvim-cmp',
            'nvim-lua/plenary.nvim',
            'vhyrro/luarocks.nvim',
        },
        ft = 'norg',
        cmd = 'Neorg',
        build = ':Neorg sync-parsers',
        config = function ()
            local opts = require('neorg_config')
            ---@diagnostic disable-next-line: missing-parameter
            require('neorg').setup(opts)
        end
    },
    {
        'mrjones2014/legendary.nvim',
        dependencies = {
            'nvim-telescope/telescope.nvim',
            'stevearc/dressing.nvim',
        },
        priority = 900,
        config = function ()
            local opts = require('legendary_config')
            require('legendary').setup(opts)
        end
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
