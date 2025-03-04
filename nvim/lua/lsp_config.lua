-- Setup lspconfig lua server.
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
    -- 'typos_lsp',
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

vim.api.nvim_create_autocmd(
    "LspAttach",
    {
        callback = function (args)
            local bufnr = args.buf
            local client = vim.lsp.get_client_by_id(args.data.client_id)
            if not client then return end

            if client.server_capabilities.completionProvider then
                vim.bo[bufnr].omnifunc = 'v:lua.vim.lsp.omnifunc'
            end

            local opts = { noremap = true, silent = true, buffer = bufnr }
            vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
            vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        end
    }
)
