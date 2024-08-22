-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_perl_provider = 0

vim.g.python3_host_prog = 'python'


-- optionally enable 24-bit colour
vim.opt.termguicolors = true

vim.opt.compatible = false
--  disable vi compatibility (emulation of old bugs)
-- vim.opt.exrc=true
--  automaticly rereads a file change outside vim
vim.opt.autoread=true
--  highlights cursor line
vim.opt.cursorline=true

vim.opt.backspace = "indent,eol,start"

--  size of command line history
vim.opt.history=200

--  autocomplete words
vim.opt.complete = 'kspell'

--  use indentation of previous line
vim.opt.autoindent=true

--  use intelligent indentation for C
--  set smartindent
vim.opt.cindent=true

--  configure tabwidth and insert spaces instead of tabs
vim.opt.tabstop=8        -- tab width is 8 spaces
vim.opt.shiftwidth=4     -- indent also with 4 spaces
vim.opt.expandtab=true        -- expand tabs to spaces
vim.opt.softtabstop=-1    -- use the same as shiftwidth

--  wrap lines at 120 chars.
--  set textwidth=120

--  show column number
vim.opt.ruler=true

--  turn line numbers on
vim.opt.number=true

--  highlight matching braces
vim.opt.showmatch=true

--  show chars on lower bar as they are beeing pressed
vim.opt.showcmd=true

vim.opt.showmode=true

--  enhanced tab completion on commands
vim.opt.wildmenu=true
vim.opt.colorcolumn="75"

vim.opt.wildmode = { "longest:list", "full" }

--  buffer can be in the background if it’s modified
vim.opt.hidden=true

--  Search
vim.opt.hlsearch=true     -- highlight matches
vim.opt.incsearch =true   -- incremental searching
vim.opt.ignorecase=true   -- searches are case insensitive...
--  set smartcase    " ... unless they contain at least one capital letter


-- Syntax highlighting and filetype plugins
vim.cmd('filetype plugin indent on')
vim.cmd('filetype on')
vim.cmd('syntax enable')

vim.opt.clipboard='unnamed,unnamedplus'

vim.opt.completeopt='menuone,menu,longest,preview'

vim.opt.wildignore='*/tmp/*,*.so,*.swp,*.zip'

vim.opt.backup=false
vim.opt.writebackup=false

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
vim.opt.updatetime=300

-- Always show the signcolumn, otherwise it would shift the text each time
-- diagnostics appear/become resolved.
vim.opt.signcolumn='yes'

vim.opt.relativenumber=true
vim.opt.history=1000

-- Persistent undo
  --set sidescroll=1
vim.opt.sidescrolloff=2

vim.opt.listchars='tab:>\\ ,trail:-,extends:>,precedes:<,nbsp:+'
vim.opt.list=true

-- let g:CSApprox_loaded = 1


vim.opt.autoread=true
vim.opt.scrolloff=3

if (vim.fn.has("persistent_undo") == 1) then
    local target_path = vim.fn.expand('~/.undodir')

    -- create the directory and any parent directories
    -- if the location does not exist.
    if not vim.fn.isdirectory(target_path) then
        vim.cmd('call mkdir(target_path, "p", 0700)')
    end

    vim.opt.undodir=target_path
    vim.opt.undofile=true
end

vim.cmd("nnoremap ' `")
vim.cmd("nnoremap ` '")

function my_next()
    if (vim.fn.exists('*tabpagenr' ) and vim.fn.tabpagenr('$') ~= 1) then
        -- Tab support && tabs open
        vim.cmd('normal gt')
    else
        -- No tab support, or no tabs open
        vim.cmd('execute ":bnext"')
    end
end

function my_prev()
    if (vim.fn.exists( '*tabpagenr' ) and vim.fn.tabpagenr('$') ~= 1) then
        -- Tab support && tabs open
        vim.cmd('normal gT')
    else
        -- No tab support, or no tabs open
        vim.cmd('execute ":bprev"')
    end
end


-- mappings
vim.cmd("nnoremap <A-Right>  <ESC>:bnext<CR>");
vim.cmd("nnoremap <A-Left>  <ESC>:bprev<CR>");
vim.cmd("nnoremap <C-Right>  <ESC>:lua my_next()<CR>");
vim.cmd("nnoremap <C-Left>  <ESC>:lua my_prev()<CR>");
vim.cmd("nnoremap <leader>d  <ESC>:bdelete<CR>");

