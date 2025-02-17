-- default config
require("various-textobjs").setup {
    keymaps = {
        -- See overview table in README for the defaults. (Note that lazy-loading
        -- this plugin, the default keymaps cannot be set up. if you set this to
        -- `true`, you thus need to add `lazy = false` to your lazy.nvim config.)
        useDefaults = true,

        -- disable only some default keymaps, for example { "ai", "!" }
        -- (only relevant when you set `useDefaults = true`)
        ---@type string[]
        disabledDefaults = {
            -- "R",
            -- "r",
        },
    },

    -- Number of lines to seek forwards for a text object. See the overview table
    -- in the README for which text object uses which value.
    forwardLooking = {
        small = 5,
        big = 15,
    },
    behavior = {
        -- save position in jumplist when using text objects
        jumplist = true, 
    },

    -- extra configuration for specific text objects
    textobjs = {
        indentation = {
            -- `false`: only indentation decreases delimit the text object
            -- `true`: indentation decreases as well as blank lines delimit the text object
            blanksAreDelimiter = false,
        },
        subword = {
            -- When deleting the start of a camelCased word, the result should
            -- still be camelCased and not PascalCased (see #113).
            noCamelToPascalCase = true,
        },
        diagnostic = {
            wrap = true,
        },
    },

    notify = {
        icon = "󰠱", -- only used with notification plugins like `nvim-notify`
        whenObjectNotFound = true,
    },

    -- show debugging messages on use of certain text objects
    debug = false,
}

-- vim.keymap.set({ "o", "x" }, "r", '<cmd>lua require("various-textobjs").restOfIdentation()<CR>')

-- example: `U` for url textobj
-- vim.keymap.set({ "o", "x" }, "U", '<cmd>lua require("various-textobjs").url()<CR>')

-- example: `as` for outer subword, `is` for inner subword
-- vim.keymap.set({ "o", "x" }, "as", '<cmd>lua require("various-textobjs").subword("outer")<CR>')
-- vim.keymap.set({ "o", "x" }, "is", '<cmd>lua require("various-textobjs").subword("inner")<CR>')
-- THE INDENTATION TEXTOBJ requires two parameters, the first for
-- exclusion of the starting border, the second for the exclusion of ending border
-- vim.keymap.set(
-- { "o", "x" },
-- "ii",
-- '<cmd>lua require("various-textobjs").indentation("inner", "inner", "noBlanks")<CR>'
-- )
-- vim.keymap.set(
-- { "o", "x" },
-- "ai",
-- '<cmd>lua require("various-textobjs").indentation("outer", "outer")<CR>'
-- )

-- an additional parameter can be passed to control whether blank lines are included
-- vim.keymap.set(
--     { "o", "x" },
--     "ai",
--     '<cmd>lua require("various-textobjs").indentation("outer", "outer", "noBlanks")<CR>'
-- )
-- vim.keymap.set("n", "gx", function()
--     require("various-textobjs").url()
--     local foundURL = vim.fn.mode() == "v"
--     if foundURL then
--         vim.cmd.normal('"zy')
--         local url = vim.fn.getreg("z")
--         vim.ui.open(url) -- requires nvim 0.10
--         return
--     end
--
--     -- find all URLs in buffer
--     local urlPattern = [[%l%l%l-://[^%s)"'`]+]]
--     local bufText = table.concat(vim.api.nvim_buf_get_lines(0, 0, -1, false), "\n")
--     local urls = {}
--     for url in bufText:gmatch(urlPattern) do
--         table.insert(urls, url)
--     end
--     if #urls == 0 then return end
--
--     -- select one
--     vim.ui.select(urls, { prompt = "Select URL:" }, function(choice)
--         if not choice then return end
--         vim.ui.open(url) -- requires nvim 0.10
--     end)
-- end, { desc = "URL Opener" })
vim.api.nvim_del_keymap('x', 'r')
vim.api.nvim_del_keymap('o', 'io')
vim.api.nvim_del_keymap('o', 'ao')
vim.keymap.set({ "x" }, "l", '<cmd>lua require("various-textobjs").restOfParagraph()<CR>')

vim.keymap.set("n", "ysii", function()
    local startPos = vim.api.nvim_win_get_cursor(0)

    -- identify start- and end-border
    require("various-textobjs").indentation("outer", "outer")
    local indentationFound = vim.fn.mode():find("V")
    if not indentationFound then return end
    vim.cmd.normal { "V", bang = true } -- leave visual mode so the '< '> marks are set

    -- copy them into the + register
    local startLn = vim.api.nvim_buf_get_mark(0, "<")[1] - 1
    local endLn = vim.api.nvim_buf_get_mark(0, ">")[1] - 1
    local startLine = vim.api.nvim_buf_get_lines(0, startLn, startLn + 1, false)[1]
    local endLine = vim.api.nvim_buf_get_lines(0, endLn, endLn + 1, false)[1]
    vim.fn.setreg("+", startLine .. "\n" .. endLine .. "\n")

    -- highlight yanked text
    local ns = vim.api.nvim_create_namespace("ysi")
    vim.api.nvim_buf_add_highlight(0, ns, "IncSearch", startLn, 0, -1)
    vim.api.nvim_buf_add_highlight(0, ns, "IncSearch", endLn, 0, -1)
    vim.defer_fn(function() vim.api.nvim_buf_clear_namespace(0, ns, 0, -1) end, 1000)

    -- restore cursor position
    vim.api.nvim_win_set_cursor(0, startPos)
end, { desc = "Yank surrounding indentation" })

vim.keymap.set("n", "dsi", function()
    -- select outer indentation
    require("various-textobjs").indentation("outer", "outer")

    -- plugin only switches to visual mode when a textobj has been found
    local indentationFound = vim.fn.mode():find("V")
    if not indentationFound then return end

    -- dedent indentation
    vim.cmd.normal { "<", bang = true }

    -- delete surrounding lines
    local endBorderLn = vim.api.nvim_buf_get_mark(0, ">")[1]
    local startBorderLn = vim.api.nvim_buf_get_mark(0, "<")[1]
    vim.cmd(tostring(endBorderLn) .. " delete") -- delete end first so line index is not shifted
    vim.cmd(tostring(startBorderLn) .. " delete")
end, { desc = "Delete Surrounding Indentation" })
