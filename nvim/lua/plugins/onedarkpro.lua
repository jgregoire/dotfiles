require('onedarkpro').setup({
    styles = {
        comments = 'italic',
    },
    plugins = {
        all = false,
        diffview = true,
--        flash_nvim = true,
        gitsigns = true,
        indentline = true,
        lsp_semantic_tokens = true,
        nvim_cmp = true,
        nvim_lsp = true,
        telescope = true,
        toggleterm = true,
        treesitter = true,
    },
    options = {
        transparency = true,
        cursorline = true,
        highlight_inactive_windows = true,
    },
    colors = {
        --cursorline = '#000000' -- Set this if the default choice sucks.
    }
})
--require('rocks-config').configure('onedarkpro')
vim.cmd.packadd('onedarkpro')
vim.cmd.colorscheme('onedark_vivid')
