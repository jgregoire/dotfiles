local opts = {
    load = {
        -- Subset of core.defaults:
        ['core.esupports.hop'] = {},
        ['core.esupports.indent'] = {
            config = {
                format_on_enter = true, -- When true, reformat line on <CR>
                format_on_escape = true, -- When true, reformat line on <ESC>
            }
        },
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
                icon_preset = 'diamond', -- 'basic', 'diamond', or 'mixed'
                folds = false,
                icons = {
                    heading = {
                        icons = { '◆', '❖', '◈', '◇', '⟡', '⋄' },
                    },
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
                    notes = '~/Notes',
                },
            },
        },
        ['core.completion'] = {
            config = {
                engine = {
                    module_name = 'external.lsp-completion'
                },
                -- name = '[Neorg]',
            },
        },
        ['core.integrations.nvim-cmp'] = {},
        ['core.highlights'] = {},
        ['core.tangle'] = {},
        ['external.conceal-wrap'] = {},
        ['external.interim-ls'] = {
            config = {
                completion_provider = {
                    enable = true,
                    documentation = true,
                    categories = false,
                    people = {
                        enable = false,
                        path = "people",
                    },
                },
            },
        },
        ['external.query'] = {
            index_on_launch = true,
            update_on_change = true,
        },
    },
}

return opts
