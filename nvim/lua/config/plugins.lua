-- lazy_conf.lua
-- ~/git/dotfiles/lua/config/lazy.lua
vim.notify = require("notify")

    -- Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vim.cmd([[vmap <Enter> <Plug>(EasyAlign)]])

    -- Start interactive EasyAlign for a motion/text object (e.g. gaip)
vim.cmd([[nmap ga <Plug>(EasyAlign)]])
-- require('reactive').setup {
--   builtin = {
--     cursorline = true,
--     cursor = true,
--     modemsg = true
--   }
-- }
-- Start interactive EasyAlign in visual mode (e.g. vipga)
-- vim.api.nvim_set_keymap('x', 'ga', '<Plug>(EasyAlign)', {})

-- Start interactive EasyAlign for a motion/text object (e.g. gaip)
-- vim.api.nvim_set_keymap('n', 'ga', '<Plug>(EasyAlign)', {})

vim.cmd('nmap <C-Space> <Plug>neorg.qol.todo-items.todo.task-cycle')

-- empty setup using defaults
-- require("nvim-tree").setup()
vim.g.loaded_matchit = 1

require('gitsigns').setup()

require('rainbow-delimiters.setup').setup()

require("ibl").setup()

vim.cmd('nnoremap <silent><C-g> <Esc>:Neogit<CR>')

require('mini.icons').setup()
require("scope").setup({})

-- create TreeToggle command for mini.files

-- vim.api.nvim_create_autocmd('User', {
--     pattern = 'MiniFilesWindowOpen',
--     callback = function(args)
--         local win_id = args.data.win_id
--
--         -- Customize window-local settings
--         vim.wo[win_id].winblend = 50
--         local config = vim.api.nvim_win_get_config(win_id)
--         config.border, config.title_pos = 'double', 'right'
--         vim.api.nvim_win_set_config(win_id, config)
--     end,
-- })

-- vim.api.nvim_set_hl(0, "LineNr", { bg = dev.color.dark0 }) -- bright_red for text

require('trouble').setup()
local config = require("fzf-lua.config")
local actions = require("trouble.sources.fzf").actions
config.defaults.actions.files["ctrl-t"] = actions.open
require'nvim-web-devicons'.setup {
    -- your personnal icons can go here (to override)
    -- you can specify color or cterm_color instead of specifying both of them
    -- DevIcon will be appended to `name`
    override = {
        zsh = {
            icon = "",
            color = "#428850",
            cterm_color = "65",
            name = "Zsh"
        }
    };
    -- globally enable different highlight colors per icon (default to true)
    -- if set to false all icons will have the default icon's color
    color_icons = true;
    -- globally enable default icons (default to false)
    -- will get overriden by `get_icons` option
    default = true;
    -- globally enable "strict" selection of icons - icon will be looked up in
    -- different tables, first by filename, and if not found by extension; this
    -- prevents cases when file doesn't have any extension but still gets some icon
    -- because its name happened to match some extension (default to false)
    strict = true;
    -- same as `override` but specifically for overrides by filename
    -- takes effect when `strict` is true
    override_by_filename = {
        [".gitignore"] = {
            icon = "",
            color = "#f1502f",
            name = "Gitignore"
        }
    };
    -- same as `override` but specifically for overrides by extension
    -- takes effect when `strict` is true
    override_by_extension = {
        ["log"] = {
            icon = "",
            color = "#81e043",
            name = "Log"
        }
    };
    -- same as `override` but specifically for operating system
    -- takes effect when `strict` is true
    override_by_operating_system = {
        ["apple"] = {
            icon = "",
            color = "#A2AAAD",
            cterm_color = "248",
            name = "Apple",
        },
    };
}

vim.keymap.set('n', '<F4>', vim.cmd.UndotreeToggle)

vim.keymap.set("n", "gf", function()
    if require("obsidian").util.cursor_on_markdown_link() then
        return "<cmd>ObsidianFollowLink<CR>"
    else
        return "gf"
    end
end, { noremap = false, expr = true })
vim.opt.conceallevel = 2

vim.cmd('nmap <F8> :Outline<CR>')

