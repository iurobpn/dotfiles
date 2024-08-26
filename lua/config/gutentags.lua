-- gutentags configuration

vim.g.gutentags_enabled=1
vim.g.gutentags_project_root = {'CMakeLists.txt', 'Makefile', '.root', 'root.tex', 'rel.tex', 'pres.tex', '.prj_root', '.git'}
-- let g:gutentags_modules = ['ctags', 'cscope']
vim.g.gutentags_modules = {'ctags'}
vim.g.gutentags_ctags_tagfile = '.tags'
-- vim.g.gutentags_trace=1
vim.g.gutentags_dont_load=0
vim.g.gutentags_cache_dir='.gtags'



vim.cmd("set statusline+=%{gutentags#statusline()}")
