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
vim.g.vimtex_compiler_method='latexmk'
-- let g:vimtex_compiler_latexmk = {'callback' : 0}
-- Instead do this
vim.g.vimtex_complete_enabled=1
vim.g.vimtex_complete_close_braces=1
vim.g.vimtex_imaps_enabled=1
-- let g:vimtex_imaps_leader='-'
vim.g.vimtex_indent_enabled=1
vim.g.vimtex_indent_bib_enabled=1
-- *g.vimtex_index_hide_line_numbers*
vim.g.vimtex_mappings_enabled=1
vim.g.vimtex_fold_enabled=0
-- let g:vimtex_quickfix_open_on_warning = 1
-- let g:vimtex_quickfix_ignore_filters = {
--   \ 'default' : 0,
--   \ 'undefined_reference' : 1,
--   \ 'multiply_defined_references' : 1,
--   \}
vim.g.vimtex_quickfix_enabled=0
vim.g.vimtex_syntax_conceal_disable=1

vim.cmd([[augroup latex_grp
            autocmd BufReadPre *.tex let b:vimtex_main = 'root.tex'
augroup END]])

