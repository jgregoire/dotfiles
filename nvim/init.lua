-- Neovim config, Lua edition.
-- Speedy start
vim.loader.enable()

-- This needs to be set before loading certain plugins.
vim.opt.termguicolors = true

-- Mouse support
vim.opt.mouse = 'a'

-- Confirm save before exit
vim.opt.confirm = true

-- Detect external change to file and load changes.
vim.opt.autoread = true

-- Search
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Line numbers by default.
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.ruler = true

-- How many lines above/below cursor to show when scrollinvim.opt.
vim.opt.scrolloff = 8

-- Highlight the line the cursor is on.
-- vim.opt.cursorline = true

vim.opt.title = true

-- Show matching brackets
vim.opt.showmatch = true

-- Indentation
vim.cmd("filetype plugin indent on")
vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.shiftwidth = 4

-- Below settings improve line break indenting in Neorg
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindentopt = 'list:-1'
vim.opt.formatlistpat = [[^\s*[-\*\~]\+[\.\)]*\s\+]]

-- Smart numbered lists.
vim.opt.formatoptions:append({ 'n' })

-- Folding settings, primarily for Neorg
vim.opt.foldlevel = 2 -- depth to start folding at
vim.opt.foldnestmax = 20 -- default (and max) is 20
vim.opt.foldlevelstart = -1 -- default -1.
vim.opt.foldclose = 'all' -- default ''
vim.opt.foldtext = 'v:lua.vim.treesitter.foldtext()'
-- vim.opt.conceallevel = 2

-- Completion
vim.opt.wildmenu = true
vim.opt.showcmd = true
vim.opt.completeopt = 'menu,menuone,noselect'

vim.opt.cmdheight = 0
vim.opt.shortmess = 'fFinoOxtT'

-- Keycode timeout
vim.opt.timeout = false
vim.opt.ttimeout = true
vim.opt.ttimeoutlen = 200

-- Line breaks
vim.opt.linebreak = true
vim.opt.breakindent = true
vim.opt.showbreak = '|=> '
vim.opt.textwidth = 100
vim.opt.backspace = { 'indent', 'eol', 'start' }

-- Tabline
vim.opt.showtabline = 0

-- Split behavior
vim.opt.splitbelow = true
vim.opt.splitright = true
if not vim.g.neovide then
    vim.opt.inccommand = 'split'
end

-- Spellcheck
-- vim.opt.spell = true
-- vim.opt.spelllang = 'en_us,en_gb'

-- Allow selection in block mode past line endes
vim.opt.virtualedit = 'block'

-- Use system clipboard
-- vim.opt.clipboard:append({ 'unnamedplus' })

-- Neovide-only options
---@diagnostic disable-next-line:undefined-field
if vim.g.neovide then
    vim.opt.guifont = 'FiraCode Nerd Font:h12'
    vim.g.neovide_hide_mouse_when_typing = false
    vim.g.neovide_remember_window_size = true
    vim.g.neovide_cursor_vfx_mode = 'pixiedust'
    vim.g.neovide_cursor_animate_command_line = true
end

vim.g.mapleader = ' '
vim.g.maplocalleader = '-'

-- zsh lacks a TS parser, so treat it like sh
vim.filetype.add({
    extension = {
        zsh = 'sh',
        sh = 'sh',
    },
    filename = {
        ['.zshrc'] = 'sh',
        ['.zprofile'] = 'sh',
        ['.zshenv'] = 'sh',
    },
})

-- SPICE files
vim.filetype.add({
    filename = {
        ['.asy'] = 'spice',
        ['.asc'] = 'spice',
        ['.bead'] = 'spice',
        ['.bjt'] = 'spice',
        ['.cap'] = 'spice',
        ['.dio'] = 'spice',
        ['.ind'] = 'spice',
        ['.jft'] = 'spice',
        ['.mos'] = 'spice',
        ['.res'] = 'spice',
        ['.sub'] = 'spice',
        ['.lib'] = 'spice',
    }
})

-- Add package paths
package.path = package.path .. ';' .. vim.fn.expand('$HOME') .. '/.luarocks/share/lua/5.1/?/init.lua;'
package.path = package.path .. ';' .. vim.fn.expand('$HOME') .. '/.luarocks/share/lua/5.1/?.lua;'

-- Specify plugins:
require('lazy_config')

-- if vim.g.neovide then
    -- vim.cmd([[highlight Normal guibg=#282c34]])
-- end