-- vim.cmd('command! -nargs=+ -complete=file Ag Grepper -noprompt -tool ag -query <args>')
vim.api.nvim_create_user_command('Agg', 'Grepper  -noprompt -tool ag -query <args>', { nargs = '+', complete = 'file', bang = true })
vim.api.nvim_create_user_command('Ag', 'FzfLua live_grep <args>', { bang = true })
vim.api.nvim_create_user_command('File', 'lua require"fzf-lua".files({cwd="<args>"})', { nargs = '+', bang = true })
vim.api.nvim_set_keymap("n", "+", ":Ag<CR>", { noremap = true, silent = true })

vim.cmd([[nnoremap <leader>* :Grepper -cword -noprompt -tool ag<cr>]])
vim.cmd([[nnoremap <leader>g :Grepper -tool ag<CR>]])
vim.cmd([[nnoremap <leader>G :Grepper -tool -buffers ag<CR>]])
vim.cmd([[nmap gs <plug>(GrepperOperator)]])
vim.cmd([[xmap gs <plug>(GrepperOperator)]])

-- Optional. The default behaviour should work for most users.
if vim.g.grepper == nil then
    vim.g.grepper = {}
end
vim.g.grepper.tools         = {'ag', 'git', 'rg'}
vim.g.grepper.jump          = 1
vim.g.grepper.next_tool     = '<leader>g'
vim.g.grepper.simple_prompt = 1
vim.g.grepper.quickfix      = 0
-- vim.api.nvim_create_user_command('ag', '-nargs=+ -complete=file Grepper -noprompt -tool ag -query <args>', {})
--
    vim.g.grepper.ag = {
        grepprg  = 'ag --nogroup --nocolor --column --hidden --path-to-ignore ~/.config/ag/.ignore',
        -- grepformat = '%f:%l:%m',
        -- escape  =   '\\^$.*[]',
        }
    -- vim.g.grepper.git = {
    --     grepprg  = 'git grep -nI',
    --     grepformat = '%f:%l:%m',
    --     escape  =   '\\^$.*[]',
    --     }

vim.cmd("cnoreabbrev aG Ag");
vim.cmd("cnoreabbrev ag Ag");
vim.cmd("cnoreabbrev AG Ag");

vim.cmd("nmap <leader>fm :FzfLua maps<CR>")
vim.cmd("nmap <leader>fz :FzfLua files<CR>")
vim.cmd("nmap <leader>fb :FzfLua buffers<CR>")
vim.cmd("nmap <leader>fw :Windows<CR>")
vim.cmd("nmap <leader>ft :FzfLua tags<CR>")
vim.cmd("nmap <leader>fl :FzfLua blines<CR>")
-- nmap <leader>f' :Marks<CR>
vim.cmd("nmap <leader>fh :FzfLua search_history<CR>")
vim.cmd("nmap <leader>fs :Snippets<CR>")
vim.cmd("nmap <leader>fc :FzfLua commands<CR>")
vim.cmd("nmap - :FzfLua files<CR>")
vim.cmd("nmap _ :FzfLua oldfiles<CR>")
vim.cmd("nmap <leader>fm :FzfLua keymaps<CR>")
-- (F12) buffer explorer
vim.cmd("noremap <silent> <F12> <ESC>:FzfLua buffers<CR>")
vim.cmd('FzfLua register_ui_select')

vim.g.AutoPairs = {['(']=')', ['[']=']', ['{']='}', ["'"]="'", ['"']='"', ['`']='`', ['$']='$'}

-- " Start interactive EasyAlign in visual mode (e.g. vipga)
vim.cmd (' xmap ga <Plug>(EasyAlign) ')

-- " Start interactive EasyAlign for a motion/text object (e.g. gaip)
vim.cmd ('nmap ga <Plug>(EasyAlign')
-- " Disable function highlighting (affects both C and C++ files)
vim.g.cpp_function_highlight = 0

-- " Enable highlighting of C++11 attributes
vim.g.cpp_attributes_highlight = 1

-- " Highlight struct/class member variables (affects both C and C++ files)
vim.g.cpp_member_highlight = 1

-- " Put all standard C and C++ keywords under Vim's highlight group 'Statement'
-- " (affects both C and C++ files)
vim.g.cpp_simple_highlight = 1

-- local ls = require("luasnip")

-- vim.keymap.set({"i"}, "<C-K>", function() ls.expand() end, {silent = true})
-- vim.keymap.set({"i", "s"}, "<C-L>", function() ls.jump( 1) end, {silent = true})
-- vim.keymap.set({"i", "s"}, "<C-J>", function() ls.jump(-1) end, {silent = true})

