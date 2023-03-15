vim.o.termguicolors = true

vim.api.nvim_set_keymap('n', 'c', 'y', { noremap = true })

local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({
            'git',
            'clone',
            '--depth',
            '1',
            'https://github.com/wbthomason/packer.nvim',
            install_path
        })
        vim.cmd([[packadd packer.nvim]])
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

require('packer').startup(function(use)
    use { 'ggandor/leap.nvim' }
    use { 'ggandor/leap-spooky.nvim' }
    use {
	    'mrjones2014/legendary.nvim',
	    requires = {
		'nvim-telescope/telescope.nvim',
		'stevearc/dresssing.nvim',
	    }
	}	

    if packer_bootstrap then
        require('packer').sync()
    end
end)

require('leap').add_default_mappings()
require('legendary_config')
require('leap-spooky').setup({
    affixes = {
        remote   = { window = 'r', cross_window = 'R' },
        magnetic = { window = 'm', cross_window = 'M' },
    },
    paste_on_remote_yank = false,
})

