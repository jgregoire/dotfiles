local opts = {
    load = {
        -- Subset of core.defaults:
        ['core.esupports.hop'] = {},
        ['core.esupports.indent'] = {},
        ['core.esupports.metagen'] = {},
        ['core.itero'] = {},
        ['core.pivot'] = {},
        ['core.promo'] = {},
        ['core.qol.toc'] = {},
        ['core.qol.todo_items'] = {},
        ['core.keybinds'] = {
            config = {
                default_keybinds = true,
                neorg_leader = '<LocalLeader>',
            }
        },
        -- Non-defaults:
        ['core.concealer'] = {
            config = {
                folds = true,
                icons = {
                    todo = {
                        -- enabled = true,
                        done      = { icon = "" },
                        pending   = { icon = "⭘" },
                        undone    = { icon = "" },
                        uncertain = { icon = "" },
                        on_hold   = { icon = "" },
                        cancelled = { icon = "" },
                        recurring = { icon = "" },
                        urgent    = { icon = "" },
                    },
                },
            },
        },
        ['core.dirman'] = {
            config = {
                workspaces = {
                    notes = '~/neorg',
                },
            },
        },
        ['core.completion'] = {
            config = {
                engine = 'nvim-cmp',
                name = '[Neorg]',
            },
        },
        ['core.integrations.nvim-cmp'] = {},
        ['core.highlights'] = {},
    },
}

return opts
