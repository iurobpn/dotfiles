-- disable netrw at the very start of your init.lua
if vim.g.settings_loaded then
    return
else
	vim.g.settings_loaded = true
end
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_perl_provider = 0

vim.g.python3_host_prog = 'python'
vim.opt.spellfile=vim.fn.expand('~/.config/nvim/spell/en.utf8.add')
vim.opt.spelllang='en_us'

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
vim.opt.history=10000

-- Persistent undo
  --set sidescroll=1
vim.opt.sidescrolloff=2

vim.opt.listchars='tab:>\\ ,trail:-,extends:>,precedes:<,nbsp:+'
vim.opt.list=true

-- let g:CSApprox_loaded = 1

vim.opt.autoread=true
vim.opt.scrolloff=2

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




vim.opt.foldminlines=8

vim.cmd('autocmd FileType markdown setlocal foldlevel=1')
-- local key = vim.keymap
-- key.set('n', '<F8>', ':make<CR>')

-- gutentags_conf.lua
require('config.gutentags')


-- Set makeprg for Lua files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "lua",
  callback = function()
    vim.bo.makeprg = "lua %"
  end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "tex",
    callback = function()
        vim.opt.spelllang = 'en_us'
        vim.cmd('setlocal spell')
        vim.cmd('TSBufDisable highlight')
    end,
})

-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "*.md",
--   command ='call matchadd("SpecialKey", "{{jq:.*}}")'
-- })

vim.cmd('call matchadd("SpecialKey", "{{jq:.*}}")')
vim.opt.foldmethod = "manual"

require('config.keymaps')
