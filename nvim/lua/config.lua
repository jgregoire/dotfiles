
-- N.B. I use the Norman keyboard layout on an ErgoDox keyboard.
-- I have remapped almost everything, sometimes in surprising ways.
-- If you want to use my config as a QWERTY user, consider replacing
--   mappings, keys, labels, etc. with defaults, THEN customizing.

-- OneDark Pro
require('onedarkpro').setup({
    styles = {
        comments = 'italic',
    },
    plugins = {
        all = false,
        barbar = true,
        diffview = true,
        indentline = true,
        gitsigns = true,
        flash_nvim = true,
        nvim_cmp = true,
        nvim_lsp = true,
        nvim_notify = true,
        packer = true,
        telescope = true,
        toggleterm = true,
        treesitter = true,
    }
})
vim.cmd('colorscheme onedark_vivid')

-- Extend increment/decrement
require('boole').setup({
    mappings = {
        increment = '<C-Up>',
        decrement = '<C-Down>',
    },
})

-- Smooth scrolling
require('neoscroll').setup()

-- Transparency support
require('transparent').setup()

-- Diffview - git diff and merge
require('diffview').setup()

require('flash').setup({
    labels = 'asetniohqwdfurlgykjzxcvmbp',
    label = {
        -- Show jump label before the target, not after.
        after = false,
        before = true,
    }
})

-- Autopairs - basic bracket logic
require('nvim-autopairs').setup({
    fast_wrap = {
        -- Before       Input   After
        -- ---------------------------------
        -- (|foobar     <M-e>l  (|foobar)
        -- (|)(foobar)  <M-e>a  (|(foobar))
        map = '<C-w>', -- Launch fastwrap
        chars = { '{', '[', '(', '"', "'", '<' },
        end_key = 'w', -- End of line
        keys = 'asetnioh', -- Home row keys for position markers
    },
    enable_check_bracket_line = false, -- Don't add pair if it already has close pair in same line.
    enable_bracket_in_quote = false, -- Don't add a pair inside quotes.
    -- ignored_next_char = "[%w%.]", -- Don't add pair if next char is alphanumeric or '.'
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

-- Smarter tab button
require('smart-tab').setup({
    skips = { 'string_content' },
    mapping = '<Tab>',
})

-- nvim-comment
require('nvim_comment').setup({
    marker_padding = true, -- Add a space.
    comment_empty = true,
    comment_empty_trim_whitespace = true,
    create_mappings = true,
    line_mapping = 'pcc', -- Normal mode, toggle line comment.
    operator_mapping = 'pc', -- Visual/operator mode
    comment_chunk_text_object = 'ic', -- No idea what this is for
})

-- Indent Blankline
require('ibl').setup({
    enabled = true,
    indent = { char = '▏' },
    scope = {
        enabled = true,
        show_start = true,
    }
    -- include = {} -- Additional nodes to include in scope.
})

-- nvim-notify
local notify = require('notify')
notify.setup({
    render = 'compact',
    fps    = 30,
    stages = 'static', -- Others: fade, slide, static
})

-- Noice
require('noice').setup({
    lsp = {
        progress = { enabled = true },
        override = {
            ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
            ['vim.lsp.util.stylize_markdown'] = true,
            ['cmp.entry.get_documentation'] = true,
        },
    },
    presets = {
        bottom_search = true, -- use a classic bottom cmdline for search
        command_palette = true, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = true, -- add a border to hover docs and signature help
    },
    views = {
        cmdline_popup = {
            position = {
                row = -2,
                col = '50%',
            },
        },
        cmdline_popupmenu = {
            position = {
                row = -5,
                col = '50%',
            },
        },
    },
    routes = {
        { -- Disable mini popup (lsp_progress) in insert mode. Less distracting.
            view = 'mini',
            filter = { mode = 'i' },
            opts = { skip = true },
        },
    },
})

-- Use Noice with Telescope
require('telescope').load_extension('noice')

-- Barbar (tabbing)
require('bufferline').setup({
    auto_hide = true,
    clickable = true, -- Left click: Select. Middle click: Close.
    icons = {
        buffer_index = true,
        filetype = { enabled = true },
    },
})

-- Lualine
require('lualine').setup({
    options = {
        theme = 'auto',
        component_separators = { left = '│', right = '│' },
        section_separators = { left = '', right = ''},
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = {
            'branch',
            {
                'diff',
                symbols = { added = ' ', modified = ' ', removed = ' ' },
            },
            'diagnostics',
        },
        lualine_c = { 'filename' },
        lualine_x = {
            { -- Noice showcmd implementation
                require('noice').api.statusline.command.get,
                cond = require('noice').api.statusline.command.has,
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
        change       = { text = '' },
        delete       = { text = '' },
        topdelete    = { text = '‾' },
        changedelete = { text = '' },
        untracked    = { text = '┆' },

    },
})
-- Toggleterm
require('toggleterm').setup({
    open_mapping = '<C-t>',
    autochdir = true,
    float_opts = {
        border = 'curved',
        width = 120,
        height = 40,
    },
})

-- Setup nvim-cmp.
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
local luasnip = require('luasnip')
local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line-1, line, true)[1]:sub(col, col):match("%s") == nil
end

---@diagnostic disable-next-line:redundant-parameter
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
            --elseif has_words_before() then -- use <C-Tab> instead
            --    cmp.complete()
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
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, { 'i', 's' }),
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
        { name = 'luasnip' },
        { name = 'neorg' },
        { name = 'calc' },
    }, {
        { name = 'buffer' },
    }),
    enabled = function() -- Disable autocomplete in comments.
        local context = require'cmp.config.context'
        if vim.api.nvim_get_mode().mode == 'c' then
            return false -- Default is true, but this conflicts with Noice.
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
-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
    }
})
-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        { name = 'cmdline' }
    })
})

-- cmp autopairs support
local handlers = require('nvim-autopairs.completion.handlers')
cmp.event:on(
    'confirm_done',
    cmp_autopairs.on_confirm_done({
        map_char = { tex = '' },
        filetypes = {
            ['*'] = {
                ['('] = {
                    kind = {
                        cmp.lsp.CompletionItemKind.Function,
                        cmp.lsp.CompletionItemKind.Method,
                    },
                    handler = handlers['*']
                }
            }
        }
    })
)

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
    'rust_analyzer',
    -- 'arduino_language_server',
    'bashls',
    'jsonls',
    'pylsp',
    'yamlls',
    'vimls',
    'openscad_ls',
    'dotls',
    'clangd',
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
