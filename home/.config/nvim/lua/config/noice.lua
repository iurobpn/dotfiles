require("noice").setup({
    cmdline = {
        format = {
            cmdline = { icon = ":" },
            search_down = { icon = "/" },
            search_up = { icon = "?" },
            filter = { icon = "$" },
            lua = { icon = "☾" },
            help = { icon = "?" },
        },
    },
    -- lsp = {
    --     -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
    --     override = {
    --         ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
    --         ["vim.lsp.util.stylize_markdown"] = true,
    --         ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
    --     },
    -- },
    -- cmdline = {
        -- enabled = true, -- enables the Noice cmdline UI
        -- view = "cmdline", -- view for rendering the cmdline. Change to `cmdline` to get a classic cmdline at the bottom
    -- },
        -- opts = {}, -- global options for the cmdline. See section on views
        ---@type table<string, CmdlineFormat>
        -- format = {
            -- conceal: (default=true) This will hide the text in the cmdline that matches the pattern.
         --    view = {
         --        cmdline_popup = "cmdline",    
         --    },
            -- opts: any options passed to the view
            -- icon_hl_group: optional hl_group for the icon
            -- title: set to anything or empty string to hide
         --    cmdline = { pattern = "^:", icon = ":", lang = "vim" },
         --    search_down = false, --{ kind = "search", pattern = "^/", icon = " /", lang = "regex" },
         --    search_up = false, --{ kind = "search", pattern = "^%?", icon = " ?", lang = "regex" },
         --    filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
         --    lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "", lang = "lua" },
         --    help = { pattern = "^:%s*he?l?p?%s+", icon = "" },
         --    input = { view = "cmdline_input", icon = "󰥻 " }, -- Used by input()
            -- lua = false, -- to disable a format, set to `false`
        -- },
    -- },    -- you can enable a preset for easier configuration
    -- views = {
    --     cmdline = {
    --         border = {
    --             style = "none",
    --             border = "none",
    --      --        padding = { 0, 0 },
    --         },
    --     },
    -- },
})
