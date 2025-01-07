--  mappings
vim.cmd([[
nnoremap ' `
nnoremap ` '

nnoremap <A-Right>  <ESC>:bnext<CR>
nnoremap <A-Left>  <ESC>:bprev<CR>
nnoremap <C-Right>  <ESC>:lua my_next()<CR>
nnoremap <C-Left>  <ESC>:lua my_prev()<CR>
nnoremap <leader>d  <ESC>:bdelete<CR>

" commn mistakes on command line
cnoreabbrev R r
cnoreabbrev R! r!
cnoreabbrev E e
cnoreabbrev E! e!
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

" save file with sudo, even if you forgot to open it with sudo
cmap w!! w !sudo tee % >/dev/null
cnoreabbrev W!! w !sudo tee % >/dev/null

nmap ; :

noremap <leader>d :cd %:p:h<CR>
noremap <leader>l :lcd %:p:h<CR>


" (CTRL-W ]) Open tag under cursor in new tab
nnoremap <C-W>] <C-W>]:tab split<CR>gT:q<CR>gt

" (CTRL-T, CTRL-right, CTRL-left, L, H) tabs/buffer management
nnoremap <C-t> <ESC>:tabnew<CR>
nnoremap <C-q> <ESC>:tabclose<CR> (CTRL-B) Build project
nmap <leader>m :make<CR>

" nmap <C-b> :make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- uImage<CR>
" imap <C-b> <c-o><c-b>
]])

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

vim.keymap.set({ "n", "v" }, ",m", "<cmd>BookmarksMark<cr>", { desc = "Mark current line into active BookmarkList." })
vim.keymap.set({ "n", "v" }, ",t", "<cmd>BookmarksGoto<cr>", { desc = "Go to bookmark at current active BookmarkList" })
vim.keymap.set({ "n", "v" }, ",c", "<cmd>BookmarksCommands<cr>", { desc = "Find and trigger a bookmark command." })
vim.keymap.set({ "n", "v" }, ",g", "<cmd>BookmarksGotoRecent<cr>", { desc = "Go to latest visited/created Bookmark" })
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

vim.keymap.set('n', '<leader>fb', require('browser_bookmarks').select, {
  desc = 'Fuzzy search browser bookmarks',
})
