vim.opt.termguicolors = true

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
        'vhyrro/luarocks.nvim',
        branch = 'more-fixes',
        config = function ()
            require('luarocks').setup({})
        end
    },
    {
        'nvim-neorg/neorg',
        branch = 'luarocks',
        dependencies = { 'luarocks.nvim' },
        config = function ()
            require('neorg').setup({
                load = {
                    ['core.defaults'] = {}
                }
            })
        end
    }
})
