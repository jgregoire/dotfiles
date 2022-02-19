-- Keymapping for Norman layout

local o = vim.o
local w = vim.wo
local b = vim.bo

local map = vim.api.nvim_set_keymap

options = { noremap = true }

-- Remap nioh commands
-- s for insert
map('n', 's', 'i', options)

-- Map hjkl to nioh
o.langmap = 'nh,ik,oj,hl'
