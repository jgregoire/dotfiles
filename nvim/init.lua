-- Neovim config, Lua edition.
local o = vim.o
local w = vim.wo
local b = vim.bo
local g = vim.g
local fn = vim.fn
local map = vim.api.nvim_set_keymap
local options = { noremap = true }

o.termguicolors = true
--require('norman') -- Fixes for Norman keyboard layout.

-- Packer auto-install on new setups.
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({'git', 'clone', '--depth', '1',
                                  'https://github.com/wbthomason/packer.nvim', install_path})
end

require('plugins') -- Packer setup file

require('config') -- Plugin config

require('legendary_config') -- Keymap utility

-- Mouse support
o.mouse = "a"

-- Confirm save before exit
o.confirm = true

-- I do not remember what this does
o.compatible = false

-- Detect external change to file and load changes.
g.autoread = true

-- Color
--vim.cmd("colorscheme base16-railscasts")
--I do this with nvim-base16 plugin now in config.lua.

-- Search
o.hlsearch = true
o.incsearch = true
o.ignorecase = true
o.smartcase = true

-- Line numbers by default.
w.number = true
o.ruler = true
o.scrolloff = 4
o.cursorline = true

o.title = true

-- Show matching brackets
o.showmatch = true

-- Indentation
vim.cmd("filetype plugin indent on")
o.autoindent = true
b.expandtab = true
o.softtabstop = 4
o.smartindent = true
o.smarttab = true
o.shiftwidth = 4

-- Completion
o.wildmenu = true
o.showcmd = true
o.cmdheight = 2
o.completeopt = 'menu,menuone,noselect'

-- Keycode timeout
o.timeout = false
o.ttimeout = true
o.ttimeoutlen = 200

-- Line breaks
w.linebreak = true
o.showbreak = '+++'
b.textwidth = 100

-- Telescope
map('n', '<leader>ff', '<cmd>Telescope find_files<cr>', options)
map('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', options)
map('n', '<leader>fb', '<cmd>Telescope buffers<cr>', options)
map('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', options)
