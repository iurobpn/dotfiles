-- mappings
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

" remove trailing spaces on a line
nmap <leader>el :s/[ \\t]\\+$//<CR>

" (CTRL-W ]) Open tag under cursor in new tab
nnoremap <C-W>] <C-W>]:tab split<CR>gT:q<CR>gt

" (CTRL-T, CTRL-right, CTRL-left, L, H) tabs/buffer management
nnoremap <C-t> <ESC>:tabnew<CR>
nnoremap <C-q> <ESC>:tabclose<CR> (CTRL-B) Build project
nmap <leader>m :make<CR>

" nmap <C-b> :make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- uImage<CR>
" imap <C-b> <c-o><c-b>
nnoremap <F7>  :make<CR>
inoremap <F7>  <C-O><F7>
]])

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
-- end of maps
