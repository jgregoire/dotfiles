local opts = {
    options = {
        -- theme = require('neofission.lualine'),
        -- theme = 'eldritch',
        theme = 'nordic',
        component_separators = {
            left  = '│',
            right = '│'
        },
        section_separators = {
            -- left  = '',
            -- right = ''
            -- right = '',
            -- left = '',
            left = '',
            right = '',
        },
    },
    extensions = {
        'toggleterm',
    },
    sections = {
        lualine_a = {
            {
                'mode',
                -- separator = {
                --     left = '',
                --     right = '',
                -- },
            },
        },
        lualine_b = {
            {
                'branch',
                -- separator = {
                --     left = '',
                --     right = '',
                -- },
                draw_empty = true,
            },
            {
                'diff',
                symbols = {
                    added    = ' ',
                    modified = ' ',
                    removed  = ' ',
                },
            },
            {
                'diagnostics',
                symbols = {
                    error = ' ',
                    warn  = ' ',
                    info  = ' ',
                    hint  = ' ',
                },
            },
        },
        lualine_c = {
            {
                'buffers',
                mode = 2, -- show name and index
                symbols = {
                    modified = ' '
                },
            },
        },
        lualine_x = {
            'encoding',
            'fileformat',
            'filetype' },
        lualine_y = { 'progress', },
        lualine_z = {
            {
                'location',
                -- separator = {
                --     left = '',
                --     right = '',
                -- },
            },
        },
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
    },
}
return opts
