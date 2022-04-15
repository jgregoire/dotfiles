-- Keymapping for Norman layout

local o = vim.o
local w = vim.wo
local b = vim.bo

local map = vim.api.nvim_set_keymap

local options = { noremap = true }

-- Insert = s
map('n', 's', 'i', options) -- Insert before cursor.
map('n', 'S', 'I', options) -- Insert at beginning of line.

-- Z, X, C, V for Undo, Cut, Copy, Paste
map('n', 'z',  'u',     options) -- Undo.
map('n', 'y',  '<C-r>', options) -- Redo.
map('n', 'x',  'd',     options) -- Cut/delete.
map('n', 'xx', 'dd',    options) -- Cut line.
map('n', 'X',  'd$',    options) -- Cut to end of line
map('n', 'c',  'y',     options) -- Copy/yank.
map('n', 'cc', 'yy',    options) -- Copy line.
map('n', 'C',  'y$',    options) -- Copy to end of line.
map('n', 'v',  'p',     options) -- Paste before cursor.

-- Change
map('n', 'g',  'c',     options) -- Change.
map('n', 'gg', 'cc',    options) -- Change entire line.
map('n', 'G',  'C',     options) -- Change to end of line.

-- Substitute
map('n', 'e',  's',     options) -- Substitute character.
map('n', 'E',  'S',     options) -- Substitute line.

-- Navigation
map('n', 'p',  '%',     options) -- Jump to matching paren.
map('n', 'vv', 'zz',    options) -- Center screen on cursor.

-- Map hjkl to nioh
o.langmap = 'nh,ik,oj,hl' -- Note up/down are flipped from standard.

