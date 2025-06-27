nnoremap ' `
nnoremap ` '

" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

nnoremap ,c <Plug>VimspectorContinue
nnoremap ,p <Plug>VimspectorPause

nnoremap <F5> <Plug>VimspectorRestart
nnoremap ,b <Plug>VimspectorToggleBreakpoint
nnoremap ,d <Plug>VimspectorToggleConditionalBreakpoint
nnoremap ,s <Plug>VimspectorStepOver
nnoremap ,i <Plug>VimspectorStepInto
nnoremap ,o <Plug>VimspectorStepOut

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

