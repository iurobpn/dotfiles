require('dev')
vim.api.nvim_set_hl(0, "TabLine", { bg = dev.color.dark0, fg = dev.color.bright_green }) -- bright_red for text
vim.api.nvim_set_hl(0, "TabLineSel", { bg = dev.color.dark0, fg = dev.color.bright_orange }) -- bright_red for text
vim.api.nvim_set_hl(0, "TabLineFill", { bg = dev.color.dark0, fg = dev.color.light1 }) -- bright_red for text
vim.api.nvim_set_hl(0, "TabLineSeparator", { bg = dev.color.dark0, fg= dev.color.bright_red}) -- bright_red for text
vim.api.nvim_set_hl(0, "TabLineSelSeparator", { bg = dev.color.dark0, fg= dev.color.bright_red}) -- bright_red for text
vim.api.nvim_set_hl(0, "TabLineFillSeparator", { bg = dev.color.dark0, fg=dev.color.bright_red}) -- bright_red for text

local theme = {
    fill = 'TabLineFill',
    -- Also you can do this: fill = { fg='#f2e9de', bg='#907aa9', style='italic' }
    head = 'TabLine',
    current_tab = 'TabLineSel',
    tab = 'TabLine',
    win = 'TabLine',
    tail = 'TabLine',
}
vim.o.showtabline = 2
vim.opt.sessionoptions = 'curdir,folds,globals,help,tabpages,terminal,winsize'
require('tabby.tabline').set(function(line)
    return {
        {
             '  ', hl = theme.head ,
         --    line.sep('', theme.head, theme.fill),
        },
        line.tabs().foreach(function(tab)
            local hl = tab.is_current() and theme.current_tab or theme.tab
            return {
                line.sep('', hl, theme.fill),
                tab.is_current() and '' or '󰆣',
                tab.number(),
                tab.name(),
                tab.close_btn(''),
                line.sep('', hl, theme.fill),
                hl = hl,
                margin = ' ',
            }
        end),
        line.spacer(),
        line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
            return {
                line.sep('', theme.win, theme.fill),
                win.is_current() and '' or '',
                win.buf_name(),
                line.sep('', theme.win, theme.fill),
                hl = theme.win,
                margin = ' ',
            }
        end),
        {
            line.sep('', theme.tail, theme.fill),
            { '  ', hl = theme.tail },
        },
        hl = theme.fill,
    }
end)
    -- option = {}, -- setup modules' option,