vim.cmd("cnoreabbrev W! w!")
vim.cmd("cnoreabbrev Q! q!")
vim.cmd("cnoreabbrev Qall! qall!")
vim.cmd("cnoreabbrev Wq wq")
vim.cmd("cnoreabbrev Wa wa")
vim.cmd("cnoreabbrev wQ wq")
vim.cmd("cnoreabbrev WQ wq")
vim.cmd("cnoreabbrev W w")
vim.cmd("cnoreabbrev Q q")
vim.cmd("cnoreabbrev Qall qall")

vim.cmd("cmap w!! w !sudo tee % >/dev/null");
vim.cmd("nmap <leader>n :cn<CR>")
vim.cmd("nmap <leader>p :cp<CR>")
vim.cmd("nmap <leader>o :copen<CR>")
vim.cmd("nmap <leader>w :cwindow<CR>")
vim.cmd("nmap <leader>c :cclose<CR>")

vim.cmd("nmap <silent> , :noh<CR>")
vim.cmd("nmap ; :")

function ToogleSpell()
    if vim.opt.spelllang == 'en' then
        vim.cmd("set spell spelllang=pt_br")
    -- elseif vim.opt.spelllang == 'pt_br'
    --     vim.cmd("set spell spelllang=en")
    else
        vim.cmd("set spell spelllang=en")
    end
end

vim.cmd("command ToogleSpell :lua ToogleSpell()<CR>")
vim.cmd("nnoremap <silent> <Leader>ç :ToogleSpell<CR>")

vim.cmd([[augroup Binary
    au!
    au BufReadPre  *.out let &bin=1
    au BufReadPost *.out if &bin | %!xxd
    au BufReadPost *.out set ft=xxd | endif
    au BufWritePre *.out if &bin | %!xxd -r
    au BufWritePre *.out endif
    au BufWritePost *.out if &bin | %!xxd
    au BufWritePost *.out set nomod | endif
augroup END
]])

vim.cmd("noremap çd :cd %:p:h")
vim.cmd("noremap çl :lcd %:p:h")


-- remove trailing spaces on a line
vim.cmd("nmap <leader>el :s/[ \\t]\\+$//<CR>")  
-- (CTRL-W ]) Open tag under cursor in new tab
vim.cmd("nnoremap <C-W>] <C-W>]:tab split<CR>gT:q<CR>gt")

-- (CTRL-T, CTRL-right, CTRL-left, L, H) tabs/buffer management
vim.cmd("nnoremap <C-t> <ESC>:tabnew<CR>")
vim.cmd("nnoremap <C-q> <ESC>:tabclose<CR>")

-- " (CTRL-B) Build project
vim.cmd("nmap <leader>m :make<CR>")
-- "nmap <C-b> :make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- uImage<CR>
-- " imap <C-b> <c-o><c-b>
vim.cmd("nnoremap <F7>  :make<CR>")
vim.cmd("inoremap <F7>  <c-o><F7>")
-- local key = vim.keymap
-- key.set('n', '<F8>', ':make<CR>')

-- gutentags_conf.lua
require('config.gutentags')
nv_tree_open=false
function toggle_tree()
    if nv_tree_open then
        vim.cmd("NvimTreeClose")
        nv_tree_open = false
    else
        vim.cmd("NvimTreeOpen")
        nv_tree_open = true
    end
end

vim.keymap.set('n', '<F2>', ':lua toggle_tree()<CR>')
-- vim.g.copilot_no_tab_map = true
-- vim.api.nvim_set_keymap("i", "<tab>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
-- vim.g.copilot_no_tab_map = true
-- vim.g.copilot_assume_mapped = true
-- vim.g.copilot_tab_fallback = ""
-- vim.keymap.set('i', '<C-L>', '<Plug>(copilot-accept-lineword)')

vim.keymap.set('i', '<C-S-Right>', '<Plug>(copilot-accept-word)')
vim.keymap.set("n", "]g", vim.diagnostic.goto_next)
vim.keymap.set("n", "[g", vim.diagnostic.goto_prev)
