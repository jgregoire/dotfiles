-- This file contains setup and config for Packer plugins.

-- Setup Org mode
require('orgmode').setup_ts_grammar()
require('nvim-treesitter.configs').setup{
--    highlight = {
--        enable = true,
--        disable = { 'org' },
--        additional_vim_regex_highlighting = { 'org' },
--    },
    ensure_installed = { 'org' },
}
require('orgmode').setup{
    org_agenda_files = { '~/org-agenda.org' },
    org_default_notes_file = '~/org-notes.org',
    mappings = {
        global = {
            org_agenda = '<Leader>oa',
            org_capture = '<Leader>oc',
        },
    },
}

-- Autopairs
require('nvim-autopairs').setup({
    fast_wrap = {},
    enable_check_bracket_line = false, -- Don't add pair if it already has close pair in same line.
    ignored_next_char = "[%w%.]", -- Don't add pair if next char is alphanumeric or '.'
})

-- Base16
local base16 = require('base16')
base16(base16.themes["railscasts"], true)


-- Setup nvim-cmp.
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
local luasnip = require('luasnip')
local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line-1, line, true)[1]:sub(col, col):match("%s") == nil
end
cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end,
    },
    mapping = {
        --['<C-i>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        --['<C-o>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        ['<C-y>'] = cmp.config.disable,
        ['<Esc>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),

        -- Accept selected item.
        ['<CR>'] = cmp.mapping.confirm({ select = true }),

        -- Select next suggestion.
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, { 'i', 's' }),

        -- Select previous suggestion.
        ['<C-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { 'i', 's' }),
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' }, -- For luasnip users.
        { name = 'orgmode' },
    }, {
        { name = 'buffer' },
    }),
    enabled = function() -- Disable autocomplete in comments.
        local context = require'cmp.config.context'
        if vim.api.nvim_get_mode().mode == 'c' then
            return true
        else
            return not context.in_treesitter_capture("comment")
            and not context.in_syntax_group("Comment")
        end
    end
})
-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
        { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
        { name = 'buffer' },
    })
})
-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
    sources = {
        { name = 'buffer' }
    }
})
-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})
-- cmp autopairs support
cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done({ map_char = { tex = '' } }))

-- Setup lspconfig lua server.
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- Configure Lua language server.
require('lspconfig')['sumneko_lua'].setup {
    capabilities = capabilities,
    flags = {
        debounce_text_changes = 150,
    },
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
                path = runtime_path,
            },
            diagnostics = {
                globals = { 'vim' },
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = {
                enable = false,
            },
        },
    },
}
-- Configure C/C++/C# language server
--require('lspconfig')['ccls'].setup{
--    init_options = {
--        compilationDatabaseDirectory = "build",
--        index = { threads = 0},
--        clang = { excludeArgs = { "-frounding-math"} },
--    }
--}
-- Setup language servers with default config.
local servers = {
    'rls',
    'arduino_language_server',
    'bashls',
    'jsonls',
    'pylsp',
    'yamlls',
    'ltex',
}
for _, lsp in pairs(servers) do
    require('lspconfig')[lsp].setup({
        capabilities = capabilities,
        flags = {
            debounce_text_changes = 150,
        }
    })
end
