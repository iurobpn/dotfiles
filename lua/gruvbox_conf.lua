--- GRUVBOX CONFIG -------------------------
local options = {
    -- ...others configs...
    termguicolors = true -- Enables 24-bit RGB color
}

p = require('gruvbox').pallete;

-- Default options:
require("gruvbox").setup({
    terminal_colors = true, -- add neovim terminal colors
    undercurl = true,
    underline = true,
    bold = true,
    italic = {
        strings = true,
        emphasis = true,
        comments = true,
        operators = false,
        folds = true,
    },
    strikethrough = true,
    invert_selection = false,
    invert_signs = false,
    invert_tabline = false,
    invert_intend_guides = false,
    inverse = true, -- invert background for search, diffs, statuslines and errors
    contrast = "", -- can be "hard", "soft" or empty string
    palette_overrides = {},
    overrides = {},
    dim_inactive = false,
    transparent_mode = false,
    -- overrides = {
    --     ["@function.cpp"] = { bg ="GruvboxBlue"},
    -- }
})

local colorscheme='gruvbox'
local ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
vim.opt.background = "dark" -- or "light" for light mode
vim.g.gruvbox_italic=1
if not ok then
    vim.notify("colorscheme " .. colorscheme .. " not found!")
    return
end
vim.cmd("hi Search cterm=underline ctermfg=LightMagenta ctermbg=NONE")
vim.cmd("hi IncSearch cterm=NONE ctermfg=White ctermbg=DarkMagenta")
vim.cmd("hi SpellBad cterm=underline ctermfg=DarkRed ctermbg=NONE")

-- vim.api.nvim_set_hl(0, "@function.call.cpp", { link = "Identifier" })
-- p.faded_blue
-- vim.cmd ('hi @function.cpp guifg=p.fadded_blue')

--- GRUVBOX CONFIG -------------------------