-- vim.keymap.set({"i", "s"}, "<C-E>", function()
-- 	if ls.choice_active() then
-- 	ls.change_choice(1)
-- end
-- end, {silent = true})

-- local wilder = require('wilder')
-- wilder.setup({modes = {':', '/', '?'}})

-- mnemonic 'di' = 'debug inspect' (pick your own, if you prefer!)
vim.g.vimspector_enable_mappings='HUMAN'
vim.g.vimspector_install_gadgets = { 'debugpy', 'vscode-cpptools', 'CodeLLDB' }
-- for normal mode - the word under the cursor
vim.cmd('nmap <Leader>di <Plug>VimspectorBalloonEval')
-- for visual mode, the visually selected text
vim.cmd('xmap <Leader>di <Plug>VimspectorBalloonEval')
vim.cmd('nmap <M-Up> <Plug>VimspectorUpFrame')
vim.cmd('nmap <M-Down> <Plug>VimspectorDownFrame')
vim.cmd('nmap <LocalLeader>B     <Plug>VimspectorBreakpoints')
vim.cmd('nmap <LocalLeader>D     <Plug>VimspectorDisassemble')

vim.cmd('nmap <Leader>dc <Plug>VimspectorContinue')

vim.cmd('nmap <Leader>ds <Plug>VimspectorStop'                       )
vim.cmd('nmap <Leader>dr <Plug>VimspectorRestart'                    )
vim.cmd('nmap <Leader>dp <Plug>VimspectorPause'                      )
vim.cmd('nmap <Leader>db <Plug>VimspectorToggleBreakpoint'           )
vim.cmd('nmap <Leader>dcb <Plug>VimspectorToggleConditionalBreakpoint')
vim.cmd('nmap <Leader>daf <Plug>VimspectorAddFunctionBreakpoint'      )
vim.cmd('nmap <Leader>dh <Plug>VimspectorRunToCursor'                )
vim.cmd('nmap <Leader>dn <Plug>VimspectorStepOver'                   )
vim.cmd('nmap <Leader>ds <Plug>VimspectorStepInto'                   )
vim.cmd('nmap <Leader>du <Plug>VimspectorStepOut'                    )
vim.cmd('nmap <Leader>dq <Plug>VimspectorStop')

-- Use clang-format for C++ code formatting

-- Use clang-format with a specific .clang-format file for C++ code
vim.cmd([[
  autocmd FileType cpp setlocal formatprg=clang-format\ -style=file\ -assume-filename=.cpp\ -fallback-style=none
]])

vim.cmd([[
  autocmd FileType cpp setlocal equalprg=clang-format\ -style=file\ -assume-filename=.cpp\ -fallback-style=none
]])


vim.g.UltiSnipsExpandTrigger="<CR>"
-- vim.g.UltiSnipsJumpForwardTrigger="<tab>"
-- vim.g.UltiSnipsJumpBackwardTrigger="<c-b>"
vim.g.UltiSnipsUsePythonVersion = 3
vim.g.UltiSnipsListSnippets = "<F3>"
-- if you want :UltiSnipsEdit to split your window.
vim.g.UltiSnipsEditSplit="vertical"
-- vim.g.UltiSnipsSnippetsDir=""
vim.g.UltiSnipsSnippetDirectories={'UltiSnips'}
vim.g.UltiSnipsSnippetStorageDirectoryForUltiSnipsEdit="~/.config/nvim/UltiSnips"

-- vim.g.UltiSnipsExpandTrigger="<tab>"
-- vim.g.UltiSnipsJumpForwardTrigger="<c-b>"
-- vim.g.UltiSnipsJumpBackwardTrigger="<c-z>"


-- function! GetAllSnippets()
--   call UltiSnips#SnippetsInCurrentScope(1)
--   let list = []
--   for [key, info] in items(g:current_ulti_dict_info)
--     let parts = split(info.location, ':')
--     call add(list, {
--       \"key": key,
--       \"path": parts[0],
--       \"linenr": parts[1],
--       \"description": info.description,
--       \})
--   endfor
--   return list
-- endfunction
--
vtex = {}
function GetAllSnippets()
    vim.call('UltiSnips#SnippetsInCurrentScope', 1)

    local list = {}
    local current_ulti_dict_info = vim.g.current_ulti_dict_info

    for key, info in pairs(current_ulti_dict_info) do
        local parts = vim.split(info.location, ':')
        table.insert(list, {
            key = key,
            path = parts[1],
            linenr = parts[2],
            description = info.description,
            value = info.context,
        })
    end

    return list
