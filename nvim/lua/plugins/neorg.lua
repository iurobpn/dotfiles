return {
    "nvim-neorg/neorg",
    lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
    version = "*", -- Pin Neorg to the latest stable release
    config = function()
        require("neorg").setup {
            load = {
                ["core.defaults"] = {},
                ["core.concealer"] = {},
                ['core.ui.calendar'] = {},
                ["core.dirman"] = {
                    config = {
                        workspaces = {
                            notes = "/home/gagarin/sync/norg",
                        },
                        default_workspace = "notes",
                        index = "index.norg", -- The name of the main (root) .norg file
                    },
                },
                ["core.qol.todo_items"] = {
                    config = {
                        create_todo_items = true,
                        create_todo_parents = true,
                    },
                },
            },
        }

        -- vim.wo.foldlevel = 99
        vim.wo.conceallevel = 2
    end,
}
