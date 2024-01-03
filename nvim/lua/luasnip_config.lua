local ls = require('luasnip')
local s = ls.snippet
local t = ls.text_node

ls.config.set_config({
    history = true,
    updateevents = 'TextChanged,TextChangedI',
    enable_autosnippets = false,
})

-- Keybinds
-- Expand current item or jump to the next item in snippet
-- vim.keymap.set({'i'}, '<C-e>', function() ls.expand() end, { silent = true })
vim.keymap.set(
    { 'i', 's' },
    '<C-e>',
    function()
        if ls.expand_or_jumpable() then
            ls.expand_or_jump()
        end
    end
    -- { silent = true }
)

-- Jump to previous item in snippet
-- vim.keymap.set(
--     { 'i', 's' },
--     '<c-E>',
--     function()
--         if ls.jumpable(-1) then
--             ls.jump(-1)
--         end
--     end,
--     { silent = true }
-- )

-- Select next option in expansion list
vim.keymap.set(
    { 'i' },
    '<c-l>',
    function()
        if ls.choice_active() then
            ls.change_choice(1)
        end
    end
)

-- Quickly re-source this file.
vim.keymap.set( { 'n' }, '<leader>ls', '<cmd>source ~/.config/nvim/lua/luasnip_config.lua<CR>')

-- Now let's define some snippets!
ls.add_snippets(
    'all',
    {
        s('Test', { t('--testy text') })
    }
)

ls.add_snippets(
    'lua',
    {
        s('function', { t('function()') }),
    }
)
