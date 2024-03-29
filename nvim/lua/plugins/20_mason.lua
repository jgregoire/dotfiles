require('mason').setup({
    ui = {
        border = 'rounded',
        icons = {
            package_installed = "✔",
            package_pending = "",
            package_uninstalled = "",
        }
    }
})

require('mason-lspconfig').setup({
    ensure_installed = {
        'arduino_language_server',
        'bashls',
        'clangd',
        'jsonls',
        'ltex',
        'lua_ls',
        'openscad_lsp',
        'pyright',
        'rust_analyzer',
        'typos_lsp',
        'yamlls',
    },
})
