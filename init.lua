-- Neovim config, Lua edition.
-- Do not name this init.lua until done.

--require('plugins')
--vim.cmd([[packadd packer.vim]])

test = '#FF0000'

require('packer').startup(function()
    use { 'nvim-colorizer.lua', event = 'setup' }
end)

--require('colorizer').setup()

-- Mouse support
vim.o.mouse = "a"

-- Confirm save before exit
vim.o.confirm = true

-- I do not remember what this does
vim.o.compatible = false

-- Color
vim.o.termguicolors = true
vim.cmd("colorscheme base16-railscasts")

-- Search 
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true

-- Line numbers by default.
vim.wo.number = true
vim.o.ruler = true
vim.o.scrolloff = 4
vim.wo.cursorline = true

vim.o.title = true

-- Show matching brackets
vim.o.showmatch = true

-- Indentation
vim.cmd("filetype plugin indent on")
vim.o.autoindent = true
vim.bo.expandtab = true
vim.o.softtabstop = 4
vim.o.smartindent = true
vim.o.smarttab = true
vim.o.shiftwidth = 4

-- Completion
vim.o.wildmenu = true
vim.o.showcmd = true
vim.o.cmdheight = 2

-- Keycode timeout
vim.o.timeout = false
vim.o.ttimeout = true
vim.o.ttimeoutlen = 200

-- Line breaks
vim.wo.linebreak = true
vim.o.showbreak = '+++'
vim.bo.textwidth = 100

-- Y yanks to EOL.
vim.api.nvim_set_keymap('n', 'Y', 'y$', { noremap = true })
vim.api.nvim_set_keymap('i', 'jk', '<ESC>', { noremap = true })

vim.cmd('syntax enable')
