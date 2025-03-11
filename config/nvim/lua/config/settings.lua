-- disable netrw at the very start of your init.lua
if vim.g.settings_loaded then
	vim.cmd('echo "settings already loaded"')
    return
else
	vim.g.settings_loaded = true
end

vim.g.maplocalleader = "ç"
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1
vim.g.loaded_perl_provider = 0

vim.g.python3_host_prog = 'python'
vim.o.spellfile=vim.fn.expand('~/.config/nvim/spell/en.utf8.add')
vim.o.spelllang='en_us'

-- optionally enable 24-bit colour
vim.o.termguicolors = true

vim.o.compatible = false
--  disable vi compatibility (emulation of old bugs)
-- vim.opt.exrc=true
--  automaticly rereads a file change outside vim
vim.o.autoread=true
--  highlights cursor line
vim.o.cursorline=true

vim.o.backspace = "indent,eol,start"

--  autocomplete words
vim.o.complete = 'kspell'

--  use indentation of previous line
vim.o.autoindent=true

--  use intelligent indentation for C
--  set smartindent
vim.o.cindent=true

--  configure tabwidth and insert spaces instead of tabs
vim.o.tabstop=4        -- tab width is 8 spaces
vim.o.shiftwidth=4     -- indent also with 4 spaces
vim.o.expandtab=true        -- expand tabs to spaces
vim.o.softtabstop=-1    -- use the same as shiftwidth

--  wrap lines at 120 chars.
--  set textwidth=120

--  show column number
vim.o.ruler=true

--  turn line numbers on
vim.o.number=true

--  highlight matching braces
vim.o.showmatch=true

--  show chars on lower bar as they are beeing pressed
vim.o.showcmd=true

vim.o.showmode=true
vim.g.coc_filetype_map = {tex ='latex'}
--  enhanced tab completion on commands
vim.o.colorcolumn="80"

vim.o.wildmenu=true
vim.opt.wildmode = { "longest:list", "full" }
vim.o.wildignore='*/tmp/*,*.so,*.swp,*.zip'
-- vim.o.wildoptions

--  buffer can be in the background if it’s modified
vim.o.hidden=true

--  Search
vim.o.hlsearch=true     -- highlight matches
vim.o.incsearch =true   -- incremental searching
vim.o.ignorecase=true   -- searches are case insensitive...
--  set smartcase    " ... unless they contain at least one capital letter


-- Syntax highlighting and filetype plugins
vim.cmd('filetype plugin indent on')
vim.cmd('filetype on')
vim.cmd('syntax enable')

vim.o.clipboard='unnamed,unnamedplus'

vim.o.completeopt='menuone,menu,longest,preview'


vim.o.backup=false
vim.o.writebackup=false

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
vim.o.updatetime=300

-- Always show the signcolumn, otherwise it would shift the text each time
-- diagnostics appear/become resolved.
vim.o.signcolumn='yes'

vim.o.relativenumber=true
vim.o.history=10000

-- Persistent undo
vim.o.sidescroll=1
vim.o.sidescrolloff=2

vim.o.listchars='tab:>\\ ,trail:-,extends:>,precedes:<,nbsp:+'
vim.o.list=true

-- let g:CSApprox_loaded = 1

vim.o.autoread=true
vim.o.scrolloff=1

if (vim.fn.has("persistent_undo") == 1) then
    local target_path = vim.fn.expand('~/.undodir')

    -- create the directory and any parent directories
    -- if the location does not exist.
    if not vim.fn.isdirectory(target_path) then
        vim.cmd('call mkdir(target_path, "p", 0700)')
    end

    vim.o.undodir=target_path
    vim.o.undofile=true
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

function toggle_searchhl()
    if vim.o.hlsearch then
        vim.o.hlsearch = false
    else
        vim.o.hlsearch = true
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
    if vim.o.spelllang == 'en' then
        vim.cmd("set spell spelllang=pt_br")
    -- elseif vim.o.spelllang == 'pt_br'
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

vim.o.foldminlines=8

vim.cmd('autocmd FileType markdown setlocal foldlevel=1')

-- gutentags_conf.lua
require('config.gutentags')
vim.cmd([[setglobal tags-=./tags ]])

-- Set makeprg for Lua files
vim.api.nvim_create_autocmd("FileType", {
    pattern = "lua",
    callback = function()
        vim.bo.makeprg = "lua %"
    end,
})
vim.cmd[[
augroup FiletypeSdf
    autocmd!
    autocmd BufRead,BufNewFile *.sdf setfiletype xml
augroup END
]]

-- vim.api.nvim_create_augroup('latex_grp', {
--         clear = false,
-- })


-- vim.api.nvim_create_autocmd("FileType", {
--     pattern = "*.md",
--     callback = function()
--         vim.fn.matchadd("SpecialKey", '{{jq:.*}}', 1, -1)
--     end
-- })
function open_gh_link()
    local line = vim.fn.getline('.')
    local url = string.match(line, '[\'"]([%w_%-]+/[%w_%-]+)[\'"]')
    if url then
        vim.cmd('!xdg-open https://github.com/' .. url)
    end
end



vim.o.foldmethod = "manual"

function help_cword()
    local word = vim.fn.expand('<cword>')
    vim.cmd('help ' .. word)
end

function insert_date()
    local date = os.date("%Y-%m-%d")
    vim.cmd('normal! a' .. date)
end

-- vim.api.nvim_create_autocmd("FileType", {
--     pattern = "*.md",
--     callback = function()
--         local pal = require'gruvbox'.palette
--
-- 'call matchadd("SpecialKey", "---")'
--     end
-- })

-- Place this code in your init.lua or a Lua module sourced by your config
-- Namespace for our extmarks
local ns_id = vim.api.nvim_create_namespace('horizontal_line')

-- Function to update the virtual lines
local function update_lines()
    -- Get the buffer number
    local bufnr = vim.api.nvim_get_current_buf()
    -- Clear existing extmarks in the namespace
    vim.api.nvim_buf_clear_namespace(bufnr, ns_id, 0, -1)

    local filetype = vim.bo[bufnr].filetype
    if filetype ~= 'markdown' or filetype ~= 'md' then
        -- If not markdown, clear the namespace and return
        vim.api.nvim_buf_clear_namespace(bufnr, ns_id, 0, -1)
        return
    end
    -- Get the window width
    local width = vim.api.nvim_win_get_width(0)
    -- Get all lines in the buffer
    local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
    -- Get the current cursor position
    local cursor_line = vim.api.nvim_win_get_cursor(0)[1]

    for i, line in ipairs(lines) do
        if line == '---' and i ~= cursor_line then
            -- Create the virtual text
            local virt_text = string.rep('─', width)
            vim.api.nvim_buf_set_extmark(bufnr, ns_id, i - 1, 0, {
                virt_text = {{virt_text, 'NonText'}},
                virt_text_pos = 'overlay',
                hl_mode = 'replace',
            })
        end
    end
end

-- Set autocommands to update the lines when the buffer is changed, resized, or cursor moves
vim.api.nvim_create_autocmd(
    {'BufEnter', 'TextChanged', 'WinScrolled', 'VimResized', 'BufWinEnter', 'CursorMoved', 'CursorMovedI'},
    {
        callback = function()
            update_lines()
        end
    })

-- Optionally, update the lines when leaving insert mode
vim.api.nvim_create_autocmd('InsertLeave', {
    callback = function()
        update_lines()
    end
})

require('config.keymaps')
