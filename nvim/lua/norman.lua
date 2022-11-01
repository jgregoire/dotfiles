-- Keymapping for Norman layout
-- OBSOLETE. SEE legendary_config.lua.
--

local o = vim.o
local w = vim.wo
local b = vim.bo
local g = vim.g

local map = vim.api.nvim_set_keymap

local options = { noremap = true }

-- Leader key
g.mapleader = ','

-- 'jk' exits INSERT mode.
map('i', 'jk', '<ESC>', options)

-- Visual = Ctrl+v
map('n', '<C-b>', '<C-v>', options) -- Visual Block mode
map('n', '<C-v>', 'v', options) -- Visual Char Mode
map('n', '<C-l>', 'V', options) -- Visual Line Mode

-- Insert = s
map('n', 's', 'i', { noremap = false }) -- Insert before cursor.
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
map('n', 'v',  'p',     options) -- Paste after cursor.
map('n', 'V',  'P',     options) -- Paste before cursor.

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
map('n', 'f',  'b',     options) -- Previous word.
map('n', 'F',  'B',     options) -- Previous Word.
map('n', 'd',  '^',     options) -- First non-blank character.
map('n', 'D',  '0',     options) -- Start of line.
map('n', 'u',  'e',     options) -- End of word.
map('n', 'U',  'E',     options) -- End of Word.
map('n', 'r',  'w',     options) -- Next word.
map('n', 'R',  'W',     options) -- Next Word.
map('n', 'l',  '$',     options) -- End of line.

-- Insert Mode Commands
map('i', '<C-t>', '<C-t>', options) -- Increase line indentation.
map('i', '<C-T>', '<C-d>', options) -- Decrease line indentation.
map('i', '<C-f>', '<C-w>', options) -- Delete word before cursor.
map('i', '<C-d>', '<C-u>', options) -- Delete line before cursor.

-- Search
map('n', 'f',  'n',     options) -- Find next.
map('n', 'F',  'N',     options) -- Find prev.

-- Map hjkl to nioh
o.langmap = 'nh,ik,oj,hl' -- Note up/down are flipped from standard.

