return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
        dashboard = { 
            enabled = true,
            sections = {
                { section = "header" },
                {
                    pane=2,
                    title = "Reminders:\n",
                },
                -- {
                --     pane = 2,
                --     section = "terminal",
                --     cmd = "colorscript -e square",
                --     height = 5,
                --     padding = 1,
                -- },
                { section = "keys", gap = 1, padding = 1 },
                { pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
                { pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
                {
                    pane = 2,
                    icon = " ",
                    title = "Git Status",
                    section = "terminal",
                    enabled = function()
                        return Snacks.git.get_root() ~= nil
                    end,
                    cmd = "git status --short --branch --renames",
                    height = 5,
                    padding = 1,
                    ttl = 5 * 60,
                    indent = 3,
                },
                { section = "startup" },
            },
        },
        indent = { enabled = true },
        input = { enabled = false },
        notifier = { enabled = false },
        quickfile = { enabled = true },
        scroll = { enabled = false },
        statuscolumn = { enabled = false },
        words = { enabled = true },
        util = { enabled = true },
        dim={ enable = true },
        scope={ enable = true },
        animate={ enable = true },
        ---@class snacks.lazygit.Config: snacks.terminal.Opts
        ---@field args? string[]
        ---@field theme? snacks.lazygit.Theme
        lazygit = {
            enabled = true,
            -- automatically configure lazygit to use the current colorscheme
            -- and integrate edit with the current neovim instance
            configure = true,
            -- extra configuration for lazygit that will be merged with the default
            -- snacks does NOT have a full yaml parser, so if you need `"test"` to appear with the quotes
            -- you need to double quote it: `"\"test\""`
            config = {
                -- os = { editPreset = "nvim-remote" },
                gui = {
                    -- set to an empty string "" to disable icons
                    nerdFontsVersion = "3",
                },
            },
            theme_path = vim.fs.normalize(vim.fn.stdpath("cache") .. "/lazygit-theme.yml"),
            -- Theme for lazygit
            theme = {
                [241]                      = { fg = "Special" },
                activeBorderColor          = { fg = "MatchParen", bold = true },
                cherryPickedCommitBgColor  = { fg = "Identifier" },
                cherryPickedCommitFgColor  = { fg = "Function" },
                defaultFgColor             = { fg = "Normal" },
                inactiveBorderColor        = { fg = "FloatBorder" },
                optionsTextColor           = { fg = "Function" },
                searchingActiveBorderColor = { fg = "MatchParen", bold = true },
                selectedLineBgColor        = { bg = "Visual" }, -- set to `default` to have no background colour
                unstagedChangesColor       = { fg = "DiagnosticError" },
            },
            win = {
                style = "lazygit",
            },
        },
    },
    keys = {
        -- { "<leader>z",  function() Snacks.zen() end, desc = "Toggle Zen Mode" },
        -- { "<leader>Z",  function() Snacks.zen.zoom() end, desc = "Toggle Zoom" },
        -- { "<leader>.",  function() Snacks.scratch() end, desc = "Toggle Scratch Buffer" },
        -- { "<leader>S",  function() Snacks.scratch.select() end, desc = "Select Scratch Buffer" },
        -- { "<leader>n",  function() Snacks.notifier.show_history() end, desc = "Notification History" },
        -- { "<leader>bd", function() Snacks.bufdelete() end, desc = "Delete Buffer" },
        -- { "<leader>cR", function() Snacks.rename.rename_file() end, desc = "Rename File" },
        -- { "<leader>gB", function() Snacks.gitbrowse() end, desc = "Git Browse" },
        -- { "<leader>gb", function() Snacks.git.blame_line() end, desc = "Git Blame Line" },
        -- { "<leader>gf", function() Snacks.lazygit.log_file() end, desc = "Lazygit Current File History" },
        { "<leader>gg", function() Snacks.lazygit() end, desc = "Lazygit" },
        { "<leader>gl", function() Snacks.lazygit.log() end, desc = "Lazygit Log (cwd)" },
        -- { "<leader>un", function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications" },
        -- { "<c-/>",      function() Snacks.terminal() end, desc = "Toggle Terminal" },
        -- { "<c-_>",      function() Snacks.terminal() end, desc = "which_key_ignore" },
        -- { "]]",         function() Snacks.words.jump(vim.v.count1) end, desc = "Next Reference", mode = { "n", "t" } },
        -- { "[[",         function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference", mode = { "n", "t" } },
        {
            "<leader>N",
            desc = "Neovim News",
            function()
                Snacks.win({
                    file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
                    width = 0.6,
                    height = 0.6,
                    wo = {
                        spell = false,
                        wrap = false,
                        signcolumn = "yes",
                        statuscolumn = " ",
                        conceallevel = 3,
                    },
                })
            end,
        }
    },
}
