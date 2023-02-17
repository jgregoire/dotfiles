-- Use Packer to manage nvim plugins.
-- Call this file in init.lua.
-- Plugins with more intensive setup are configured in config.lua.

return require('packer').startup(function(use)
    -- Packer will check for updates to itself.
    use { 'wbthomason/packer.nvim' }

    -- Pretty notifications.
    use { 'rcarriga/nvim-notify' }

    use {
        'folke/noice.nvim',
        requires = {
            'MunifTanjim/nui.nvim',
            'rcarriga/nvim-notify',
        }
    }
    -- Speed up nvim launch time.
    use { 'lewis6991/impatient.nvim' }

    -- Highlight color codes like #a4c261 or #da4939 in their actual color.
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

    -- Fancy icons, used for lualine.
    use { 'nvim-tree/nvim-web-devicons' }

    -- Base16 theme support
    -- Needed to theme UI elements, to match my terminal color scheme.
    use { 'norcalli/nvim-base16.lua' }

    -- Fancier statusline.
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true },
--[[        config = function()
            require('lualine').setup({
                options = { theme = 'auto' },
            })
        end, 
--]]
    }

    use { 'lewis6991/gitsigns.nvim' }

    -- Better find tool.
    -- Requires ripgrep distro package.
    use {
        'nvim-telescope/telescope.nvim',
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
	wants = { 'nvim-tree/nvim-web-devicons'},
    }

    -- Keymap manager
    use {
        'mrjones2014/legendary.nvim',
        requires = {
            'nvim-telescope/telescope.nvim',
            'stevearc/dressing.nvim',
        }
    }

    -- Now shit gets real.
    -- lspconfig
    -- Requires lua-language-server (Arch package)
    use { 'neovim/nvim-lspconfig' }

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

    -- Packer bootstrapping
    if packer_bootstrap then
        require('packer').sync()
    end
end)
