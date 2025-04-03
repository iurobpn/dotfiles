vim.g.vimtex_enabled=1
vim.g.vimtex_view_method = "zathura"
vim.g.vimtex_mappings_enabled=1
vim.g.vimtex_fold_enabled=1
vim.g.vimtex_syntax_conceal_disable=0

vim.g.vimtex_quickfix_enabled=1
vim.g.vimtex_quickfix_open_on_warning = 0
vim.g.vimtex_quickfix_ignore_filters = { 'Warning', 'Package', 'Missing character'}
vim.g.vimtex_quickfix_mode = 2
vim.g.vimtex_quickfix_autojump = 0

vim.g.vimtex_view_general_viewer = 'zathura'
vim.g.vimtex_view_general_options = '--unique file:@pdf\\#src:@line@tex'
vim.g.vimtex_complete_enabled=1
vim.g.vimtex_complete_close_braces=1
vim.g.vimtex_imaps_enabled=1
vim.g.vimtex_imaps_leader='-'
vim.g.vimtex_indent_enabled=1
vim.g.vimtex_indent_bib_enabled=1
-- *g.vimtex_index_hide_line_numbers*
-- vim.api.nvim_set_keymap('n', ':cn<leader>ll', ':VimtexCompile<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', ',<Left>', ':cprev<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', ',<Right>', ':cnext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', ',c', ':cclose<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', ',o', ':copen<CR>', { noremap = true, silent = true })

vim.cmd([[augroup latex_grp
autocmd BufReadPre *.tex let b:vimtex_main = 'root.tex'
augroup END]])
