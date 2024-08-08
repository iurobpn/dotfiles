-- lazy_conf.lua
require('lazy_conf')
require('vimtex_conf')
require('nvim-treesitter_conf')
-- require('mason_conf')
require('cmake-tools_conf')
require('airline_conf')
require('gruvbox_conf')
require('toggle-term_conf')

-- require'lspconfig'.clangd.setup{
--     cmd = { "clangd",},
--     filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
--     -- root_dir = root_pattern(
--     --       '.clangd',
--     --       '.clang-tidy',
--     --       '.clang-format',
--     --       'compile_commands.json',
--     --       'compile_flags.txt',
--     --       'configure.ac',
--     --       '.git'
--     --     ),
--     single_file_support = true,
-- }


vim.cmd("hi Search cterm=underline ctermfg=LightMagenta ctermbg=NONE")
vim.cmd("hi IncSearch cterm=NONE ctermfg=White ctermbg=DarkMagenta")

-- empty setup using defaults
require("nvim-tree").setup()

vim.g.loaded_matchit = 1

-- plugins to checkout:
-- knubie/vim-kitty-navigator
-- folke/flash.nvim
-- folke/twilight.nvim
-- mfussenegger/nvim-treehopper
-- MattesGroeger/vim-bookmarks
-- ghostbuster91/nvim-next
-- /theHamsta/crazy-node-movement/
-- clang-tidy
-- cppcheck cppcheck
-- cpplint cpplint

require('gitsigns').setup()


require('rainbow-delimiters.setup').setup()

require("ibl").setup()

vim.cmd('nnoremap <silent><C-g> <Esc>:Neogit<CR>')


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


vim.keymap.set('n', '<M-u>', vim.cmd.UndotreeToggle)
vim.keymap.set('n', '<M-Left>', vim.cmd.cnext)
vim.keymap.set('n', '<M-Right>', vim.cmd.cprev)


vim.keymap.set("n", "gf", function()
    if require("obsidian").util.cursor_on_markdown_link() then
        return "<cmd>ObsidianFollowLink<CR>"
    else
        return "gf"
    end
end, { noremap = false, expr = true })

vim.cmd('nmap <F8> :TagbarToggle<CR>')
    -- Command abbreviation

-- Normal mode key mapping

if vim.fn.executable('ag') == 1 then
    vim.g.ackprg="ag --vimgrep"
    vim.g.ackhighlight = 1
    vim.g.ackpreview = 1
    vim.g.ackprg='ag --nogroup --nocolor --column --hidden --path-to-ignore ~/.config/ag/.ignore'
    -- vim.g.grepprg='ag --nogroup --nocolor'
    vim.env.FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
end

vim.cmd('command! -nargs=+ -complete=file Ag Grepper -noprompt -tool ag -query <args>')
-- vim.api.nvim_create_user_command('ag', '-nargs=+ -complete=file Grepper -noprompt -tool ag -query <args>', {})

vim.cmd("cnoreabbrev aG Ag");
vim.cmd("cnoreabbrev ag Ag");
vim.cmd("cnoreabbrev AG Ag");

vim.cmd("nmap <leader>fm :Maps<CR>")
vim.cmd("nmap <leader>fz :FZF<CR>")
vim.cmd("nmap <leader>ff :Files<CR>")
vim.cmd("nmap <leader>fb :Buffers<CR>")
vim.cmd("nmap <leader>fw :Windows<CR>")
vim.cmd("nmap <leader>ft :Tags<CR>")
vim.cmd("nmap <leader>fl :BTags<CR>")
-- nmap <leader>f' :Marks<CR>
vim.cmd("nmap <leader>fh :History<CR>")
vim.cmd("nmap <leader>fs :Snippets<CR>")
vim.cmd("nmap <leader>fc :Commands<CR>")
vim.cmd("nmap - :FZF<CR>")
-- (F9) Open file explorer
vim.cmd("noremap <silent> <F9> <ESC>:Explore<CR>")
-- (F12) buffer explorer
vim.cmd("noremap <silent> <F12> <ESC>:Buffers<CR>")

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

vim.g.UltiSnipsExpandTrigger="<tab>"
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
        table.insert(lines, string.format("Key: %s, Path: %s, Line: %s, Description: %s", snippet.key, snippet.path, snippet.linenr, snippet.description))
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

    -- Optional: Set keymaps to close the floating window
    vim.api.nvim_buf_set_keymap(buf, 'n', 'q', '<Leader>q', { noremap = true, silent = true })
end

vim.keymap.set('n', '<Leader>s', '<cmd>lua ShowSnippetsInFloatWindow()<CR>', { noremap = true, silent = true })



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
--

--[[
local DEFAULT_SETTINGS = {
    -- A list of linters to automatically install if they're not already installed. Example: { "eslint_d", "revive" }
    -- This setting has no relation with the `automatic_installation` setting.
    -- Names of linters should be taken from the mason's registry.
    ---@type string[]
    ensure_installed = {'clang-tidy'},

    -- Whether linters that are set up (via nvim-lint) should be automatically installed if they're not already installed.
    -- It tries to find the specified linters in the mason's registry to proceed with installation.
    -- This setting has no relation with the `ensure_installed` setting.
    ---@type boolean
    automatic_installation = true,

    -- Disables warning notifications about misconfigurations such as invalid linter entries and incorrect plugin load order.
    quiet_mode = false,
}
--]]
--