end

function ShowSnippetsInFloatWindow()
    local snippets = GetAllSnippets()

    -- Create a new buffer
    local buf = vim.api.nvim_create_buf(false, true)

    -- Populate the buffer with the snippet data
    local lines = {}
    for _, snippet in ipairs(snippets) do
        table.insert(lines, string.format("Key: %s, Description: %s", snippet.key, snippet.description))
    end

    vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

    -- Define window dimensions
    local width = math.floor(vim.o.columns * 0.8)
    local height = math.floor(vim.o.lines * 0.5)
    local row = math.floor((vim.o.lines - height) / 2)
    local col = math.floor((vim.o.columns - width) / 2)

    -- Create a floating window
    local win = vim.api.nvim_open_win(buf, true, {
        relative = 'editor',
        width = width,
        height = height,
        row = row,
        col = col,
        style = 'minimal',
        border = 'rounded',
    })
    local i = 0
    local links = {}
    for _, snippet in ipairs(snippets) do
        links[i] = {file=snippet.path, line=snippet.linenr}
        -- print("Link: ", links[i].file, ":", links[i].line)
        vim.api.nvim_buf_add_highlight(buf, -1, "Underlined", i, 0, -1)
        i = i + 1
    end
    set_link(buf, links)

    -- Set up the CursorMoved autocommand for the preview
    setup_cursor_moved_autocmd(links)
    -- Optional: Set keymaps to close the floating window
    vim.api.nvim_buf_set_keymap(buf, 'n', 'q', '<Leader>q', { noremap = true, silent = true })
end

function set_link(buf, links)
    vim.api.nvim_buf_set_keymap(buf, 'n', '<CR>', '', {
        noremap = true,
        silent = true,
        callback = function()
            local current_line = vim.fn.line('.')
            -- Jump to the specific file and line
            link = links[current_line-1]
            if (link ~= nil) then
                vim.cmd('edit ' .. link.file)
                vim.fn.cursor(link.line,1)
            else
            end
        end
    })
end

