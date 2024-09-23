
local gruvbox = require("gruvbox")
local colorscheme = "gruvbox"
local ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
vim.opt.background = "dark" -- or "light" for light mode
vim.g.gruvbox_italic=1
if not ok then
    vim.notify("colorscheme " .. colorscheme .. " not found!")
    return
end
vim.cmd("hi SpellBad cterm=undercurl ctermfg=DarkRed ctermbg=NONE")
vim.cmd("hi SpellBcd gui=undercurl guifg=DarkRed guibg=NONE")

vim.cmd("hi Search cterm=underline ctermfg=LightMagenta ctermbg=NONE")
vim.cmd("hi Search gui=underline guifg=LightMagenta guibg=NONE")
vim.cmd("hi IncSearch cterm=NONE ctermfg=White ctermbg=DarkMagenta")
vim.cmd("hi IncSearch gui=NONE guifg=White guibg=DarkMagenta")

-- vim.api.nvim_set_hl(0, "@function.call.cpp", { link = "Identifier" })
-- p.faded_blue
-- vim.cmd ('hi @function.cpp guifg=p.fadded_blue')
