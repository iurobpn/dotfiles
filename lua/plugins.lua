-- lazy_conf.lua
require('lazy_conf')
require('nvim-treesitter_conf')
require('mason_conf')
require('cmake-tools_conf')
require('airline_conf')
require('gruvbox_conf')
require('toggle-term_conf')
require('vimtex_conf')

require'lspconfig'.clangd.setup{
    cmd = { "clangd",},
    filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
    -- root_dir = root_pattern(
    --       '.clangd',
    --       '.clang-tidy',
    --       '.clang-format',
    --       'compile_commands.json',
    --       'compile_flags.txt',
    --       'configure.ac',
    --       '.git'
    --     ),
    single_file_support = true,
}

-- require('lint').linters_by_ft = {
--   cpp = {
--         -- 'clangd',
--         'clang-tidy',
--         -- 'cppcheck'
--     },
-- }

-- vim.api.nvim_create_autocmd({ "BufWritePost" }, {
--   callback = function()
--
--     -- try_lint without arguments runs the linters defined in `linters_by_ft`
--     -- for the current filetype
--     require("lint").try_lint()
--
--     -- You can call `try_lint` with a linter name or a list of names to always
--     -- run specific linters, independent of the `linters_by_ft` configuration
--     -- require("lint").try_lint("clang-tidy")
--   end,
-- })
-- clang-tidy
-- cppcheck cppcheck
-- cpplint cpplint

vim.cmd("hi Search cterm=underline ctermfg=LightMagenta ctermbg=NONE")
vim.cmd("hi IncSearch cterm=NONE ctermfg=White ctermbg=DarkMagenta")

-- empty setup using defaults
require("nvim-tree").setup()

-- require('builtin_completion')
-- require('colorscheme')

vim.g.loaded_matchit = 1

-- plugins to checkout:
-- knubie/vim-kitty-navigator
-- folke/flash.nvim
-- folke/twilight.nvim
-- mfussenegger/nvim-treehopper
-- MattesGroeger/vim-bookmarks
-- ghostbuster91/nvim-next
-- /theHamsta/crazy-node-movement/

require('gitsigns').setup()


require('rainbow-delimiters.setup').setup()

-- local lsp = require "lspconfig"
-- local coq = require "coq" -- add this

-- lsp.<server>.setup(<stuff...>)                              -- before
-- lsp.clangd.setup(coq.lsp_ensure_capabilities());

require("ibl").setup()

--[[
require('nvim-ts-autotag').setup({
    opts = {
        -- Defaults
        enable_close = true, -- Auto close tags
        enable_rename = true, -- Auto rename pairs of tags
        enable_close_on_slash = false -- Auto close on trailing </
    },
    -- Also override individual filetype configs, these take priority.
    -- Empty by default, useful if one of the "opts" global settings
    -- doesn't work well in a specific filetype
    per_filetype = {
        ["html"] = {
            enable_close = false
        }
    }
})

--]]
vim.cmd('nnoremap <silent><C-g> <Esc>:Neogit<CR>')



-- size = 20 | function(term)
--     if term.direction == "horizontal" then
--       return 15
--     elseif term.direction == "vertical" then
--       return vim.opt.columns * 0.4
--     end
--   end,


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


vim.keymap.set('n', '<leader><F5>', vim.cmd.UndotreeToggle)

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
--
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
require("mason-nvim-lint").setup()
--]]
--
-- coc configurations
-- local keyset = vim.keymap.set
--
-- Autocomplete
-- function _G.check_back_space()
--     local col = vim.fn.col('.') - 1
--     return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
-- end

