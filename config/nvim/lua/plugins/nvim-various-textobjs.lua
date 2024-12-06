-- lazy.nvim
return {
    "chrisgrieser/nvim-various-textobjs",
    event = "UIEnter",
    opts = { useDefaultKeymaps = true },
    -- restOfIndentation = "/",
    ---@type string[]
    -- disabledKeymaps = {"R", "L"}, -- disable only some default keymaps, e.g. { "ai", "ii" }
--     oneMaps = {
--         nearEoL = "n", -- does override the builtin "to next search match" textobj, but nobody really uses that
--         visibleInWindow = "gw",
--         toNextClosingBracket = "C", -- % has a race condition with vim's builtin matchit plugin
--         toNextQuotationMark = "Q",
--         restOfParagraph = "r",
--         restOfIndentation = "/",
--         restOfWindow = "gW",
--         diagnostic = "!",
--         column = "|",
--         entireBuffer = "gG", -- G + gg
--         url = "L", -- gu, gU, and U would conflict with gugu, gUgU, and gUU. u would conflict with gcu (undo comment)
--         lastChange = "g;", -- consistent with g; movement
--     }
}
