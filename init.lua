-- Neovim config, Lua edition.
local o = vim.o
local w = vim.wo
local b = vim.bo
local map = vim.api.nvim_set_keymap
options = { noremap = true }

require('norman')

test = '#FF0000'

-- Mouse support
o.mouse = "a"


-- Confirm save before exit
o.confirm = true

-- I do not remember what this does
o.compatible = false

-- Color
o.termguicolors = true
vim.cmd("colorscheme base16-railscasts")

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

-- Keycode timeout
o.timeout = false
o.ttimeout = true
o.ttimeoutlen = 200

-- Line breaks
w.linebreak = true
o.showbreak = '+++'
b.textwidth = 100

-- Y yanks to EOL.
map('n', 'Y', 'y$', options)

map('i', 'jk', '<ESC>', options)

vim.cmd('syntax enable')
