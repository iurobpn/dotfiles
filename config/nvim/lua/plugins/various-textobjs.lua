-- lazy.nvim
return {
    "chrisgrieser/nvim-various-textobjs",
    event = "VeryLazy",
    opts = {
        keymaps = {
            useDefaults = true
        }
    },
    config = function ()
        -- example: `U` for url textobj
        vim.keymap.set({ "o", "x" }, "U", '<cmd>lua require("various-textobjs").url()<CR>')

        -- example: `as` for outer subword, `is` for inner subword
        vim.keymap.set({ "o", "x" }, "as", '<cmd>lua require("various-textobjs").subword("outer")<CR>')
        vim.keymap.set({ "o", "x" }, "is", '<cmd>lua require("various-textobjs").subword("inner")<CR>')
        -- THE INDENTATION TEXTOBJ requires two parameters, the first for
        -- exclusion of the starting border, the second for the exclusion of ending border
        vim.keymap.set(
            { "o", "x" },
            "ii",
            '<cmd>lua require("various-textobjs").indentation("inner", "inner")<CR>'
        )
        vim.keymap.set(
            { "o", "x" },
            "ai",
            '<cmd>lua require("various-textobjs").indentation("outer", "inner")<CR>'
        )

        -- an additional parameter can be passed to control whether blank lines are included
        vim.keymap.set(
            { "o", "x" },
            "ai",
            '<cmd>lua require("various-textobjs").indentation("outer", "inner", "noBlanks")<CR>'
        )
    end
}
