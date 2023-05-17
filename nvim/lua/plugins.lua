-- Use Packer to manage nvim plugins.
-- Call this file in init.lua.
-- Plugins with more intensive setup are configured in config.lua.

return require('packer').startup(function(use)
    -- Packer will check for updates to itself.
    use { 'wbthomason/packer.nvim' }

    -- Start page
    use {
        'goolord/alpha-nvim',
        requires = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('alpha').setup(require('alpha.themes.dashboard').config)
        end,
    }

    -- Diff/merge tool
    --[[use {
        'sindrets/diffview.nvim',
        requires = {
	    'nvim-lua/plenary.nvim',
	    'nvim-tree/nvim-web-devicons',
        },
    }--]]

    -- Leap
    use { 'ggandor/leap.nvim' }
    use { 'ggandor/leap-spooky.nvim' }

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

    -- Base16 theme support
    -- Needed to theme UI elements, to match my terminal color scheme.
    use { 'norcalli/nvim-base16.lua' }

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

    -- Better tabs
    use {
        'romgrk/barbar.nvim',
        wants = { 'nvim-tree/nvim-web-devicons' },
    }

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

    -- lspconfig
    use { 'neovim/nvim-lspconfig' }

    use { 'RRethy/nvim-treesitter-endwise' }

    -- Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        config = function()
            require('nvim-treesitter.configs').setup({
                ensure_installed = { 'lua', 'vim', 'help', 'query', },
                sync_install = false,
                auto_install = true,
                highlight = {
                    enable = true,
                    additional_vim_regex_hightlighting = { 'neorg' },
                },
                endwise = {
                    enable = true
                }
            })
        end,
        -- run = ':TSUpdate',
        build = ':TSUpdate',
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
        -- ft = 'norg', -- Only load plugin when opening a .norg file.
        after = 'nvim-treesitter',
        config = function()
            require('neorg').setup({
                load = {
                    ['core.defaults'] = {},
                    ['core.concealer'] = {},
                    ['core.dirman'] = {
                        config = {
                            workspaces = {
                                notes = '~/neorg',
                            },
                        },
                    },
                    ['core.completion'] = {
                        config = {
                            engine = 'nvim-cmp',
                            -- name = '[Neorg]',
                        },
                    },
                    ['core.highlights'] = {},
                }
            })
        end,
        run = ':Neorg sync-parsers', -- Update treesitter parser when neorg is updated.
        requires = 'nvim-lua/plenary.nvim',
    }

    -- Packer bootstrapping
    if packer_bootstrap then
        require('packer').sync()
    end
end)
