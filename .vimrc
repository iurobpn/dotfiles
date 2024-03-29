
if has('vim_starting')
	set nocompatible               " Be iMproved
endif

let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')

if !filereadable(vimplug_exists)
	if !executable("curl")
		echoerr "You have to install curl or first install vim-plug yourself!"
		execute "q!"
	endif
	echo "Installing Vim-Plug..."
	echo ""
	silent !\curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	let g:not_finish_vimplug = "yes"

	autocmd VimEnter * PlugInstall
endif

" this is to receive CTRL-S and CTRL-Q
silent !stty -ixon > /dev/null 2>/dev/null
set encoding=utf-8
" set term=screen-256color
if has('vim')
	set term=xterm-256color
endif

" disable vi compatibility (emulation of old bugs)
set nocompatible
set exrc

" Default highlight is better than polyglot
let g:polyglot_disabled = ['python','latex']


" setup Vundle (run :PluginInstald to install plugins)
filetype off
" set rtp+=~/.vim/bundle/Vundle.vim
call plug#begin()

if !exists('g:vscode')
	Plug 'github/copilot.vim'
	Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
	" plugin to enable git integration
	Plug 'tpope/vim-fugitive'
	Plug 'airblade/vim-gitgutter'
	Plug 'lazywei/vim-matlab'
	Plug 'mileszs/ack.vim'
	Plug 'sheerun/vim-polyglot'
	Plug 'mbbill/undotree'
	Plug 'roxma/nvim-yarp'
	if has('nvim')
		Plug 'roxma/vim-hug-neovim-rpc'
	endif
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	"Status bar plugin
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'

	" notes
	Plug 'vimwiki/vimwiki'

	" plugin de javascript
	Plug 'pangloss/vim-javascript'

	" enable NERD tree - allows you to explore your filesystem
	" and to open files and directories.
	Plug 'scrooloose/nerdtree'

	"enable enhanced c++ syntax and highlighting
	Plug 'octol/vim-cpp-enhanced-highlight'

	" create an outline of tags in current file/buffer
	Plug 'ludovicchabant/vim-gutentags'
	Plug 'majutsushi/tagbar'
	Plug 'liuchengxu/vista.vim'

	Plug 'lervag/vimtex'

	" Plug 'klen/python-mode'
	Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
	Plug 'Vimjas/vim-python-pep8-indent'
	Plug 'jeetsukumaran/vim-pythonsense'
	Plug 'jupyter-vim/jupyter-vim'

	Plug 'raimon49/requirements.txt.vim', {'for': 'requirements'}
	Plug 'shirk/vim-gas'

	Plug 'morhetz/gruvbox'

	Plug 'junegunn/vim-easy-align'
	if isdirectory('/usr/local/opt/fzf')
	  Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
	else
	  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
	  Plug 'junegunn/fzf.vim'
	endif
	"
	" javascript
	" Javascript Bundle
	Plug 'jelera/vim-javascript-syntax'

	" Plug 'beloglazov/vim-online-thesaurus'
	Plug 'Ben201310/online-thesaurus-vim'
	Plug 'reedes/vim-wordy'
	Plug 'ron89/thesaurus_query.vim'
	Plug 'rhysd/vim-grammarous'

	"" Lua Bundle
	Plug 'xolox/vim-lua-ftplugin'
	Plug 'xolox/vim-lua-inspect'

	" php
	Plug 'arnaud-lb/vim-php-namespace'
	Plug 'christoomey/vim-tmux-navigator'

	Plug 'jiangmiao/auto-pairs'
	if has('nvim')
		Plug 'Shougo/vimproc.vim', {'do' : 'make'}
	endif

	Plug 'github/copilot.vim'
	Plug 'fladson/vim-kitty'
endif

Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'machakann/vim-swap'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Plugin for toggling comments
Plug 'tomtom/tcomment_vim'


Plug 'xolox/vim-misc'





" Plug 'numirias/semshi'
" end of Vundle initialization
call plug#end()


filetype plugin indent on
filetype on

" turn syntax highlighting on
syntax on

" automaticly rereads a file change outside vim
set autoread
" highlights cursor line
set cursorline

set backspace=indent,eol,start

" size of command line history
set history=200

" autocomplete words
set complete+=kspell

" use indentation of previous line
set autoindent

" use intelligent indentation for C
" set smartindent
set cindent

" configure tabwidth and insert spaces instead of tabs
set tabstop=4        " tab width is 4 spaces
set shiftwidth=4     " indent also with 4 spaces
" set expandtab        " expand tabs to spaces

" wrap lines at 120 chars.
" set textwidth=120

" show column number
set ruler

" turn line numbers on
set number

