-- vimtex configuration
-- vim.opt.grepprg='grep\\ -nH\\ $*'

vim.g.vimtex_enabled=1
vim.g.vimtex_view_method = 'zathura'
-- Or with a generic interface:
vim.g.vimtex_view_general_viewer = 'okular'
vim.g.vimtex_view_general_options = '--unique file:@pdf\\#src:@line@tex'

-- vim.g.vimtex_compiler_enabled=1
-- if vim.fn.has('nvim') then
--     vim.g.vimtex_compiler_progname='nvr'
-- end
-- let g:vimtex_compiler_latexmk = {'callback' : 0}
-- Instead do this
vim.g.vimtex_complete_enabled=1
vim.g.vimtex_complete_close_braces=1
vim.g.vimtex_imaps_enabled=1
vim.g.vimtex_imaps_leader='-'
vim.g.vimtex_indent_enabled=1
vim.g.vimtex_indent_bib_enabled=1
-- *g.vimtex_index_hide_line_numbers*

vim.cmd([[augroup latex_grp
            autocmd BufReadPre *.tex let b:vimtex_main = 'root.tex'
augroup END]])

