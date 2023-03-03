-- This file contains setup and config for Packer plugins.

require('nvim-autopairs').setup({
    fast_wrap = {},
    enable_check_bracket_line = false, -- Don't add pair if it already has close pair in same line.
    ignored_next_char = "[%w%.]", -- Don't add pair if next char is alphanumeric or '.'
})

-- Surround
require('nvim-surround').setup({
    keymaps = {
        normal          = 'ps',
        normal_line     = 'pS',
        normal_cur      = 'Ps',
        normal_cur_line = 'PS',
        delete          = 'xs',
        change          = 'es',
    }
})

-- nvim-comment
require('nvim_comment').setup({
    marker_padding = true, -- Add a space.
    line_mapping = 'pcc', -- Normal mode, toggle line comment.
    operator_mapping = 'pc', -- Visual/operator mode
    comment_chunk_text_object = 'ic', -- No idea what this is for
})

-- Base16
local base16 = require('base16')
base16(base16.themes["railscasts"], true)

-- Nvim-Colorizer
require('colorizer').setup()

-- nvim-notify
local theme = base16.themes['railscasts']
vim.cmd('highlight NotifyERRORBorder guifg=#' .. theme.base08)
vim.cmd('highlight NotifyERRORIcon   guifg=#' .. theme.base08)
vim.cmd('highlight NotifyERRORTitle  guifg=#' .. theme.base08)
vim.cmd('highlight NotifyWARNBorder  guifg=#' .. theme.base0A)
vim.cmd('highlight NotifyWARNIcon    guifg=#' .. theme.base0A)
vim.cmd('highlight NotifyWARNTitle   guifg=#' .. theme.base0A)
vim.cmd('highlight NotifyINFOBorder  guifg=#' .. theme.base07)
vim.cmd('highlight NotifyINFOIcon    guifg=#' .. theme.base07)
vim.cmd('highlight NotifyINFOTitle   guifg=#' .. theme.base07)
vim.cmd('highlight NotifyDEBUGBorder guifg=#' .. theme.base0D)
vim.cmd('highlight NotifyDEBUGIcon   guifg=#' .. theme.base0D)
vim.cmd('highlight NotifyDEBUGTitle  guifg=#' .. theme.base0D)
vim.cmd('highlight NotifyTRACEBorder guifg=#' .. theme.base0E)
vim.cmd('highlight NotifyTRACEIcon   guifg=#' .. theme.base0E)
vim.cmd('highlight NotidyTRACETitle  guifg=#' .. theme.base0E)
vim.cmd('highlight Normal guifg=#' .. theme.base05 .. 'guibg=#000000')
vim.cmd('highlight link NotifyERRORBody Normal')
vim.cmd('highlight link NotifyWARNBody  Normal')
vim.cmd('highlight link NotifyINFOBody  Normal')
vim.cmd('highlight link NotifyDEBUGBody Normal')
vim.cmd('highlight link NotifyTRACEBody Normal')

require('notify').setup({
    render = 'compact',
    fps    = 30,
    stages = 'static', -- Others: fade, slide, static
    background_colour = '#000000',
})

-- Now make nvim use nvim-notify.
vim.notify = require('notify')

-- Noice
require('noice').setup({
    lsp = {
        override = {
	    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
	    ["vim.lsp.util.stylize_markdown"] = true,
	    ["cmp.entry.get_documentation"] = true,
        }
    },
    presets = {
        bottom_search = true, -- use a classic bottom cmdline for search
        command_palette = true, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = false, -- add a border to hover docs and signature help
    },
})

-- Noice colors
vim.cmd('highlight NoiceCmdlinePopupBorder guifg=#' .. theme.base07)
vim.cmd('highlight NoiceCmdlineIcon        guifg=#' .. theme.base08)

-- Barbar (tabbing)
require('barbar-theme')
require('bufferline').setup({
    auto_hide = true,
    clickable = true, -- Left click: Select. Middle click: Close.
    icons = 'both', -- true, 'numbers', or 'both'
})

-- Lualine
require('lualine').setup({
    options = {
        theme = 'auto', -- 'base16' doesn't work.
        --component_separators = { left = '', right = ''},
        component_separators = { left = '|', right = '|' },
        section_separators = { left = '', right = ''},
        -- section_separators = { left = '', right = '' },
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = {
            'branch', 'diff', 'diagnostics',
            --color = { fg = '#a5c261', bg = '#2b2b2b' }, -- Doesn't work for some reason
        },
        lualine_c = { 'filename' },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress'},
        lualine_z = { 'location' },
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
    },
})

-- Gitsigns
require('gitsigns').setup({
    signs = {
        add          = { text = '' },
        change       = { text = '' },
        delete       = { text = '' },
        topdelete    = { text = '‾' },
        changedelete = { text = '~' },
        untracked    = { text = '┆' },
    },
})
vim.cmd('highlight GitSignsAdd          guifg=#' .. theme.base0B .. ' guibg=#000000')
vim.cmd('highlight GitSignsChange       guifg=#' .. theme.base0D .. ' guibg=#000000')
vim.cmd('highlight GitSignsDelete       guifg=#' .. theme.base08 .. ' guibg=#000000')
vim.cmd('highlight GitSignsTopDelete    guifg=#' .. theme.base0E .. ' guibg=#000000')
vim.cmd('highlight GitSignsChangedelete guifg=#' .. theme.base0C .. ' guibg=#000000')
vim.cmd('highlight GitSignsUntracked    guifg=#' .. theme.base0A .. ' guibg=#000000')

-- Toggleterm
require('toggleterm').setup({
    open_mapping = '<C-t>',

})

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
        --['C-i'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        --['wC-ow'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
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
local capabilities = require('cmp_nvim_lsp').default_capabilities()
-- Configure Lua language server.
require('lspconfig').lua_ls.setup({
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
                checkThirdParty = false,
            },
            telemetry = {
                enable = false,
            },
        },
    },
})
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