" highlight matching braces
set showmatch

" show chars on lower bar as they are beeing pressed
set showcmd

set showmode

" enhanced tab completion on commands
set wildmenu
set wildmode=longest:list,full
set colorcolumn=75

" buffer can be in the background if it’s modified
set hidden

" Search
set hlsearch     " highlight matches
set incsearch    " incremental searching
set ignorecase   " searches are case insensitive...
" set smartcase    " ... unless they contain at least one capital letter

set completeopt=menuone,menu,longest,preview


set wildignore+=*/tmp/*,*.so,*.swp,*.zip

" set path variable to current directory (from which you launched vim)
" and to all directories under current directory recursively
" set path+=$PWD/**
set path+=/usr/include/*
set path+=/usr/*/include/
set path+=/usr/lib/gcc/x86_64-linux-gnu/8/include
set path+=/home/gagarin/casadi/include
set path+=/home/gagarin/hdd/opt/boost_1_79_0

set pastetoggle=<F2>
set runtimepath+=~/.vim/plugged/vim-snippets/UltiSnips


" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" relative number only on normal mode
if !exists('g:vscode')
    " VSCode extension
else
	augroup every
	  autocmd!
	  au InsertEnter * set norelativenumber
	  au InsertLeave * set relativenumber
	augroup END
endif

if has("persistent_undo")
    set undodir=$HOME/.undodir
    set undofile
endif

" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256
set t_ut=
if has("gui_running")
	set background=dark
	let g:gruvbox_italic=1
	colorscheme gruvbox
	" set background=dark
	" colorscheme duoduo
else
	set background=dark
	let g:gruvbox_italic=1
	colorscheme gruvbox
	hi Search cterm=underline ctermfg=LightMagenta ctermbg=NONE
	hi IncSearch cterm=NONE ctermfg=White ctermbg=DarkMagenta
	hi SpellBad cterm=underline ctermfg=DarkRed ctermbg=NONE

	" colorscheme duoduo
	" colorscheme material-monokai
	"
	let g:CSApprox_loaded = 1

	" IndentLine
	let g:indentLine_enabled = 1
	let g:indentLine_concealcursor = 0
	let g:indentLine_char = '┆'
	let g:indentLine_faster = 1
endif

if !exists('g:vscode')
	let g:gitgutter_enabled = 1
endif

" cscope
" set cscopetag

