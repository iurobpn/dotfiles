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