-- preview window code
function create_preview_window(link)
    local filename = link.file
    local line = link.line
    -- Read the file content
    local lines = vim.fn.readfile(filename)

    -- Create a new buffer for the preview
    local preview_buf = vim.api.nvim_create_buf(false, true)

    -- Set the buffer lines to show a snippet around the line of interest
    local start_line = math.max(0, line - 5)
    local end_line = math.min(#lines, line + 5)
    vim.api.nvim_buf_set_lines(preview_buf, 0, -1, false, vim.list_slice(lines, start_line, end_line))
    -- local file_ext = filename:match("^.+(%..+)$")
    local filetype = 'snippets' --vim.fn.matchstr(vim.fn.globpath(vim.o.rtp, "syntax/*" .. file_ext), [[\v([^/]+)$]])
    vim.api.nvim_buf_set_option(preview_buf, 'filetype', filetype)
    -- Define the window options
    local opts = {
        relative = 'cursor',
        width = math.max(80, vim.fn.strwidth(lines[line])),
        height = math.min(10, end_line - start_line),
        col = 1,
        row = 1,
        -- style = 'minimal',
        border = 'rounded',
        zindex = 200,
    }

    -- Open the floating preview window
    return vim.api.nvim_open_win(preview_buf, false, opts)

end

function setup_cursor_moved_autocmd(links)

    -- Define the handler function
    function handle_cursor_moved()
        -- Close any existing preview windows
        if (vtex.win) then
            vim.api.nvim_win_close(vtex.win,true)
            vtex.win = nil
        end

        local cursor_line = vim.fn.line('.')
        local link = links[cursor_line-1]
        print_link(link)

        if link then
            vtex.win = create_preview_window(link)
        end
    end

    vim.cmd [[augroup FloatingPreview
    autocmd!
    autocmd CursorMoved <buffer> lua handle_cursor_moved()
    augroup END]]
end

function print_link(link)
    if link then
        print("Link: ", link.file, ":", link.line)
    else
        print("No link")
    end
end

vim.keymap.set('n', '<LocalLeader>s', '<cmd>lua ShowSnippetsInFloatWindow()<CR>', { noremap = true, silent = true })


require('pendulum').setup({
    log_file = vim.fn.expand("/opt/data/log/timer_log.csv"),
    timeout_len = 300,  -- 5 minutes
    timer_len = 60,     -- 1 minute
    gen_reports = true, -- Enable report generation (requires Go)
    top_n = 10,         -- Include top 10 entries in the report
})

vim.keymap.set('n', '<Leader>ts' , ':TimerStart ', { desc = 'Start the timer', callback = start_timer_with_prompt, noremap = true, silent = true })
vim.keymap.set('n', '<leader>tf', ':TimerStop<CR>', { desc = 'Stop the timer' })
vim.keymap.set('n', '<leader>tp', ':TimerPause<CR>', { desc = 'Pause the timer' })
vim.keymap.set('n', '<leader>tr', ':TimerResume<CR>', { desc = 'Resume the timer' })
vim.keymap.set('n', '<leader>tre', ':TimerRestart<CR>', { desc = 'Restart  the timer' })
vim.keymap.set('n', '<leader>tt', ':TimerTemplate<CR>', { desc = 'select timer template' })
vim.keymap.set('n', '<leader>ct', ':StartYourCustomTimer<CR>', { desc = 'start your custom timer'})

require("pomo").setup({
  sessions = {
    pomodoro = {
      { name = "Work", duration = "60m" },
      { name = "Short Break", duration = "5m" },
      { name = "Work", duration = "60m" },
      { name = "Short Break", duration = "5m" },
      { name = "Work", duration = "60m" },
      { name = "Long Break", duration = "15m" },
    },
  },
})

vim.api.nvim_create_user_command('OpenObsidian', 'edit /home/gagarin/sync/obsidian/Index.md', {})

require'obsidian'
vim.api.nvim_set_keymap('n', '<M-t>', ':ObsidianToday<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-Space>', ':lua require"dev.lua.tasks".recurrent_done()<CR>', { noremap = true, silent = true })


require("overseer").setup({
  templates = { 
        "builtin",
        "user.cpp_build",
        "user.run_script",
        "user.reset_conan",
        "user.make_debug",
        "user.run_admmPre", 
    },
})

-- Declare a global function to retrieve the current directory
local oil = require("oil")
oil.setup()
function _G.toggle_oil()
    print('toggle_oil')
    local views = dev.nvim.ui.views
    if views.lfixed_id ~= nil and vim.api.nvim_win_is_valid(views.lfixed_id) then
        print('vid = nr')
        require("oil").close()
        views.close_fixed_left()
        views.lfixed_id = nil
    else
        print('vid = nil')
        views.open_fixed_left()
        require("oil").open()
    end
end

vim.api.nvim_set_keymap('n', '<F3>', '<cmd>lua toggle_oil()<CR>', { noremap = true, silent = true })

-- " builds the getter and setter of the parameter in the current line
-- function! BuildGetterSetter()
-- 	normal ma
-- 	let line = getline('.')
-- 	let parts = split(line, ' ')
-- 	" regular expressions to capture needed information
-- 	let regvar = '\(\h\w*\)'
-- 	let any = '.*'
-- 	let regind = '\(\s\+\)'
-- 	" type of variable
-- 	let type = substitute(parts[0], regind . regvar,'\2',"")
-- 	echo strlen(type)
-- 	" spaces begore variable
-- 	let ind = substitute(parts[0], regind . regvar,'\1',"")
-- 	" variable to obtain get and set
-- 	let var = substitute(parts[1], regvar . any,'\1',"")
-- 	let n = strlen(var)
-- 	" capitalize variable
-- 	let Var = toupper(var[0]) . var[1:n]
--
-- 	" obtain getter and setter
-- 	let getter = ind . type . ' get' . Var . '();'
-- 	let setter =  ind . 'void set' . Var . '(' . type . ' '. var . ');'
-- 	" find position to insert getter and setter
-- 	call search('public:','sw')
-- 	let line_pos = getpos('.')
-- 	let line_num = line_pos[1]
-- 	silent normal! o
-- 	silent normal! o
-- 	silent normal! o
-- 	call setline(line_num+1, getter)
-- 	call setline(line_num+2, setter)
-- 	normal 'a
-- endfunction
--
-- nnoremap <leader>sg :call BuildGetterSetter()<CR>