if !exists('g:vscode')
	set statusline+=%{gutentags#statusline()}
	let g:gutetags_enabled = 1
	let g:gutentags_project_root = ['root.tex', 'rel.tex', 'pres.tex', '.prj_root']
	" let g:gutentags_modules = ['ctags', 'cscope']
	let g:gutentags_modules = ['ctags']
	let g:gutentags_ctags_tagfile = '.tags'
	" let g:gutentags_trace = 1
endif

" How each level is indented and what to prepend.
" This could make the display more compact or more spacious.
" e.g., more compact: ["▸ ", ""]
" Note: this option only works the LSP executives, doesn't work for `:Vista ctags`.
" let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
" To enable fzf's preview window set g:vista_fzf_preview.
" The elements of g:vista_fzf_preview will be passed as arguments to fzf#vim#with_preview()
" For example:
if !exists('g:vscode')
	let g:vista_fzf_preview = ['right:50%']
	" Ensure you have installed some decent font to show these pretty symbols, then you can enable icon for the kind.
	let g:vista#renderer#enable_icon = 1
endif

" The default icons can't be suitable for all the filetypes, you can extend it as you wish.
" let g:vista#renderer#icons = {
" \   "function": "\uf794",
" \   "variable": "\uf71b",
" \  }




"" fzf.vim
" let $FZF_DEFAULT_COMMAND =  "find * -path '*/\.*' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null"



if !exists('g:vscode')
	" The Silver Searcher
	if executable('ag')
	  let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
	  set grepprg=ag\ --nogroup\ --nocolor
	endif
endif


" set spell spelllang=

"" no one is really happy until you have this shortcuts
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall


if !exists('g:vscode')
	if executable('ag')
	  let g:ackprg = 'ag --vimgrep --smart-case'
	endif
	cnoreabbrev ag Ack
	cnoreabbrev aG Ack
	cnoreabbrev Ag Ack
	cnoreabbrev AG Ack



	let g:vimwiki_list = [{'path': '~/Dropbox/vimwiki/',
			\ 'syntax': 'markdown', 'ext': '.md'},
			\ {'path': '~/git/phd_notes', 'syntax': 'markdown', 'ext': '.md'}]

	"Uncomment to override defaults:
	"let g:instant_markdown_slow = 1
	let g:instant_markdown_autostart = 0
	"let g:instant_markdown_open_to_the_world = 1
	let g:instant_markdown_allow_unsafe_content = 1
	"let g:instant_markdown_allow_external_content = 0
	let g:instant_markdown_mathjax = 1
	"let g:instant_markdown_logfile = '/tmp/instant_markdown.log'
	"let g:instant_markdown_autoscroll = 0
	"let g:instant_markdown_port = 8888
	"let g:instant_markdown_python = 1
endif

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
let g:UltiSnipsUsePythonVersion = 3
let g:UltiSnipsListSnippets = "<c-tab>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetsDir="~/.vim/UltiSnips/"
let g:UltiSnipsSnippetDirectories=['UltiSnips']
map <leader>cpp :edit ~/.vim/plugged/vim-snippets/snippets/cpp.snippets<CR>
map <leader>cpu :edit ~/.vim/plugged/vim-snippets/UltiSnips/cpp.snippets<CR>

" tnoremap <Esc> <C-\><C-n>
tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l
inoremap <A-h> <C-\><C-N><C-w>h
inoremap <A-j> <C-\><C-N><C-w>j
inoremap <A-k> <C-\><C-N><C-w>k
inoremap <A-l> <C-\><C-N><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l


" MAP SECTION

if !exists('g:vscode')
	if has('nvim')
		nmap <leader>t :terminal<CR>
	else
		nmap <leader>t :sh<CR>
	endif
endif

" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>
" eliminate trailing spaces on current line
nmap <leader>el :s/[ \t]\+$//<CR>
" eliminate trailing spaces on all lines
noremap <leader>ea :%s/[ \t]\+$//g<CR>``
" Capitalize all first letters in a title line
nmap <leader>u guu:s/\<./\u&/g<CR>,
nmap <leader>dy :.!date '+\%d/\%m/\%Y'<CR>
nmap <leader>de :.!date '+\%A \%d de \%B de \%Y - \%H:\%M'<CR>
nmap <leader>dt :.!date +\%T<CR>
nmap & ^
map gm :call cursor(0, virtcol('$')/2)<CR>
" nmap | \^

if !exists('g:vscode')
	" Fuzzy Finders maps
	nmap <leader>fm :Maps<CR>
	nmap <leader>fz :FZF<CR>
	nmap <leader>ff :Files<CR>
	nmap <leader>fb :Buffers<CR>
	nmap <leader>fw :Windows<CR>
	nmap <leader>ft :Tags<CR>
	nmap <leader>fl :BTags<CR>
	" nmap <leader>f' :Marks<CR>
	nmap <leader>fh :History<CR>
	nmap <leader>fs :Snippets<CR>
	nmap <leader>fc :Commands<CR>
	nmap - :FZF<CR>
endif

noremap çd :cd %:p:h
noremap çl :lcd %:p:h

" switch ' and `, since ` is more usefull and uses more keys (<shift>`<space>)
nnoremap ' `
nnoremap ` '
" nmap <leader>


if !exists('g:vscode')
	" ripgrep
	if executable('rg')
	  let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
	  set grepprg=rg\ --vimgrep
	  command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
	endif
endif

" nnoremap <silent> <leader>b :Buffers<CR>
" nnoremap <silent> <leader>e :FZF -m<CR>

" neocomplete config
" let g:neocomplete#enable_at_startup = 1

" Use deoplete.
" let g:deoplete#enable_at_startup = 1
" let g:deoplete#enable_yarp = 1
" call deoplete#custom#option('num_processes', 1)
" Change clang binary path
" call deoplete#custom#var('clangx', 'clang_binary', '/usr/bin/clang')


if !exists('g:vscode')
	" airline status bar
	let g:airline#extensions#tabline#enabled = 1
	let g:airline#extensions#tabline#left_sep = ' '
	let g:airline#extensions#tabline#left_alt_sep = '|'
	let g:airline#extensions#tabline#formatter = 'unique_tail'
	" let g:airline_left_sep='>'
	let g:airline_theme='distinguished'
	" vim-airline
	" let g:airline_theme = 'powerlineish'
	let g:airline#extensions#syntastic#enabled = 1
	let g:airline#extensions#ale#enabled = 1
	let g:airline#extensions#branch#enabled = 1
	let g:airline#extensions#tabline#enabled = 1
	let g:airline#extensions#tagbar#enabled = 1
	let g:airline_skip_empty_sections = 1
	let g:airline#extensions#virtualenv#enabled = 1

	" vim-airline
	if !exists('g:airline_symbols')
	  let g:airline_symbols = {}
	endif

	if !exists('g:airline_powerline_fonts')
	  let g:airline#extensions#tabline#left_sep = ' '
	  let g:airline#extensions#tabline#left_alt_sep = '|'
	  let g:airline_left_sep          = '▶'
	  let g:airline_left_alt_sep      = '»'
	  let g:airline_right_sep         = '◀'
	  let g:airline_right_alt_sep     = '«'
	  let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
	  let g:airline#extensions#readonly#symbol   = '⊘'
	  let g:airline#extensions#linecolumn#prefix = '¶'
	  let g:airline#extensions#paste#symbol      = 'ρ'
	  let g:airline_symbols.linenr    = '␊'
	  let g:airline_symbols.branch    = '⎇'
	  let g:airline_symbols.paste     = 'ρ'
	  let g:airline_symbols.paste     = 'Þ'
	  let g:airline_symbols.paste     = '∥'
	  let g:airline_symbols.whitespace = 'Ξ'
	else
	  let g:airline#extensions#tabline#left_sep = ''
	  let g:airline#extensions#tabline#left_alt_sep = ''

	  " powerline symbols
	  let g:airline_left_sep = ''
	  let g:airline_left_alt_sep = ''
	  let g:airline_right_sep = ''
	  let g:airline_right_alt_sep = ''
	  let g:airline_symbols.branch = ''
	  let g:airline_symbols.readonly = ''
	  let g:airline_symbols.linenr = ''
	endif
	" Syntax highlight
	let python_highlight_all = 1

	" grep.vim
	nnoremap <silent> <leader>j :Rgrep<CR>
	let Grep_Default_Options = '-IR'
	let Grep_Skip_Files = '*.log *.db'
	let Grep_Skip_Dirs = '.git node_modules'


	" python jedi configuration
	let g:pymode=1
	let g:pymode_warnings = 1


	" vimshell.vim
	" let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
	" let g:vimshell_prompt =  '$ '
	"
	" " terminal emulation
	" if has('nvim')
	"   nnoremap <silent> <leader>sh :terminal<CR>
	" else
	"   nnoremap <silent> <leader>sh :VimShellCreate<CR>
	" endif

	set grepprg=grep\ -nH\ $*
	let g:vimtex_enabled=1
	let g:vimtex_compiler_enabled=1
	if has('nvim')
		let g:vimtex_compiler_progname='nvr'
	endif
	let g:vimtex_compiler_method='latexmk'
	" let g:vimtex_compiler_latexmk = {'callback' : 0}
	" Instead do this
	let g:vimtex_complete_enabled=1
	let g:vimtex_complete_close_braces=1
	let g:vimtex_imaps_enabled=1
	" let g:vimtex_imaps_leader='-'
	let g:vimtex_indent_enabled=1
	let g:vimtex_indent_bib_enabled=1
	" *g:vimtex_index_hide_line_numbers*
	let g:vimtex_mappings_enabled=1
	let g:vimtex_fold_enabled=0
	let g:vimtex_view_method = 'zathura'
	" let g:vimtex_quickfix_open_on_warning = 1
	" let g:vimtex_quickfix_ignore_filters = {
	"   \ 'default' : 0,
	"   \ 'undefined_reference' : 1,
	"   \ 'multiply_defined_references' : 1,
	"   \}
	let g:vimtex_quickfix_enabled=0
	let g:vimtex_syntax_conceal_disable=1

	augroup latex_grp
		autocmd BufReadPre *.tex let b:vimtex_main = 'root.tex'
	augroup END


	"" Git
	noremap <Leader>ga :Gwrite<CR>
	noremap <Leader>gc :Gcommit<CR>
	noremap <Leader>gsh :Gpush<CR>
	noremap <Leader>gll :Gpull<CR>
	noremap <Leader>gs :Gstatus<CR>
	noremap <Leader>gb :Gblame<CR>
	noremap <Leader>gd :Gvdiff<CR>
	noremap <Leader>gr :Gremove<CR>

endif


"" Split
noremap <Leader>h <ESC>:<C-u>split<CR>
noremap <Leader>v <ESC>:<C-u>vsplit<CR>

" session management
" nnoremap <leader>so :OpenSession<Space>
" nnoremap <leader>ss :SaveSession<Space>
" nnoremap <leader>sd :DeleteSession<CR>
" nnoremap <leader>sc :CloseSession<CR>
noremap <leader>b <ESC>:bdelete<CR>
nnoremap <C-S-Left> <ESC>:bprev<CR>
nnoremap <C-S-Right> <ESC>:bnext<CR>
nnoremap <C-S-Up> <C-w><Up>
nnoremap <C-S-Down> <C-w><Down>

if !exists('g:vscode')
	augroup group_python
		autocmd!
		autocmd Filetype python setl shiftwidth=4 smarttab softtabstop=4 tabstop=8 expandtab
		  \ formatoptions+=croq softtabstop=4
		  \ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
	augroup END

	" c
	autocmd FileType c setlocal tabstop=4 shiftwidth=4
	autocmd FileType cpp setlocal tabstop=4 shiftwidth=4


	" html
	" for html files, 2 spaces
	autocmd Filetype html setlocal ts=2 sw=2 expandtab

	" javascript
	let g:javascript_enable_domhtmlcss = 1

	" vim-javascript
	augroup vimrc-javascript
	  autocmd!
	  autocmd FileType javascript set tabstop=4|set shiftwidth=4|set expandtab softtabstop=4
	augroup END

	augroup asms
		autocmd!
		au BufRead,BufNewFile *.s set syntax=gas
		" associate *.s with gas filetype
	augroup END

	augroup xml_grp
		autocmd!
		au BufRead,BufNewFile *.launch,*.sdf setfiletype xml
	augroup END


	" augroup ccpp
	" 	autocmd!
	" 	autocmd filetype cpp call SetCppTags()
	" 	autocmd filetype c call SetCTags()
	" augroup END

	"" make/cmake
	augroup vimrc-make-cmake
	  autocmd!
	  autocmd FileType make setlocal noexpandtab
	  autocmd BufNewFile,BufRead CMakeLists.txt setlocal filetype=cmake
	augroup END


	" disable Linux Kernel Coding Style
	let g:loaded_linuxsty=1


	" set spell check
	"autocmd BufRead,BufNewFile *.txt setlocal spell spelllang=pt
	"autocmd FileType gitcommit set spell spelllang=en
	"autocmd FileType txt setlocal spell spelllang=pt
	" set spell spelllang=en
	let g:languagetool_jar='~/opt/LanguageTool-4.4/languagetool-commandline.jar'
	let g:languagetool_lang='en'

	let g:grammarous#use_vim_spelllang = 1
	" let g:grammarous#hooks = {}
	" function! g:grammarous#hooks.on_check(errs) abort
	"     nmap <buffer><C-n> <Plug>(grammarous-move-to-next-error)
	"     nmap <buffer><C-p> <Plug>(grammarous-move-to-previous-error)
	" endfunction
	"
	" function! g:grammarous#hooks.on_reset(errs) abort
	"     nunmap <buffer><C-n>
	"     nunmap <buffer><C-p>
	" endfunction
	" let g:grammarous#languagetool_cmd = 'java -jar ~/opt/LanguageTool-4.4/languagetool-commandline.jar'
	let g:grammarous#show_first_error = 1

endif

"This unsets the "last search pattern" register by hitting return
" nnoremap <CR> :noh<CR><CR>

" DoxygenToolkit
" let g:DoxygenToolkit_briefTag_pre="@Synopsis  "
" let g:DoxygenToolkit_paramTag_pre="@Param "
" let g:DoxygenToolkit_returnTag="@Returns   "
" let g:DoxygenToolkit_blockHeader="-------------------------------"
" let g:DoxygenToolkit_blockFooter="---------------------------------"
" let g:DoxygenToolkit_authorName="Iuro Nascimento <iurobpn@gmail.com>"
"let g:DoxygenToolkit_licenseTag="MIT"
" let g:load_doxygen_syntax=1

" function! FindBibTex()
"
" endfunction
" TODO  write code for running the pdflatex and to enter the bib file
" expand('%') returns the current filename
" execute "edit +" . linenumber . " " . filename

" MyNext() and MyPrev(): Movement between tabs OR buffers
function! MyNext()
    if exists( '*tabpagenr' ) && tabpagenr('$') != 1
        " Tab support && tabs open
        normal gt
    else
        " No tab support, or no tabs open
        execute ":bnext"
    endif
endfunction
function! MyPrev()
    if exists( '*tabpagenr' ) && tabpagenr('$') != '1'
        " Tab support && tabs open
        normal gT
    else
        " No tab support, or no tabs open
        execute ":bprev"
    endif
endfunction

function! GetAllSnippets()
  call UltiSnips#SnippetsInCurrentScope(1)
  let list = []
  for [key, info] in items(g:current_ulti_dict_info)
    let parts = split(info.location, ':')
    call add(list, {
      \"key": key,
      \"path": parts[0],
      \"linenr": parts[1],
      \"description": info.description,
      \})
  endfor
  return list
endfunction

" builds the getter and setter of the parameter in the current line
function! BuildGetterSetter()
	normal ma
	let line = getline('.')
	let parts = split(line, ' ')
	" regular expressions to capture needed information
	let regvar = '\(\h\w*\)'
	let any = '.*'
	let regind = '\(\s\+\)'
	" type of variable
	let type = substitute(parts[0], regind . regvar,'\2',"")
	echo strlen(type)
	" spaces begore variable
	let ind = substitute(parts[0], regind . regvar,'\1',"")
	" variable to obtain get and set
	let var = substitute(parts[1], regvar . any,'\1',"")
	let n = strlen(var)
	" capitalize variable
	let Var = toupper(var[0]) . var[1:n]

	" obtain getter and setter
	let getter = ind . type . ' get' . Var . '();'
	let setter =  ind . 'void set' . Var . '(' . type . ' '. var . ');'
	" find position to insert getter and setter
	call search('public:','sw')
	let line_pos = getpos('.')
	let line_num = line_pos[1]
	silent normal! o
	silent normal! o
	silent normal! o
	call setline(line_num+1, getter)
	call setline(line_num+2, setter)
	normal 'a
endfunction

nnoremap <leader>sg :call BuildGetterSetter()<CR>


if !exists('g:vscode')
	" automatically open and close the popup menu / preview window
	au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif

	" tags definition
	" function SetCppTags()
	" 	" set tags+=tags;                     " search tags automagically
	" 	set tags+=/home/gagarin/.vim/tags/cpp/boost_1.60
	" endfunction
	" function SetCTags()
	" 	set tags+=/home/gagarin/.vim/tags/cpp/stdlib_5.3.0_cpp
	" 	set tags+=/home/gagarin/.vim/tags/cpp/stl_5.3.0_cpp
	" endfunction


	" close vim if the only window left open is a NERDTree
	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif


	" Tagbar
	let g:tagbar_autofocus = 1

	" (F6) create doxygen comment
	nmap <F10> <ESC>:Dox<CR>
	nmap <F9> <ESC>:DoxAuthor<CR>
endif

" (CTRL-B) Build project
nmap <leader>m :make<CR>
"nmap <C-b> :make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- uImage<CR>
"nmap <C-b> :make <CR>
" nmap <C-b> :make<CR>
" imap <C-b> <c-o><c-b>
nnoremap <F7>  :make<CR>
inoremap <F7>  <c-o><F7>


if !exists('g:vscode')
	" (F9) Open file explorer
	noremap <silent> <F9> <ESC>:Explore<CR>

	" (F12) buffer explorer
	" noremap <silent> <F12> <ESC>:ToggleBufExplorer<CR>
	noremap <silent> <F12> <ESC>:Buffers<CR>


	" (CTRL-T, CTRL-right, CTRL-left, L, H) tabs/buffer management
	nnoremap <C-t> <ESC>:tabnew<CR>
	nnoremap <C-q> <ESC>:tabclose<CR>
	" map L <ESC>:tabnext<CR>
	" map H <ESC>:tabprev<CR>
	nnoremap <C-Right>  <ESC>:call MyNext()<CR>
	nnoremap <C-Left>  <ESC>:call MyPrev()<CR>

	" (CTRL-r) open nerd tree
	"" NERDTree configuration
	let g:NERDTreeChDirMode=2
	let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
	let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
	let g:NERDTreeShowBookmarks=1
	let g:nerdtree_tabs_focus_on_files=1
	let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
	let g:NERDTreeWinSize = 50
	" set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
	" nnoremap <silent> <F2> <ESC>:NERDTreeFind<CR>
	nnoremap <silent> <F3> <ESC>:NERDTreeToggle<CR>
	" nnoremap <silent> <F4> :TagbarToggle<CR>
	nnoremap <silent> <F4> :Vista!!<CR>
	nnoremap <silent> <F6> :Vista finder<CR>
	nnoremap <silent> ]v :Vista focus<CR>
	nnoremap <silent> <F5> :call ToogleSpell()<CR>


	" (CTRL_A, CTRL-I) change to *.C/*.H file
	nnoremap <C-s> :A<CR>
	" nnoremap <C-i> <ESC>:IH<CR>

	" (CTRL-P) go back to previous tag
	map <C-n> <ESC>:pop<CR>

	" (CTRL-W ]) Open tag under cursor in new tab
	nnoremap <C-W>] <C-W>]:tab split<CR>gT:q<CR>gt
endif

nmap ; :
nmap <silent> , :noh<CR>

" imap <F3> <c-x><c-o>

noremap <leader>y "+y<CR>
noremap <leader>a "+gP<CR>
noremap <leader>x "+x<CR>

" nmap <C-y>k :SyntasticCheck<CR>
" nmap <C-y>t :SyntasticToglleMode<CR>
" nmap <C-y>r :SyntasticReset<CR>
" nmap <C-y>e :Errors<CR>
" nmap <C-y>c :lclose<CR>
" nmap <C-y>n :lnext<CR>
" nmap <C-y>p :lprevious<CR>


if !exists('g:vscode')
	" quickfix make next error
	nmap <C-l>n :cn<CR>
	nmap <C-l>o :copen<CR>
	nmap <C-l>w :cwindow<CR>
	nmap <C-l>c :cclose<CR>
endif

" conquegdb mappings
" nmap <F8> \c
" imap <F8> continue<CR>
" nmap <F6> \n
" imap <F6> next<CR>
" nmap <F5> \s
" imap <F5> step<CR>

" salva
cmap w!! w !sudo tee % >/dev/null


" autopairs
let g:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"', '`':'`', '$':'$'}

" Automatically open, but do not go to (if there are errors) the quickfix /
" location list window, or close it when is has become empty.
"
" Note: Must allow nesting of autocmds to enable any customizations for quickfix
" buffers.
" Note: Normally, :cwindow jumps to the quickfix window if the command opens it
" (but not if it's already open). However, as part of the autocmd, this doesn't
" seem to happen.

if !exists('g:vscode')
	autocmd QuickFixCmdPost [^l]* nested cwindow
	autocmd QuickFixCmdPost    l* nested lwindow

	" autocmd StdinReadPre * let s:std_in=1
	" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif


	" create new function
	" map q Ivoid <esc>A(void)<CR>{<CR><CR>}<up><tab>

	augroup newFileDetection
		autocmd CursorMovedI * call CheckFileType()
	augroup END

	function CheckFileType()
		if exists("b:countCheck") == 0
			let b:countCheck = 0
		endif
		let b:countCheck += 1
		" Don't start detecting until approx. 20 chars.
		if &filetype == "" && b:countCheck > 20 && b:countCheck < 200
			filetype detect
			" If we’ve exceeded the count threshold (200), OR a filetype has been detected
			" delete the autocmd!
		elseif b:countCheck >= 200 || &filetype != ""
			autocmd! newFileDetection
		endif
	endfunction

	function ToogleSpell()
		if &spelllang == 'en'
			set spell spelllang=pt_br
		elseif &spelllang == 'pt_br'
			set spell spelllang=
		else
			set spell spelllang=en
		endif
	endfunction
	command ToogleSpell :call ToogleSpell()<CR>
	" hi Funtion ctermfg=blue
	" set rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/

	" Always show statusline
	" set laststatus=2

	let g:session_autoload = 'no'

	au BufRead /tmp/mutt-* set tw=72
	augroup filetypedetect
	  " Mail
	  autocmd BufRead,BufNewFile *mutt-*              setfiletype mail
	augroup END

	" python stuff
	" au BufNewFile,BufRead *.js, *.html, *.css
	"     \ set tabstop=2
	"     \ set softtabstop=2
	"     \ set shiftwidth=2

	" au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

	" if has("vim")
		" Use tab for trigger completion with characters ahead and navigate.
		" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
		" NOTE: There's always complete item selected by default, you may want to enable
		" no select by `"suggest.noselect": true` in your configuration file.
		" other plugin before putting this into your config.
		
	function! CheckBackspace() abort
	  let col = col('.') - 1
	  return !col || getline('.')[col - 1]  =~# '\s'
	endfunction

	" May need for Vim (not Neovim) since coc.nvim calculates byte offset by count
	" utf-8 byte sequence
	set encoding=utf-8
	" Some servers have issues with backup files, see #649
	set nobackup
	set nowritebackup

	" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
	" delays and poor user experience
	set updatetime=300

	" Always show the signcolumn, otherwise it would shift the text each time
	" diagnostics appear/become resolved
	set signcolumn=yes

	" Use tab for trigger completion with characters ahead and navigate
	" NOTE: There's always complete item selected by default, you may want to enable
	" no select by `"suggest.noselect": true` in your configuration file
	" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
	" other plugin before putting this into your config
	inoremap <silent><expr> <TAB>
		  \ coc#pum#visible() ? coc#pum#next(1) :
		  \ CheckBackspace() ? "\<Tab>" :
		  \ coc#refresh()
	inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

	" Make <CR> to accept selected completion item or notify coc.nvim to format
	" <C-g>u breaks current undo, please make your own choice
	inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
								  \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

	function! CheckBackspace() abort
	  let col = col('.') - 1
	  return !col || getline('.')[col - 1]  =~# '\s'
	endfunction

	" Use <c-space> to trigger completion
	if has('nvim')
	  inoremap <silent><expr> <c-space> coc#refresh()
	else
	  inoremap <silent><expr> <c-@> coc#refresh()
	endif

	" Use `[g` and `]g` to navigate diagnostics
	" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
	nmap <silent> [g <Plug>(coc-diagnostic-prev)
	nmap <silent> ]g <Plug>(coc-diagnostic-next)

	" GoTo code navigation
	nmap <silent> gd <Plug>(coc-definition)
	nmap <silent> gy <Plug>(coc-type-definition)
	nmap <silent> gi <Plug>(coc-implementation)
	nmap <silent> gr <Plug>(coc-references)

	" Use K to show documentation in preview window
	nnoremap <silent> K :call ShowDocumentation()<CR>

	function! ShowDocumentation()
	  if CocAction('hasProvider', 'hover')
		call CocActionAsync('doHover')
	  else
		call feedkeys('K', 'in')
	  endif
	endfunction

	" Highlight the symbol and its references when holding the cursor
	autocmd CursorHold * silent call CocActionAsync('highlight')

	" Symbol renaming
	nmap <leader>rn <Plug>(coc-rename)

	" Formatting selected code
	xmap <leader>f  <Plug>(coc-format-selected)
	nmap <leader>f  <Plug>(coc-format-selected)

	augroup mygroup
	  autocmd!
	  " Setup formatexpr specified filetype(s)
	  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
	  " Update signature help on jump placeholder
	  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
	augroup end

	" Applying code actions to the selected code block
	" Example: `<leader>aap` for current paragraph
	xmap <leader>a  <Plug>(coc-codeaction-selected)
	nmap <leader>a  <Plug>(coc-codeaction-selected)

	" Remap keys for applying code actions at the cursor position
	nmap <leader>ac  <Plug>(coc-codeaction-cursor)
	" Remap keys for apply code actions affect whole buffer
	nmap <leader>as  <Plug>(coc-codeaction-source)
	" Apply the most preferred quickfix action to fix diagnostic on the current line
	nmap <leader>qf  <Plug>(coc-fix-current)

	" Remap keys for applying refactor code actions
	nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
	xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
	nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

	" Run the Code Lens action on the current line
	nmap <leader>cl  <Plug>(coc-codelens-action)

	" Map function and class text objects
	" NOTE: Requires 'textDocument.documentSymbol' support from the language server
	xmap if <Plug>(coc-funcobj-i)
	omap if <Plug>(coc-funcobj-i)
	xmap af <Plug>(coc-funcobj-a)
	omap af <Plug>(coc-funcobj-a)
	xmap ic <Plug>(coc-classobj-i)
	omap ic <Plug>(coc-classobj-i)
	xmap ac <Plug>(coc-classobj-a)
	omap ac <Plug>(coc-classobj-a)

	" Remap <C-f> and <C-b> to scroll float windows/popups
	if has('nvim-0.4.0') || has('patch-8.2.0750')
	  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
	  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
	  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
	  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
	  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
	  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
	endif

	" Use CTRL-S for selections ranges
	" Requires 'textDocument/selectionRange' support of language server
	nmap <silent> <C-s> <Plug>(coc-range-select)
	xmap <silent> <C-s> <Plug>(coc-range-select)

	" Add `:Format` command to format current buffer
	command! -nargs=0 Format :call CocActionAsync('format')

	" Add `:Fold` command to fold current buffer
	command! -nargs=? Fold :call     CocAction('fold', <f-args>)

	" Add `:OR` command for organize imports of the current buffer
	command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

	" Add (Neo)Vim's native statusline support
	" NOTE: Please see `:h coc-status` for integrations with external plugins that
	" provide custom statusline: lightline.vim, vim-airline
	set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

	" Mappings for CoCList
	" Show all diagnostics
	nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
	" Manage extensions
	nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
	" Show commands
	nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
	" Find symbol of current document
	nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
	" Search workspace symbols
	nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
	" Do default action for next item
	nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
	" Do default action for previous item
	nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
	" Resume latest coc list
	nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>


	function! VimwikiFindIncompleteTasks()
	  lvimgrep /- \[ \]/ %:p
	  lopen
	endfunction

	function! VimwikiFindAllIncompleteTasks()
	  VimwikiSearch /- \[ \]/
	  lopen
	endfunction

	nmap <Leader>wa :call VimwikiFindAllIncompleteTasks()<CR>
	nmap <Leader>wx :call VimwikiFindIncompleteTasks()<CR>

	noremap <leader>pd <ESC>iimport ipdb; ipdb.set_trace()<CR>

	let g:indentLine_concealcursor = "inc"

	noremap <leader>mp :InstantMarkdownPreview<CR>
	noremap <leader>ms :InstantMarkdownStop<CR>
endif

set clipboard^=unnamed,unnamedplus

