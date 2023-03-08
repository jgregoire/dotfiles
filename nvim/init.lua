-- Neovim config, Lua edition.
local o = vim.o
local w = vim.wo
local b = vim.bo
local g = vim.g
local fn = vim.fn

o.termguicolors = true

-- Packer auto-install on new setups.
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({'git', 'clone', '--depth', '1',
                                  'https://github.com/wbthomason/packer.nvim', install_path})
end

-- Speedy start
require('impatient')

-- Specify plugins:
require('plugins')

-- Key mappings:
require('legendary_config')

-- Plugin configuration:
require('config')

-- Mouse support
o.mouse = "a"

-- Confirm save before exit
o.confirm = true

-- Detect external change to file and load changes.
g.autoread = true

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
o.cmdheight = 0
o.completeopt = 'menu,menuone,noselect'

-- Keycode timeout
o.timeout = false
o.ttimeout = true
o.ttimeoutlen = 200

-- Line breaks
w.linebreak = true
w.breakindent = true
o.showbreak = '==> '
b.textwidth = 100

-- Tabline
o.showtabline = 2
