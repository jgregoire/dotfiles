-- Setup mason.nvim
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

-- Setup mason-lspconfig.nvim
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

-- Setup lspconfig
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require('lspconfig')

-- Configure Lua language server.
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

lspconfig.ltex.setup({
    settings = {
        ltex = {
            language = 'en-US',
        },
    },
})

lspconfig.arduino_language_server.setup({
    filetypes = { 'arduino', 'cpp' },
    cmd = {
        'arduino-language-server',
        '--cli-config',
        '~/.arduino15/arduino-cli.yaml',
        '--log',
        '--logpath',
        '/home/james/.arduino15/logs'
    }
})

-- Setup language servers with default config.
local servers = {
    'bashls',
    'clangd',
    'jsonls',
    'ltex',
    'openscad_lsp',
    'pyright',
    'rust_analyzer',
    'typos_lsp',
    'yamlls',
}
for _, server in pairs(servers) do
    if vim.fn.executable(server) == 1 then
        lspconfig[server].setup({
            capabilities = capabilities,
            flags = {
                debounce_text_changes = 150,
            }
        })
    end
end
