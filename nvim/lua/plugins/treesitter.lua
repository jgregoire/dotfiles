require('nvim-treesitter.configs').setup({
    ensure_installed = { 'lua', 'vim', 'vimdoc', 'query', 'c'},
    sync_install = false,
    auto_install = false,
    highlight = {
        enable = true,
        -- Also use vim built-in highlighting alongside TS for these languages
        additional_vim_regex_hightlighting = { 'neorg' },
    },
    -- Use TS for = indentation. Experimental.
    indent = {
        enable = true
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection    = '<leader>ns',
            node_incremental  = '<leader>is',
            node_decremental  = '<leader>id',
            scope_incremental = '<leader>si',
        },
    },
    endwise = {
        enable = true
    },
    textobjects = {
        select = {
            enable = true,
            lookahead = true,
            keymaps = {
                ['af'] = '@function.outer',
                ['if'] = '@function.inner',
                ['at'] = '@parameter.outer',
                ['it'] = '@parameter.inner',
                ['ic'] = '@call.inner',
            },
        },
    },
})

