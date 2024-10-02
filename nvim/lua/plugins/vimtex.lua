-- vimtex configuration
-- vim.opt.grepprg='grep\\ -nH\\ $*'



return {
    "lervag/vimtex",
    lazy = false,     -- we don't want to lazy load VimTeX
    -- tag = "v2.15", -- uncomment to pin to a specific release
    init = function()
        -- VimTeX configuration goes here, e.g.
        vim.g.vimtex_enabled=1
        vim.g.vimtex_view_method = "zathura"
        vim.g.vimtex_mappings_enabled=1
        vim.g.vimtex_fold_enabled=0
        vim.g.vimtex_syntax_conceal_disable=1
        vim.g.vimtex_quickfix_enabled=1
        vim.g.vimtex_quickfix_open_on_warning = 0
        vim.g.vimtex_quickfix_ignore_filters = { 'Warning', 'Package', 'Missing character'}
        vim.g.vimtex_quickfix_mode = 1
        vim.g.vimtex_view_general_viewer = 'okular'
        vim.g.vimtex_view_general_options = '--unique file:@pdf\\#src:@line@tex'
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
    end
}

