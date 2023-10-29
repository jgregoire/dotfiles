-- Neovim config, Lua edition.

-- Speedy start
vim.loader.enable()

local o = vim.o
local w = vim.wo
local b = vim.bo
local g = vim.g

-- This needs to be set before loading certain plugins.
o.termguicolors = true

-- Packer auto-install on new setups.
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({
            'git',
            'clone',
            '--depth',
            '1',
            'https://github.com/wbthomason/packer.nvim',
            install_path
        })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

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

-- How many lines above/below cursor to show when scrolling.
o.scrolloff = 8

-- Highlight the line the cursor is on.
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
-- Below settings improve line break indending in Neorg
o.wrap = true
o.linebreak = true
o.breakindentopt = 'list:-1'
o.formatlistpat = [[^\s*[-\*\~]\+[\.\)]*\s\+]]

-- Completion
o.wildmenu = true
o.showcmd = true
o.completeopt = 'menu,menuone,noselect'

o.cmdheight = 0
--o.showcmdloc = 
o.shortmess = 'fFinoOxtT'

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

-- Use system clipboard
g.clipboard = 'unnamedplus' -- Requires xclip or other 3rd party provider

-- Neovide-only options
if g.neovide then
    o.guifont = 'FiraCode Nerd Font:h12'
    g.neovide_hide_mouse_when_typing = false
    g.neovide_remember_window_size = true
    g.neovide_cursor_vfx_mode = 'railgun'
    g.clipboard = 'unnamed'
end
