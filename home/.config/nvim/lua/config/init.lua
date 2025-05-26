require'config.luarocks'
require'config.settings'

require'config.lazy'
-- require'config.cmake_tools'
-- require'config.overseer'
require'config.gutentags'
require'config.nvim-treesitter'
-- require'config.nvim-treesitter-textobjects'
-- require'config.various-textobjs'

require'config.toggle-term'


require'config.fzf-lua'


require'config.lazygit'
_G.dev = require'dev'

require'config.cpp'
-- require'config.minifiles'
require'config.harpoon'
require'config.copilot'
require'config.coc'
require'utils.time'
require'config.vimtex'
require'config.plugins'

-- require'config.airline'
require'config.snacks'
require'config.spelunk'

require"config.various-textobjs"

require"config.gruvbox"

if vim.g.debug_dev then
        tasks_dir = os.geenv("HOME") .. "/git/my/home/dev/tasks.nvim"
        vim.cmd("set rtp+=" .. tasks_dir)
        vim.cmd("set rtp+=" .. tasks_dir .. "/lua")
        package.path = tasks_dir .. "/lua/?/init.lua" ..
                       ";" .. tasks_dir .. "/lua/?/?.lua" ..
                        ";" .. package.path
end

-- local colors = vim.g.gruvbox_palette
-- vim.api.nvim_set_hl(0, "MarkviewCheckboxUnchecked", { fg = colors.light1 })
-- vim.api.nvim_set_hl(0, "MarkviewPalette1Fg", { fg = colors.light4 })

local function open_daily_template()
    local home = os.getenv("HOME")
    local dir = os.getenv("HOME") .. "/git/my/home/pkm/daily"
    local fname = os.date("%Y-%m-%d") .. ".md"
    --check if fname exists in dir
    local full_path = dir .. "/" .. fname
    
    if not require'utils.fs'.file_exists(full_path) then
        local tmpl_dir =  home .. "/git/my/home/dotfiles/home/.config/nvim/templates"
        vim.fn.mkdir(dir, "p")
        vim.cmd('edit ' .. full_path)

        vim.cmd('TemplIns ' .. tmpl_dir .. '/daily.tpl')
        vim.cmd('write')
    else
        vim.cmd('edit ' .. full_path)
    end
end
vim.api.nvim_create_user_command("Daily", open_daily_template, { desc = "Open daily template" })
