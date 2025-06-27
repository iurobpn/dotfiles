-- lazy_conf.lua
-- ~/git/dotfiles/lua/config/lazy.lua
-- vim.notify = require("notify")
local config_dir = vim.fn.stdpath("config") .. "/lua/config/"
vim.g.vimspector_enable_mappings='HUMAN'
-- local sfile = debug.getinfo(1, 'S').source:sub(2)
-- local handle = io.popen("dirname " ..sfile)
-- local spath = handle:read("*a")
-- handle:close()
--  mappings
vim.cmd("source " .. config_dir .. "keymaps.vim")

-- remove trailing spaces on a line
vim.api.nvim_set_keymap('n', 'çl', '<cmd>s/[ \t]*$//<CR>', { noremap = true, silent = true })

function trim_all()
    vim.cmd([[
    let @+="o
    normal mo
    %s/[ \t]*$//
    normal `o
    let @o="+
    ]])
end

vim.api.nvim_set_keymap('n', 'ça', '<cmd>lua trim_all()<cr>', { noremap = true, silent = true })
-- nmap <leader>el :s/[ \\t]\+$//<CR>
-- nnoremap <F7>  :make<CR>
-- inoremap <F7>  <C-O><F7>
-- nmap <silent> <ESC> :noh<CR>

vim.api.nvim_set_keymap('n', '<LocalLeader>h', ':lua help_cword()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('', '<LocalLeader>d', '<cmd>lua insert_date()<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<esc>',      '<cmd>lua toggle_searchhl()<CR>',     { noremap = false, silent = true })
vim.api.nvim_set_keymap('n', ']c',      ':cnext<CR>',     { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '[c',      ':cprev<CR>',     { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', ']o',      ':copen<CR>',     { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '[o',      ':cclose<CR>',     { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<S-Down>", ":wincmd j<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<S-Up>", ":wincmd k<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<S-Left>", ":wincmd h<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<S-Right>", ":wincmd l<CR>", { noremap = true, silent = true })

-- vim.keymap.set('n', '<F2>', ':lua toggle_tree()<CR>')
vim.keymap.set("n", "]g", vim.diagnostic.goto_next)
vim.keymap.set("n", "[g", vim.diagnostic.goto_prev)

-- vim.keymap.set({ "n", "v" }, ",m", "<cmd>BookmarksMark<cr>", { desc = "Mark current line into active BookmarkList." })
-- vim.keymap.set({ "n", "v" }, ",t", "<cmd>BookmarksGoto<cr>", { desc = "Go to bookmark at current active BookmarkList" })
-- vim.keymap.set({ "n", "v" }, ",c", "<cmd>BookmarksCommands<cr>", { desc = "Find and trigger a bookmark command." })
-- vim.keymap.set({ "n", "v" }, ",g", "<cmd>BookmarksGotoRecent<cr>", { desc = "Go to latest visited/created Bookmark" })
-- Search and replace word under the cursor.
vim.keymap.set("n", "<Leader>r", [[:%s/\<<C-r><C-w>\>//g<Left><Left>]])
-- end of maps
--
vim.keymap.set('n', "<leader>=", "mzgg=G`z<cmd>w<CR>")

vim.keymap.set('i', '<C-s>', '<Esc>:w<CR>') vim.keymap.set('n', '<C-s>', ':w<CR>')
vim.keymap.set("n", "cx", "ciw")
vim.keymap.set("n", "yx", "yiw")
vim.api.nvim_set_keymap('n', '<LocalLeader>r', 'yy:lua <C-r>"<CR>', { noremap = true, silent = true })
vim.keymap.set({'n', 'x', 'v'}, '<tab>', '>>', { noremap = true, silent = true })
vim.keymap.set({'n', 'x', 'v'}, '<S-tab>', '<<', { noremap = true, silent = true })


local run_timer =function()
    local cmd = [[!zellij run -f -- tclock timer -d 30m -e 'zellij action toggle-floating-panes && notify-send -w "ALARME"']]
    vim.cmd(cmd)
end
-- set keymap to run_timer
-- nvim_set_keymap({mode}, {lhs}, {rhs}, {opts})              *nvim_set_keymap()*
-- vim.api.nvim_set_keymap('n', '<leader>tz')


vim.api.nvim_set_keymap("n", ",ta", "<cmd>Task add<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", ",tp", "<cmd>Task parse<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", ",ti", "<cmd>Task info<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", ",tu", "<cmd>Task update<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", ",tc", "<cmd>Task context<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", ",td", "<cmd>Task done<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", ",tx", "<cmd>Task export<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", ",tl", "<cmd>Task ls<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", ",tb", "<cmd>Task debug<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", ",tn", "<cmd>Task nodebug<CR>", { noremap = true, silent = true })


vim.api.nvim_set_keymap("n", "+", ":Ag<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<F2>', '<cmd>NvimTreeToggle<CR>', { noremap = true, silent = true })

vim.keymap.set('n', '<F4>', vim.cmd.UndotreeToggle, { desc = 'Undotree' })
