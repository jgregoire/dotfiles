vim.notify('Entered lualine config file')
require('lualine').setup({
    options = {
        theme = 'auto',
        -- theme = 'gruvbox-material',
        component_separators = {
            left  = '│',
            right = '│'
        },
        section_separators = {
            left  = '',
            right = ''
        },
    },
    extensions = {
        'toggleterm',
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = {
            'branch',
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
        lualine_z = { 'location', },
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
    },
})
