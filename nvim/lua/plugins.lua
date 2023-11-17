-- Use Packer to manage nvim plugins.
-- Call this file in init.lua.
-- Plugins with more intensive setup are configured in config.lua.

return require('packer').startup(function(use)
    -- Packer will check for updates to itself.
    use { 'wbthomason/packer.nvim' }

    -- Session manager
    use {
        'folke/persistence.nvim',
        event = 'BufReadPre',
    }

    -- Start page
    use {
        'goolord/alpha-nvim',
        requires = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('alpha').setup(require('dashboard').config)
        end,
    }

    -- Tab to escape delimiters
    use {
        'abecodes/tabout.nvim',
        wants = { 'nvim-treesitter' },
        after = { 'nvim-cmp' },
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
    }

    -- Extend increment/decrement command
    use { 'nat-418/boole.nvim' }

    -- CSV mode
    use {
        'cameron-wags/rainbow_csv.nvim',
        config = function()
            require('rainbow_csv').setup(){}
        end,
        module = {
            'rainbow_csv',
            'rainbow_csv.fns',
        },
        ft = {
            'csv',
            'tsv',
            'csv_semicolon',
            'csv_whitespace',
            'csv_pipe',
            'rfc_csv',
            'rfc_semicolon',
        }
    }
    -- Plaintext rendering of LaTeX equations
    use { 'jbyuki/nabla.nvim' }

    -- Diff/merge tool
    use {
        'sindrets/diffview.nvim',
        requires = {
            'nvim-lua/plenary.nvim',
            'nvim-tree/nvim-web-devicons',
        },
    }

    -- Modern motions
    use { 'folke/flash.nvim' }

    -- Pretty notifications.
    use { 'rcarriga/nvim-notify' }

    use {
        'folke/noice.nvim',
        requires = {
            'MunifTanjim/nui.nvim',
            'rcarriga/nvim-notify',
        }
    }

    -- Highlight color codes like #a4c261 or #da4939 in their actual color.
    use { 'norcalli/nvim-colorizer.lua' }

    -- Make nvim transparent.
    use { 'xiyaowong/nvim-transparent' }

    -- Indent marker lines
    use { 'lukas-reineke/indent-blankline.nvim' }

    -- Fancy icons, used for lualine.
    use { 'nvim-tree/nvim-web-devicons' }

    -- One Dark theme
    use { 'olimorris/onedarkpro.nvim' }

    -- Fancier statusline.
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true },
    }

    use { 'lewis6991/gitsigns.nvim' }

    -- Better find tool.
    -- Requires ripgrep distro package.
    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.x', -- Dev suggests this instead of 'master'
        requires = { 'nvim-lua/plenary.nvim' }
    }

    -- Bracket auto-pairing.
    use { 'windwp/nvim-autopairs' }

    -- More bracketing smarts.
    use {
        'kylechui/nvim-surround',
        tag = '*', -- '*' for stable, 'main' for latest
    }

    use { 'terrortylor/nvim-comment' }

    -- Keymap manager
    use {
        'mrjones2014/legendary.nvim',
        requires = {
            'nvim-telescope/telescope.nvim',
            'stevearc/dressing.nvim',
        }
    }

    -- Fancier terminal
    use {
        'akinsho/toggleterm.nvim',
        tag = '*',
    }

    -- Smooth scrolling
    use { 'karb94/neoscroll.nvim' }

    -- lspconfig
    use { 'neovim/nvim-lspconfig' }

    -- Automatically add 'end' keyword as appropriate
    use { 'RRethy/nvim-treesitter-endwise' }

    -- Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        config = function()
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
        -- build = ':TSUpdate',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }

    -- Completion
    use {
        'hrsh7th/nvim-cmp',
        requires = {
            'neovim/nvim-lspconfig',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
            'hrsh7th/cmp-calc',
            'hrsh7th/cmp-nvim-lua',
        },
    }

    -- Neorg
    use {
        'nvim-neorg/neorg',
        tag = '*',
        ft = 'norg', -- Only load plugin when opening a .norg file.
        after = 'nvim-treesitter',
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
        -- run = ':Neorg sync-parsers', -- Update treesitter parser when neorg is updated.
        requires = 'nvim-lua/plenary.nvim',
    }

    -- Packer bootstrapping
    if packer_bootstrap then ---@diagnostic disable-line:undefined-global
        require('packer').sync()
    end
end)
