---------  airline status bar   ----------------
vim.cmd([[
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail'
]])

-- let g:airline_left_sep='>'
-- vim.g.airline_theme='distinguished'
-- vim.cmd("AirlineTheme distinguished")
-- vim-airline
-- vim.g.airline_theme = 'powerlineish'
vim.g.airline_theme = 'distinguished'
-- vim.g.airline_theme = 'dark_minimal'
-- vim.g.airline_section_z = 
-- vim.cmd("let g:airline#extensions#syntastic#enabled = 1")
-- vim.cmd("let g:airline#extensions#ale#enabled = 1")
-- vim.cmd("let g:airline#extensions#tagbar#enabled = 1")
-- vim.cmd('let g:airline#extensions#tagbar#flags = "f"')
-- %p%%%#__accent_bold#%{g:airline_symbols.linenr}%l%#__restore__#%#__accent_bold#/%L%{g:airline_symbols.maxlinenr}%#__restore__#%#__accent_bold#%v%#__restore__#

vim.cmd[[
let g:airline_skip_empty_sections = 1
let g:airline#extensions#virtualenv#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#branch#vcs_priority = ["git", "mercurial"]
let g:airline#extensions#vimtex#enabled = 1
let g:airline#extensions#vimtex#left = "{"
let g:airline#extensions#vimtex#right = "}"
let g:airline#extensions#fzf#enabled = 1
let g:airline#extensions#gutentags#enabled = 1
]]
-- vim.cmd('let g:airline#extensions#branch#displayed_head_limit = 10')
  -- to only show the tail, e.g. a branch 'feature/foo' becomes 'foo', use
  -- let g:airline#extensions#branch#format = 1
-- * truncate sha1 commits at this number of characters  >
-- vim.cmd('let g:airline#extensions#branch#sha1_len = 6')


vim.g.airline_powerline_fonts = 1

-- vim-airline
if not vim.fn.exists('g:airline_symbols') then
    vim.g.airline_symbols = {}
end

if vim.g.airline_powerline_fonts == nil then
    -- vim.cmd('let g:airline#extensions#tabline#left_sep = " "')
    -- vim.cmd('let g:airline#extensions#tabline#left_alt_sep = "|"')

    vim.g.airline_right_alt_sep     = "«"
    vim.g.airline_left_sep          = "▶"
    vim.g.airline_left_alt_sep      = "»"
    vim.g.airline_right_sep         = "◀"

    vim.cmd([[
        let g:airline#extensions#branch#prefix     = ""
        let g:airline#extensions#readonly#symbol   = "⊘"
        let g:airline#extensions#linecolumn#prefix = "¶"
        let g:airline#extensions#paste#symbol      = "ρ"
        ]])


    -- vim.g.airline_symbols.linenr    = "␊"
    vim.g.airline_symbols.branch    = "⎇"
    vim.g.airline_symbols.paste     = "ρ"
    -- vim.g.airline_symbols.paste     = "Þ"
    -- vim.g.airline_symbols.paste     = "∥"
    vim.g.airline_symbols.whitespace = " "--"Ξ"
    vim.g.airline_symbols.spell = 'Ꞩ'
    vim.g.airline_symbols.notexists = 'Ɇ'
    vim.g.airline_symbols.crypt = '🔒'
else
-- vim.cmd("let g:airline#extensions#tabline#left_sep = ' '")
-- vim.cmd("let g:airline#extensions#tabline#left_alt_sep = '|'")
    vim.cmd([[
        let g:airline#extensions#tabline#left_sep = ""
        let g:airline#extensions#tabline#left_alt_sep = ''
        ]])

    --
    --
    -- powerline symbols
    vim.g.airline_left_alt_sep = ''
    vim.g.airline_right_alt_sep = ''
    vim.g.airline_symbols.branch = ''
    vim.g.airline_symbols.readonly = ''
    vim.g.airline_symbols.linenr = ''
--     " powerline symbols
    -- vim.g.airline_symbols.linenr = '☰'
    vim.g.airline_symbols.dirty='⚡'
    -- non powerlne
    -- vim.g.airline_symbols.linenr    = "␊"
    vim.g.airline_symbols.maxlinenr    = "ρ"
    vim.g.airline_symbols.colnr    = "∥"
    -- vim.g.airline_symbols.branch    = "⎇"
    -- vim.g.airline_symbols.paste     = "ρ"
    -- vim.g.airline_symbols.paste     = "Þ"
    -- vim.g.airline_symbols.paste     = "∥"
    -- vim.g.airline_symbols.whitespace = "Ξ"
    -- vim.g.airline_symbols.spell = 'Ꞩ'
    -- vim.g.airline_symbols.notexists = 'Ɇ'


    vim.g.airline_left_sep =''
    vim.g.airline_right_sep = ''
end
vim.g.airline_section_warning = '%{strftime("%H:%M")}'
-- vim.g.airline_section
