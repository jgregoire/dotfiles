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
vim.opt.scrolloff = 999

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
vim.opt.inccommand = 'split'

-- Allow selection in block mode past line endes
vim.opt.virtualedit = 'block'

-- Use system clipboard
-- vim.cmd('set clipboard+=unnamedplus')
vim.opt.clipboard:append({ 'unnamedplus' })

-- Packer auto-install on new setups.
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({
            'git',
            'clone',
            '--depth',
            '1',
            'https://githuvim.opt.com/wbthomason/packer.nvim',
            install_path
        })
        vim.cmd('packadd packer.nvim')
        return true
    end
    return false
end

---@diagnostic disable-next-line:unused-local
local packer_bootstrap = ensure_packer()

-- Neovide-only options
---@diagnostic disable-next-line:undefined-field
if vim.g.neovide then
    vim.opt.guifont = 'FiraCode Nerd Font:h12'
    vim.g.neovide_hide_mouse_when_typing = false
    vim.g.neovide_remember_window_size = true
    vim.g.neovide_cursor_vfx_mode = 'pixiedust'
    vim.g.neovide_cursor_animate_command_line = true
end

-- Specify plugins:
require('plugins')

-- Key mappings:
require('legendary_config')

-- Plugin configuration:
require('config')
