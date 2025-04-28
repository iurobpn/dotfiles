

-- local gruvbox = require("gruvbox")
-- local palette = gruvbox.palette
--[[
gruvbox.setup({
    overrides = {
        ["texCmd"] = { fg = palette.bright_green},
        ["texCmdEnv"] = { fg = palette.bright_orange},
        ["SpellBad"] = { fg = palette.bright_red, undercurl = true, underline = false},
        ["SpellCap"] = { fg = palette.bright_red, undercurl = true, underline = false},
        ["SpellRare"] = { fg = palette.bright_yellow, undercurl = true, underline = false},
        ["SpellLocal"] = { fg = palette.bright_orange, undercurl = true, underline = false},
        ["NormalFloat"] = { fg = palette.light2, bg = palette.dark0_hard }, -- bright_red for text
        ["FloatTitle"] = { fg = palette.light0, bg = palette.dark0_hard, bold = true }, -- bright_red for text
        ["FloatBorder"] = { fg = palette.light4, bg = palette.dark0_hard }, -- bright_red for text
        ["Normal"] = { bg = palette.dark0_hard }, -- bright_red for text
        ["SignColumn"] = { bg = palette.dark0 }, -- bright_red for text
        -- ["Search"] = { fg = palette.light0, bg = palette.bright_red },
        -- ["IncSearch"] = { fg = palette.light0, bg = palette.bright_red },
    },
})
--]]

vim.g.gruvbox_contrast_dark = "hard" -- "soft", "medium", "hard"
vim.opt.termguicolors = true
vim.opt.background = "dark" -- or "light" for light mode
vim.g.gruvbox_italic=1

vim.cmd("hi SpellBad cterm=undercurl ctermfg=DarkRed ctermbg=NONE")
vim.cmd("hi SpellBcd gui=undercurl guifg=DarkRed guibg=NONE")

vim.cmd("hi Search cterm=underline ctermfg=LightMagenta ctermbg=NONE")
vim.cmd("hi Search gui=underline guifg=LightMagenta guibg=NONE")
vim.cmd("hi IncSearch cterm=NONE ctermfg=White ctermbg=DarkMagenta")
vim.cmd("hi IncSearch gui=NONE guifg=White guibg=DarkMagenta")

-- vim.api.nvim_set_hl(0, "@function.call.cpp", { link = "Identifier" })
-- p.faded_blue
-- vim.cmd ('hi @function.cpp guifg=p.fadded_blue')

-- set color scheme
vim.cmd.colorscheme("gruvbox")
-- local arg = "colorscheme " .. colorscheme
-- local ok, _ = pcall(vim.cmd, arg)
vim.g.gruvbox_improved_strings=1
vim.g.gruvbox_improved_warnings=1
local palette = vim.g.gruvbox_palette
vim.api.nvim_set_hl(0, "NormalFloat", { fg = palette.light2, bg = palette.dark0_hard })
vim.api.nvim_set_hl(0, "FloatTitle", { fg = palette.light0, bg = palette.dark0_hard, bold = true })
vim.api.nvim_set_hl(0, "FloatBorder", { fg = palette.light4, bg = palette.dark0_hard })

vim.api.nvim_set_hl(0, "@module.cpp", { fg = palette.bright_yellow })
vim.api.nvim_set_hl(0, "@type.builtin.cpp", { fg = palette.bright_red })
vim.api.nvim_set_hl(0, "@function.builtin.cpp", { fg = palette.bright_red })
vim.api.nvim_set_hl(0, "@constructor.cpp", { fg = palette.bright_green, bold = true })
vim.api.nvim_set_hl(0, "@variable.cpp", { fg = palette.bright_blue})
vim.api.nvim_set_hl(0, "@function.call.cpp", { fg = palette.light0})
vim.api.nvim_set_hl(0, "@function.method.call.cpp", { fg = palette.light1})
vim.api.nvim_set_hl(0, "@function.method.cpp", { fg = palette.bright_yellow})
vim.api.nvim_set_hl(0, "@attribute.cpp", { fg = palette.light2})
vim.api.nvim_set_hl(0, "@boolean.cpp", { fg = palette.bright_red})
vim.api.nvim_set_hl(0, "@operator.cpp", { fg = palette.light1})
vim.api.nvim_set_hl(0, "@constant.builtin.cpp", { fg = palette.bright_red})
vim.api.nvim_set_hl(0, "@punctuation.delimiter.cpp", { fg = palette.light0})
vim.api.nvim_set_hl(0, "@module.latex", { fg = palette.bright_orange})
vim.api.nvim_set_hl(0, "texCmd", { fg = palette.bright_green})
vim.api.nvim_set_hl(0, "texCmdEnv", { fg = palette.bright_orange})
vim.api.nvim_set_hl(0, "SpellBad", { fg = palette.bright_red, undercurl = true, underline = false})
vim.api.nvim_set_hl(0, "SpellCap", { fg = palette.bright_red, undercurl = true, underline = false})
vim.api.nvim_set_hl(0, "SpellRare", { fg = palette.bright_yellow, undercurl = true, underline = false})
vim.api.nvim_set_hl(0, "SpellLocal", { fg = palette.bright_orange, undercurl = true, underline = false})
vim.api.nvim_set_hl(0, "NormalFloat", { fg = palette.light2, bg = palette.dark0_hard }) -- bright_red for text
vim.api.nvim_set_hl(0, "FloatTitle", { fg = palette.light0, bg = palette.dark0_hard, bold = true }) -- bright_red for text
vim.api.nvim_set_hl(0, "FloatBorder", { fg = palette.light4, bg = palette.dark0_hard }) -- bright_red for text
vim.api.nvim_set_hl(0, "Normal", { bg = palette.dark0_hard }) -- bright_red for text
vim.api.nvim_set_hl(0, "SignColumn", { bg = palette.dark0 }) -- bright_red for text
vim.api.nvim_set_hl(0, "SnacksDashboardDesc", { fg = palette.bright_blue  })
-- vim.api.nvim_set_hl(0, "SnacksDashboardSpecial", { fg = palette.neutral_red  })
-- vim.api.nvim_set_hl(0, "SnacksDashboardNormal", { fg = palette.neutral_red  })
vim.api.nvim_set_hl(0, "SnacksDashboardHeader", { fg = palette.neutral_blue })
vim.api.nvim_set_hl(0, "SnacksDashboardTitle", { fg = palette.neutral_blue  })
vim.api.nvim_set_hl(0, "SnacksDashboardFile", { fg = palette.bright_blue  })
vim.api.nvim_set_hl(0, "SnacksDashboardKey", { fg = palette.bright_green  })
-- vim.api.nvim_set_hl(0, "SnacksDashboardDir", { fg = palette.neutral_blue  })
vim.api.nvim_set_hl(0, "SnacksDashboardIcon", { fg = palette.bright_green  })
vim.api.nvim_set_hl(0, "SnacksDashboardFooter", { fg = palette.bright_blue  })
vim.api.nvim_set_hl(0, "SnacksDashboardTerminal", { fg = palette.dark4  })

