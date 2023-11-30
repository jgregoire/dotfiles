-- Setup lspconfig lua server.
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require('lspconfig')

-- Configure Lua language server.
if vim.fn.executable('lua-language-server') == 1 then
    lspconfig.lua_ls.setup({
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
end

if vim.fn.executable('ltex-ls') == 1 then
    lspconfig.ltex.setup({
        settings = {
            ltex = {
                language = 'en-US',
            },
        },
    })
end

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
    lspconfig[lsp].setup({
        capabilities = capabilities,
        flags = {
            debounce_text_changes = 150,
        }
    })
end

