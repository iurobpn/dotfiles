-- gutentags configuration

vim.g.gutentags_enabled=1
vim.g.gutentags_project_root = {'CMakeLists.txt', 'Makefile', '.root', 'root.tex', 'rel.tex', 'pres.tex', '.prj_root', '.git'}
-- let g:gutentags_modules = ['ctags', 'cscope']
vim.g.gutentags_modules = {'ctags'}
vim.g.gutentags_cache_dir = vim.fn.expand('~/.cache/vim/ctags/')
vim.g.gutentags_ctags_tagfile = '.tags'
-- vim.g.gutentags_trace=1
vim.g.gutentags_dont_load = 0
vim.g.gutentags_cache_dir = '.gtags'

vim.g.gutentags_ctags_extra_args = {
    '--tag-relative=yes',
    '--fields=+ailmnS',
}

vim.g.gutentags_ctags_exclude = {
    '*.git',
    '*.svg',
    '*.hg',
    '*/tests/*',
    'build',
    'dist',
    '*sites/*/files/*',
    'bin',
    'node_modules',
    'bower_components',
    'cache',
    'compiled',
    'docs',
    'example',
    'bundle',
    'vendor',
    '*.md',
    '*-lock.json',
    '*.lock',
    '*bundle*.js',
    '*build*.js',
    '.*rc*',
    '*.json',
    '*.min.*',
    '*.map',
    '*.bak',
    '*.zip',
    '*.pyc',
    '*.class',
    '*.sln',
    '*.Master',
    '*.csproj',
    '*.tmp',
    '*.csproj.user',
    '*.cache',
    '*.pdb',
    'tags*',
    'cscope.*',
    '*.css',
    '*.less',
    '*.scss',
    '*.exe', '*.dll',
    '*.mp3',
    '*.ogg',
    '*.flac',
    '*.swp',
    '*.swo',
    '*.bmp',
    '*.gif',
    '*.ico',
    '*.jpg',
    '*.png',
    '*.rar',
    '*.zip',
    '*.tar',
    '*.tar.*',
    '*.pdf',
    '*.doc',
    '*.docx',
    '*.ppt',
    '*.pptx',
    '*.xls',
    '*.xlsx',
    '*.out',
    '*.log',
    '*.avi',
    '*.aux',
    '*.bbl',
    '*.blg',
    '*.brf',
    '*.fls',
    '*.idx',
    '*.ilg',
    '*.ind',
    '*.lof',
    '*.lot',
    '*.nav',
    '*.out',
    '*.snm',
    '*.toc',
    '*.tdo',
    '*.tds',
    '*.tns',
    '*.tpm',
    '*.tps',
    '*.deps',
    '*.dvi',
    '*.fdb_latexmk',
    '*.fls',
    '*.synctex.gz',
    '*.hg',
    '*.svn',
}

vim.cmd("set statusline+=%{gutentags#statusline()}")
-- command! -nargs=0 GutentagsClearCache call system('rm ' . g:gutentags_cache_dir . '/*')
vim.api.nvim_create_user_command(
    'GutentagsClearCache',
    function()
        vim.fn.system('rm ' .. vim.g.gutentags_cache_dir .. '/*')
    end,
    { nargs = 0 }
)
vim.g.gutentags_generate_on_new = 1
vim.g.gutentags_generate_on_missing = 1
vim.g.gutentags_generate_on_write = 1
vim.g.gutentags_generate_on_empty_buffer = 0
