-- Bootstrap lazy.nvim definite
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

---@diagnostic disable-next-line: undefined-field
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    print('Installing lazy.nvim...')
    vim.fn.system({
        'git', 'clone', '--filter=blob:none', 'https://github.com/folke/lazy.nvim.git', '--branch=stable', lazypath
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
        enabled = false,
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
        'diegoulloao/neofusion.nvim',
        priority = 1000,
        enabled = true,
        config = function ()
            require('neofusion').setup({
                overrides = {
                    ['@operator']            = { fg = '#B2F85D' },
                    ['@string.escape']       = { fg = '#B2F85D' },
                    ['@punctuation.special'] = { fg = '#FD5E3A' },
                },
            })
            vim.cmd.colorscheme('neofusion')
        end
    },
    {
        'AlexvZyl/nordic.nvim',
        priority = 1000,
        enabled = false,
        config = function ()
            require('nordic').load()
        end
    },
    {
        'lvim-tech/lvim-colorscheme',
        priority = 1000,
        enabled = false,
        config = function ()
            require('lvim-colorscheme').setup({
                style = 'dark',
                styles = {
                    comments = { italic = true, bold = false },
                    keywords = { italic = false, bold = true },
                    functions = { italic = false, bold = false },
                    variables = {  },
                }
            })
        end
    },
    {
        'xero/miasma.nvim',
        enabled = false,
        priority = 100,
        config = function ()
            vim.cmd.colorscheme('miasma')
        end
    },
    {
        'sainnhe/gruvbox-material',
        priority = 1000,
        enabled = false,
        config = function ()
            vim.g.gruvbox_material_enable_italic = true
            vim.g.gruvbox_material_background = 'hard'
            vim.g.gruvbox_material_foreground = 'mix'
            vim.cmd.colorscheme('gruvbox-material')
        end
    },
    {
        'sainnhe/edge',
        priority = 1000,
        enabled = false,
        config = function ()
            vim.g.edge_enable_italic = true
            vim.g.edge_style = 'neon'
            vim.g.edge_dim_foreground = 1
            vim.cmd.colorscheme('edge')
        end
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
                    -- 'typos_lsp',
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
        'ravibrock/spellwarn.nvim',
        event = 'VeryLazy',
        opts = {
            prefix = 'spellwarn: ',
        },
    },
    {
        'L3MON4D3/LuaSnip',
        event = 'InsertEnter',
        config = function ()
            require('luasnip_config') -- Run my configuration file
        end
    },
    {
        'Gelio/cmp-natdat',
        lazy = true,
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
        event = 'InsertEnter',
        config = function ()
            require('cmp_config') -- Run my configuration file
        end
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
            local colors = {
                black        = '#06101e',
                white        = '#e2d9c5',
                orange       = '#ea6847',
                red          = '#FD5E3A',
                lightgray    = '#22536f',
                blue         = '#35b5ff',
                cyan         = '#66def9',
                green        = '#B2F85D',
                magenta      = '#ec30ac',
                maroon       = '#722529',
                darkgray     = '#052839',
                darkblue     = '#004752',
                darkcyan     = '#008DA3',
            }
            local neofusion_theme = {
                normal = {
                    a = { bg = colors.red, fg = colors.black, gui = 'bold' },
                    b = { bg = colors.lightgray, fg = colors.white },
                    c = { bg = colors.darkgray, fg = colors.white },
                    x = { bg = colors.darkgray, fg = colors.white },
                    y = { bg = colors.blue, fg = colors.black },
                    z = { bg = colors.cyan, fg = colors.black, gui = 'bold' }
                },
                insert = {
                    a = { bg = colors.green, fg = colors.black
                        , gui = 'bold' },
                    b = { bg = colors.lightgray, fg = colors.white },
                    c = { bg = colors.darkgray, fg = colors.white },
                    x = { bg = colors.darkgray, fg = colors.white },
                    y = { bg = colors.blue, fg = colors.black },
                    z = { bg = colors.cyan, fg = colors.black, gui = 'bold' }
                },
                visual = {
                    a = { bg = colors.magenta, fg = colors.black, gui = 'bold'},
                    b = { bg = colors.lightgray, fg = colors.white },
                    c = { bg = colors.darkgray, fg = colors.white },
                    x = { bg = colors.darkgray, fg = colors.white },
                    y = { bg = colors.blue, fg = colors.black },
                    z = { bg = colors.cyan, fg = colors.black, gui = 'bold' }
                },
                replace = {
                    a = { bg = colors.blue, fg = colors.black, gui = 'bold'},
                    b = { bg = colors.lightgray, fg = colors.white },
                    c = { bg = colors.darkgray, fg = colors.white },
                    x = { bg = colors.darkgray, fg = colors.white },
                    y = { bg = colors.blue, fg = colors.black },
                    z = { bg = colors.cyan, fg = colors.black, gui = 'bold' }
                },
                command = {
                    a = { bg = colors.magenta, fg = colors.white, gui = 'bold'},
                    b = { bg = colors.lightgray, fg = colors.white },
                    c = { bg = colors.darkgray, fg = colors.white },
                    x = { bg = colors.darkgray, fg = colors.white },
                    y = { bg = colors.blue, fg = colors.black },
                    z = { bg = colors.cyan, fg = colors.black, gui = 'bold' }
                },
                inactive = {
                    a = { bg = colors.maroon, fg = colors.white, gui = 'bold'},
                    b = { bg = colors.darkgray, fg = colors.white },
                    c = { bg = colors.darkgray, fg = colors.white },
                    x = { bg = colors.darkgray, fg = colors.white },
                    y = { bg = colors.darkgray, fg = colors.white },
                    z = { bg = colors.darkcyan, fg = colors.black, gui = 'bold' }
                }
            }
            require('lualine').setup({
                options = {
                    theme = neofusion_theme,
                    -- theme = 'eldritch',
                    -- theme = 'nordic',
                    component_separators = {
                        left  = '│',
                        right = '│'
                    },
                    section_separators = {
                        -- left  = '',
                        -- right = ''
                        -- right = '',
                        -- left = '',
                        left = '',
                        right = '',
                    },
                },
                extensions = {
                    'toggleterm',
                },
                sections = {
                    lualine_a = {
                        {
                            'mode',
                            -- separator = {
                            --     left = '',
                            --     right = '',
                            -- },
                        },
                    },
                    lualine_b = {
                        {
                            'branch',
                            -- separator = {
                            --     left = '',
                            --     right = '',
                            -- },
                            draw_empty = true,
                        },
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
                    lualine_z = {
                        {
                            'location',
                            -- separator = {
                            --     left = '',
                            --     right = '',
                            -- },
                        },
                    },
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
        enabled = false,
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
        'brenoprata10/nvim-highlight-colors',
        enabled = true,
        opts = {
            enable_named_colors = false,
            enable_tailwind = true
        },
        config = true
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
        -- event = 'VeryLazy',
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
            { '/' },
            { '?' },
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
        keys = {
            { '<Tab>' },
            { '<S-Tab>' },
            { '<C-d>' },
        },
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
        enabled = true,
        event = 'InsertEnter',
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
        event = 'InsertEnter',
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
        'altermo/ultimate-autopair.nvim',
        enabled = false,
        event = { 'InsertEnter', 'CmdlineEnter' },
        branch = 'v0.6',
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
        keys = {
            { 'pcc', 'n' },
            { 'pc', 'v' },
            { 'ic', 'o' }
        },
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
        'MeanderingProgrammer/markdown.nvim',
        dependencies = {
            'nvim-treesitter/nvim-treesitter',
            'nvim-tree/nvim-web-devicons'
        },
        config = function ()
            require('render-markdown').setup({})
        end,
        ft = { 'md' },
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
        'Makaze/watch.nvim',
        cmd = { 'WatchStart', 'WatchStop', 'WatchFile' }
    },
    {
        'protex/better-digraphs.nvim',
        keys = {
            {
                '<C-d>',
                function() require('better-digraphs').digraphs('insert') end,
                mode = 'i',
                desc = 'Pick digraph'
            },
            {
                'es<C-d>',
                function() require('better-digraphs').digraphs('normal') end,
                mode = 'n',
                desc = 'Substitute with digraph'
            },
            {
                'es<C-d>',
                function() require('better-digraphs').digraphs('visual') end,
                mode = 'v',
                desc = 'Substitute with digraph'
            }
        }
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
            'benlubas/neorg-conceal-wrap'
        },
        version = '*',
        ft = 'norg',
        -- build = ':Neorg sync-parsers',
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
    {
        'tris203/precognition.nvim',
        event = 'VeryLazy',
        opts = {
            sartVisible = false,
            hints = {
                Caret = { text = 'w' },
                Dollar = { text = 'l' },
                MatchingPair = { text = 'b' },
                Zero = { text = 'W' },
                w = { text = 'u' },
                b = { text = 'd' },
                e = { text = 'r' },
                W = { text = 'U' },
                B = { text = 'D' },
                E = { text = 'R' },
            }
        }
    }
},
    { -- Lazy Options
        install = {
            colorscheme = { 'onedark_vivid' },
        },
        ui = {
            border = 'rounded',
            icons = {
                cmd        = " ",
                config     = " ",
                event      = " ",
                ft         = " ",
                init       = " ",
                import     = " ",
                keys       = " ",
                lazy       = "󰒲 ",
                loaded     = "● ",
                not_loaded = "○ ",
                plugin     = " ",
                runtime    = " ",
                require    = "󰢱 ",
                source     = " ",
                start      = " ",
                task       = " ",
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
