-- Use Packer to manage nvim plugins.
-- Call this file in init.lua

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    -- Highlight color codes.
    use {
        'norcalli/nvim-colorizer.lua',
        config = function()
            require('colorizer').setup()
        end,
    }

    -- Make nvim transparent.
    use {
        'xiyaowong/nvim-transparent',
        config = function()
            require('transparent').setup({enable = true})
        end,
    }

    -- Indent marker lines
    use {
        'lukas-reineke/indent-blankline.nvim',
        config = function()
            require('indent_blankline').setup({
                show_current_context = true,
                show_current_context_start = true,
            })
        end
    }

    -- Fancy icons
    use 'kyazdani42/nvim-web-devicons'

    -- Fancier statusline.
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        config = function()
            require('lualine').setup()
        end,
    }

    -- Better find tool.
    -- Requires ripgrep distro package.
    use {
        'nvim-telescope/telescope.nvim',
        requires = { 'nvim-lua/plenary.nvim' }
    }

    -- Bracket auto-pairing.
    use {
        'windwp/nvim-autopairs',
        config = function()
            require('nvim-autopairs').setup()
        end,
    }

    -- Now shit gets real.
    -- lspconfig
    -- Requires lua-language-server (Arch package)
    use {
        'neovim/nvim-lspconfig',
    }

    -- Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        config = function()
            require('nvim-treesitter').setup({
                ensure_installed = "maintained",
                sync_install = "false",
                highlight = {
                    enable = true,
                    additional_vim_regex_hightlighting = false,
                },
            })
        end,
        run = ':TSUpdate',
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
        },
    }

    -- Org mode
    use {
        'nvim-orgmode/orgmode',
        config = function()
            require('orgmode').setup{}
        end
    }

    -- Packer bootstrapping
    if packer_bootstrap then
        require('packer').sync()
    end
end)
