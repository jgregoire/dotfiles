-- This file contains setup and config for Packer plugins.

-- Base16
local base16 = require('base16')
local theme = base16.themes['railscasts']
base16(theme, true) -- Set theme.

-- Transparency support
require('transparent').setup()

-- Diffview - git diff and merge
require('diffview').setup()

-- Leap - intuitive motions, spooky actions
local leap = require('leap')
leap.add_default_mappings()
leap.opts.safe_labels = {
    't', 'o', 'h', 'm', 'q', 'w', 'd', 'f', 'u', 'r', 'l', 'y', 'k', 'j',
    'T', 'O', 'H', 'M', 'Q', 'W', 'D', 'F', 'U', 'R', 'L', 'Y', 'K', 'J',
}
leap.opts.safe_labels = {
    't', 'o', 'h', 'm', 'q', 'w', 'd', 'f', 'u', 'r', 'l', 'y', 'k', 'j',
    'T', 'O', 'H', 'M', 'Q', 'W', 'D', 'F', 'U', 'R', 'L', 'Y', 'K', 'J',
    '\'', '\"', '/', '?',
    'z', 'x', 'c', 'v', 'b', 'p',
    'Z', 'X', 'C', 'V', 'B', 'P',
}
vim.api.nvim_set_hl(0, 'LeapLabelPrimary',   { bg = '#' .. theme.base0C, fg = '#' .. theme.base07 })
vim.api.nvim_set_hl(0, 'LeapLabelSecondary', { bg = '#' .. theme.base0E, fg = '#' .. theme.base07 })
-- This is a hack until nvim core fixes a bug.
vim.api.nvim_set_hl(0, 'Cursor', { reverse = true })

require('leap-spooky').setup({
    affixes = {
        remote   = { window = 'r', cross_window = 'R' },
        magnetic = { window = 'm', cross_window = 'M' },
    },
    paste_on_remote_yank = false,
})

-- Autopairs - basic bracket logic
require('nvim-autopairs').setup({
    fast_wrap = {
        -- Before       Input   After
        -----------------------------------
        -- (|foobar     <M-e>$  (|foobar)
        -- (|)(foobar)  <M-e>a  (|(foobar))
        map = '<M-e>', -- Launch fastwrap
        end_key = 'l', -- End of line
        keys = 'asetnioh', -- Home row keys for position markers
    },
    enable_check_bracket_line = false, -- Don't add pair if it already has close pair in same line.
    ignored_next_char = "[%w%.]", -- Don't add pair if next char is alphanumeric or '.'
})

-- Surround - advanced bracket logic
require('nvim-surround').setup({
    keymaps = {
        insert          = '<C-p>s',
        insert_line     = '<C-p>S',
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

-- Indent Blankline
require('indent_blankline').setup({
    show_current_context = true,
    show_current_context_start = true,
})

-- nvim-notify
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

local notify = require('notify')
notify.setup({
    render = 'compact',
    fps    = 30,
    stages = 'static', -- Others: fade, slide, static
    background_colour = '#000000',
})
-- Now make nvim use nvim-notify.
vim.notify = notify

-- Noice
require('noice').setup({
    lsp = {
        progress = { enabled = false },
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
vim.cmd('highlight NoiceCmdlinePopupBorder guifg=#' .. theme.base0C)
vim.cmd('highlight NoiceCmdlineIcon        guifg=#' .. theme.base07)

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
        component_separators = { left = '|', right = '|' },
        section_separators = { left = '', right = ''},
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = {
	    'branch',
	    {
		'diff',
		symbols = { added = ' ', modified = ' ', removed = ' ' },
	    },
	    {
		'diagnostics',
		-- symbols = { error = '⨻', warn = '⚠', info = '⯑', hint = '⦿'},
	    }
	},
        lualine_c = { 'filename' },
        lualine_x = {
            --[[{
                require('noice').api.status.message.get_hl,
                cond = require('noice').api.status.message.has,
            },--]]
            { -- Noice showcmd implementation
                require('noice').api.statusline.command.get,
                cond = require('noice').api.statusline.command.has,
                color = { fg = '#' .. theme.base07 },
            },
            'encoding',
            'fileformat',
            'filetype' },
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
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        ['<C-y>'] = cmp.config.disable,
        ['<C-c>'] = cmp.mapping({
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
        { name = 'neorg' },
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

require('lspconfig').ltex.setup({
    settings = {
        ltex = {
            language = 'en-US',
        },
    },
})

-- Setup language servers with default config.
local servers = {
    'rls',
    -- 'arduino_language_server',
    'bashls',
    'jsonls',
    'pylsp',
    -- 'yamlls',
    'vimls',
}
for _, lsp in pairs(servers) do
    require('lspconfig')[lsp].setup({
        capabilities = capabilities,
        flags = {
            debounce_text_changes = 150,
        }
    })
end

-- Nvim-Colorizer
require('colorizer').setup()
