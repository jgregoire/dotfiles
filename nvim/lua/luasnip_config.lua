---@diagnostic disable: unused-local
local ls = require('luasnip')
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local l = require("luasnip.extras").lambda
local rep = require("luasnip.extras").rep
local p = require("luasnip.extras").partial
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty
local dl = require("luasnip.extras").dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local types = require("luasnip.util.types")
local conds = require("luasnip.extras.conditions")
local conds_expand = require("luasnip.extras.conditions.expand")
---@diagnostic enable: unused-local

ls.config.set_config({
    history = true,
    updateevents = 'TextChanged,TextChangedI',
    enable_autosnippets = false,
})

-- Keybinds
-- Expand current item or jump to the next item in snippet
vim.keymap.set(
    { 'i', 's' },
    '<c-e>',
    function ()
        if ls.expand_or_jumpable() then
            ls.expand_or_jump()
        end
    end,
    { silent = true }
)

-- Jump to previous item in snippet
vim.keymap.set(
    { 'i', 's' },
    '<c-E>',
    function ()
        if ls.jumpable(-1) then
            ls.jump(-1)
        end
    end,
    { silent = true }
)

-- Select next option in expansion list
vim.keymap.set(
    { 'i' },
    '<c-l>',
    function ()
        if ls.choice_active() then
            ls.change_choice(1)
        end
    end
)

-- Quickly re-source this file so I can use new snippets immediately.
vim.keymap.set( { 'n' }, '<leader>ls', '<cmd>source ~/.config/nvim/lua/luasnip_config.lua<CR>')

-- Now let's define some snippets!
-- Using VSCode format for portability, except where I need
-- more advanced features.
ls.add_snippets(
    'all',
    {
        s('Test', { t('--testy text') })
    }
)

ls.add_snippets(
    'lua',
    {
        -- Inline function
        ls.parser.parse_snippet("ifn", "function () $1 end"),

        -- Legendary keymaps
        ls.parser.parse_snippet("km", "{ '$1', '$2', mode = { '$3' }, description = '$4', opts = defaults },"),
        ls.parser.parse_snippet("kr", "{ '$1', mode = { '$2' }, description = '$3' },"),

        -- Require
        s("req", fmt("local {} = require('{}')", { i(1, "module"), rep(1) })),
    }
)
