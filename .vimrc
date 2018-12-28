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

" setup Vundle (run :PluginInstald to install plugins)
filetype off
" set rtp+=~/.vim/bundle/Vundle.vim
call plug#begin()

" plugin to enable Vundle
" Plug 'VundleVim/Vundle.vim'

" plugin to enable git integration
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'lazywei/vim-matlab'
" Plugin 'Valloric/YouCompleteMe'
" Plugin 'Shougo/neocomplete.vim'
" plugins to enable snippets support
Plug 'sheerun/vim-polyglot'
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'
Plug 'vim-scripts/grep.vim'
Plug 'vim-scripts/CSApprox'
Plug 'bronson/vim-trailing-whitespace'
"
"Deocomplete and dependencies
if has('nvim')
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
	Plug 'Shougo/deoplete.nvim'
	Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'roxma/nvim-yarp'

Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'

"Status bar plugin
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'rafi/awesome-vim-colorschemes'
" Plugin 'garbas/vim-snipmate'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" plugin de javascript
Plug 'pangloss/vim-javascript'

" enable NERD tree - allows you to explore your filesystem 
" and to open files and directories.
Plug 'scrooloose/nerdtree'

" enable CTRLP - Full path fuzzy file, buffer, mru, tag, 
" etc, finder for Vim
Plug 'ctrlpvim/ctrlp.vim'

Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'

" enable linuxsty - Linux Kernel Coding Style
Plug 'vivien/vim-addon-linux-coding-style'

" enable doxygen plugin
" Plugin 'mrtazz/DoxygenToolkit.vim'
" a more recent version on ~/.vim/plugins

" enable Wordpress Integration plugin
Plug 'vim-scripts/VimRepress'

" syntax checking plugin for Vim that runs files through external syntax
" checkers and displays any resulting errors to the user.
Plug 'scrooloose/syntastic'
" Syntax checking for latex
" Plug 'w0rp/ale'


" buffer explorer
Plug 'jlanzarotta/bufexplorer'

"enable GDB integration
Plug 'vim-scripts/Conque-GDB'

"enable enhanced c++ syntax and highlighting
Plug 'octol/vim-cpp-enhanced-highlight'

" create an outline of tags in current file/buffer
Plug 'majutsushi/tagbar'

" Plug 'roxma/nvim-completion-manager'
" Plugin 'craigemery/vim-autotag'

" Plugin for toggling comments
Plug 'tomtom/tcomment_vim'

" Plugin 'vim-latex/vim-latex'

Plug 'lervag/vimtex'

Plug 'klen/python-mode'

" Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
" Plugin 'powerline/powerline'

Plug 'davidhalter/jedi-vim'
Plug 'raimon49/requirements.txt.vim', {'for': 'requirements'}
Plug 'shirk/vim-gas'
Plug 'mattn/emmet-vim'

Plug 'morhetz/gruvbox'
Plug 'ludovicchabant/vim-gutentags'

Plug 'junegunn/vim-easy-align'
if isdirectory('/usr/local/opt/fzf')
  Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
else
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
  Plug 'junegunn/fzf.vim'
endif
"
" javascript
"" Javascript Bundle
Plug 'jelera/vim-javascript-syntax'


Plug 'xolox/vim-misc'
" lua
"" Lua Bundle
Plug 'xolox/vim-lua-ftplugin'
Plug 'xolox/vim-lua-inspect'


" php
"" PHP Bundle
Plug 'arnaud-lb/vim-php-namespace'

Plug 'jiangmiao/auto-pairs'
Plug 'christoomey/vim-tmux-navigator'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'xolox/vim-session'
" end of Vundle initialization
call plug#end()

" if has('termguicolors')
" 	set termguicolors
" endif

filetype plugin indent on
filetype on

set autoread

" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256
set t_ut=
if has("gui_running")
  if has("gui_mac") || has("gui_macvim")
    set guifont=Menlo:h12
    set transparency=7
  endif
else
  let g:CSApprox_loaded = 1

  " IndentLine
  let g:indentLine_enabled = 1
  let g:indentLine_concealcursor = 0
  let g:indentLine_char = '┆'
  let g:indentLine_faster = 1
endif

set statusline+=%{gutentags#statusline()}
let g:gutentags_project_root = ['root.tex','rel.tex', 'pres.tex']


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


"" fzf.vim
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
let $FZF_DEFAULT_COMMAND =  "find * -path '*/\.*' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null"

" The Silver Searcher
if executable('ag')
  let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
  set grepprg=ag\ --nogroup\ --nocolor
endif

if has('nvim')
	nmap <leader>t :terminal<CR>
else
	nmap <leader>t :sh<CR>
endif
" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>
nmap <leader>e :s/\s\+$//<CR>

" ripgrep
if executable('rg')
  let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
  set grepprg=rg\ --vimgrep
  command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
endif

" nnoremap <silent> <leader>b :Buffers<CR>
" nnoremap <silent> <leader>e :FZF -m<CR>

" neocomplete config
" let g:neocomplete#enable_at_startup = 1

" Use deoplete.
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_yarp = 1
call deoplete#custom#option('num_processes', 1)

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
" Default highlight is better than polyglot
let g:polyglot_disabled = ['python','latex']
let python_highlight_all = 1

" grep.vim
nnoremap <silent> <leader>f :Rgrep<CR>
let Grep_Default_Options = '-IR'
let Grep_Skip_Files = '*.log *.db'
let Grep_Skip_Dirs = '.git node_modules'


" python jedi configuration
" let g:jedi#completions_enabled = 1
let g:jedi#auto_initialization = 1
let g:jedi#force_py_version = 3
" jedi-vim
let g:jedi#popup_on_dot = 0
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = "<leader>d"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#rename_command = "<leader>r"
let g:jedi#show_call_signatures = "0"
let g:jedi#completions_command = "<C-N>"
let g:jedi#smart_auto_mappings = 0
let g:jedi#goto_command = "<C-]>"

" vimshell.vim
let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
let g:vimshell_prompt =  '$ '

" terminal emulation
if has('nvim')
  nnoremap <silent> <leader>sh :terminal<CR>
else
  nnoremap <silent> <leader>sh :VimShellCreate<CR>
endif

set grepprg=grep\ -nH\ $*
let g:vimtex_enabled=1
let g:vimtex_compiler_enabled=1
let g:vimtex_latexmk_progname='nvr'
let g:vimtex_compiler_method='latexmk'
" Instead do this
let g:vimtex_complete_enabled=1
let g:vimtex_complete_close_braces=1
let g:vimtex_imaps_enabled=1
let g:vimtex_imaps_leader='-'
let g:vimtex_indent_enabled=1
let g:vimtex_indent_bib_enabled=1
" *g:vimtex_index_hide_line_numbers*
let g:vimtex_mappings_enabled=1
let g:vimtex_view_method = 'zathura'
" let g:vimtex_compiler_latexmk = {'callback' : 0}

"" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

"" Git
noremap <Leader>ga :Gwrite<CR>
noremap <Leader>gc :Gcommit<CR>
noremap <Leader>gsh :Gpush<CR>
noremap <Leader>gll :Gpull<CR>
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gb :Gblame<CR>
noremap <Leader>gd :Gvdiff<CR>
noremap <Leader>gr :Gremove<CR>

" session management
nnoremap <leader>so :OpenSession<Space>
nnoremap <leader>ss :SaveSession<Space>
nnoremap <leader>sd :DeleteSession<CR>
nnoremap <leader>sc :CloseSession<CR>

nnoremap <C-S-Left> <C-w><Left>
nnoremap <C-S-Right> <C-w><Right>
nnoremap <C-S-Up> <C-w><Up>
nnoremap <C-S-Down> <C-w><Down>

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
	au BufRead,BufNewFile *.launch	 setfiletype xml
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

set backspace=indent,eol,start
set history=50
set relativenumber

" disable Linux Kernel Coding Style
let g:loaded_linuxsty=1

" set path variable to current directory (from which you launched vim)
" and to all directories under current directory recursively
set path=$PWD/**

" set spell check
"autocmd BufRead,BufNewFile *.txt setlocal spell spelllang=pt
"autocmd FileType gitcommit set spell spelllang=en
"autocmd FileType txt setlocal spell spelllang=pt
" set spell spelllang=en

" autocomplete words
set complete+=kspell

" use indentation of previous line
set autoindent

" use intelligent indentation for C
" set smartindent
set cindent

" configure tabwidth and insert spaces instead of tabs
set tabstop=8        " tab width is 4 spaces
set shiftwidth=8     " indent also with 4 spaces
" set expandtab        " expand tabs to spaces

" wrap lines at 120 chars.
" set textwidth=120

" show column number
set ruler

" turn syntax highlighting on
syntax on

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
set smartcase    " ... unless they contain at least one capital letter

"This unsets the "last search pattern" register by hitting return
" nnoremap <CR> :noh<CR><CR>

" DoxygenToolkit
" let g:DoxygenToolkit_briefTag_pre="@Synopsis  "
" let g:DoxygenToolkit_paramTag_pre="@Param "
" let g:DoxygenToolkit_returnTag="@Returns   "
" let g:DoxygenToolkit_blockHeader="-------------------------------"
" let g:DoxygenToolkit_blockFooter="---------------------------------"
let g:DoxygenToolkit_authorName="Iuro Nascimento <iurobpn@gmail.com>"
"let g:DoxygenToolkit_licenseTag="MIT"
let g:load_doxygen_syntax=1

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

" automatically open and close the popup menu / preview window      
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif      
set completeopt=menuone,menu,longest,preview

" cscope
set cscopetag

" tags definition
function SetCppTags()
	" set tags+=tags;                     " search tags automagically
	set tags+=/home/gagarin/.vim/tags/cpp/boost_1.60
endfunction
function SetCTags()
	set tags+=/home/gagarin/.vim/tags/cpp/stdlib_5.3.0_cpp
	set tags+=/home/gagarin/.vim/tags/cpp/stl_5.3.0_cpp
endfunction

" project tags
" let g:ProjTags = ["/opt/labs/ex/02/linux/"]
" let g:ProjTags = [["/opt/labs/ex/", "/opt/labs/ex/02/linux/tags"]]

" open a NERDTree automatically when vim starts up if no files were specified
" autocmd vimenter * if !argc() | NERDTree | endif

" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif


" exclude files and directories using Vim's wildignore and CtrlP's own g:ctrlp_custom_ignore
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
" CTRLP configuration
let g:ctrlp_by_filename = 1
let g:ctrlp_switch_buffer = 't'
" ALE configuration
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] [%severity%] %s'

let g:ale_lint_on_enter = 0
let g:ale_lint_on_filetype_changed = 0
let g:ale_lint_on_text_changed = 'never'

let g:ale_statusline_format = ['Errors: %d', 'Warnings: %d', '']

let g:ale_linters = {
      \ 'tex': ['lacheck'],
      \ 'python': ['pylint'],
      \}
let g:ale_keep_list_window_open = 1

" nmap <silent> <leader>aa <Plug>(ale_lint)
" nmap <silent> <leader>aj <Plug>(ale_next_wrap)
" nmap <silent> <leader>ak <Plug>(ale_previous_wrap)
" syntastic
let g:syntastic_always_populate_loc_list=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'
let g:syntastic_auto_loc_list=1
let g:syntastic_aggregate_errors = 1
" let g:syntastic_python_checkers=['python', 'flake8']
" Syntastic configuration (source code syntax checking)
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_quiet_messages = { "type": "style" }
let b:syntastic_mode = 'passive'
" let g:syntastic_c_checkers=['gcc','cppcheck']
" let g:syntastic_enable_balloons = 1 
" let g:syntastic_auto_jump = 1
" let g:syntastic_echo_current_error = 1
" let g:syntastic_cursor_column = 1  
" let g:syntastic_auto_jump = 3
" let g:syntastic_ignore_files = ['\m^/usr/include/', '\m\c\.h$']
" let g:syntastic_mode_map = {
" 	\ "mode": "active",
" 	\ "active_filetypes": ["ruby", "php"],
" 	\ "passive_filetypes": ["puppet"] }
" let g:syntastic_quiet_messages = {
" 	\ "!level":  "errors",
" 	\ "type":    "style",
" 	\ "regex":   '\m\[C03\d\d\]',
" 	\ "file:p":  ['\m^/usr/include/', '\m\c\.h$'] }
" let g:syntastic_extra_filetypes = [ "make" ]
" let g:syntastic_cpp_config_file = '.config_syntastic'

" Tagbar
let g:tagbar_autofocus = 1

" ConqueGDB configuration
let g:ConqueTerm_Color = 2         " 1: strip color after 200 lines, 2: always with color
let g:ConqueTerm_CloseOnEnd = 1    " close conque when program ends running
let g:ConqueTerm_StartMessages = 1 " display warning messages if conqueTerm is configured incorrectly
let g:ConqueTerm_PyVersion = 3
let g:ConqueTerm_ReadUnfocused = 1
" let g:ConqueGdb_GdbExe = 'arm-none-eabi-gdb'
let g:ConqueTerm_InsertOnEnter = 1
let g:ConqueTerm_CWInsert = 1
let g:ConqueGdb_SaveHistory = 1
let g:ConqueGdb_Leader = 'o'
map <C-q>d <ESC>:ConqueGdbBDelete<CR>
nmap & F<Space>a$<ESC>f<Space>i$

" setup color scheme for vim and gvim
" set termguicolors
if has('gui_running')
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
endif
" COMMANDS ALIAS
ca gdb ConqueGdb

" MAPPINGS

" (CTRL-S) Save file
"nmap <c-s> :w<CR>
"imap <c-s> <c-o><c-s>
" nmap <F2> :w<CR>
" imap <F2> <c-o><F2>

" (CTRL-Q) close file
"nmap <c-q> :q<CR>
"imap <c-q> <c-o><c-q>

" (F4) Build tags of your own project
" map <F4> <ESC>:!ctags -R --extra=+fq --c-kinds=+px --fields=+iaS .<cr><cr>

" (F6) create doxygen comment
nmap <F10> <ESC>:Dox<CR>
nmap <F9> <ESC>:DoxAuthor<CR>

" (CTRL-B) Build project
"nmap <C-b> :make<CR>
"nmap <C-b> :make ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- uImage<CR>
"nmap <C-b> :make <CR>
" nmap <C-b> :make<CR>
" imap <C-b> <c-o><c-b>
nmap <F7>  :make<CR>
imap <F7>  <c-o><F7>

" (F9) Open file explorer
map <silent> <F9> <ESC>:Explore<CR>

" (F12) buffer explorer
noremap <silent> <F12> <ESC>:ToggleBufExplorer<CR>

" (CTRL-T, CTRL-right, CTRL-left, L, H) tabs/buffer management
nnoremap <C-t> <ESC>:tabnew<CR>
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
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
nnoremap <silent> <F2> <ESC>:NERDTreeFind<CR>
nnoremap <silent> <F3> <ESC>:NERDTreeToggle<CR>
nnoremap <silent> <F4> :TagbarToggle<CR>
nnoremap <silent> <F5> :call ToogleSpell()<CR>


" (CTRL_A, CTRL-I) change to *.C/*.H file 
nnoremap <C-s> :A<CR>
nnoremap <C-i> <ESC>:IH<CR>

" (CTRL-P) go back to previous tag
map <C-n> <ESC>:pop<CR>

" (CTRL-W ]) Open tag under cursor in new tab
nnoremap <C-W>] <C-W>]:tab split<CR>gT:q<CR>gt 

nmap ; :
nmap <silent> , :noh<CR>

" imap <F3> <c-x><c-o>

noremap <leader>y "+y<CR>
noremap <leader>a "+gP<CR>
noremap <leader>x "+x<CR>

nmap <C-y>k :SyntasticCheck<CR>
nmap <C-y>t :SyntasticToglleMode<CR>
nmap <C-y>r :SyntasticReset<CR>
nmap <C-y>e :Errors<CR>
nmap <C-y>c :lclose<CR>
nmap <C-y>n :lnext<CR>
nmap <C-y>p :lprevious<CR>

" quickfix make next error
nmap <C-l>n :cn<CR>
nmap <C-l>o :copen<CR> 
nmap <C-l>w :cwindow<CR> 
nmap <C-l>c :cclose<CR> 

" conquegdb mappings
nmap <F8> \c
imap <F8> continue<CR>
" nmap <F6> \n
" imap <F6> next<CR>
" nmap <F5> \s
" imap <F5> step<CR>

" salva 
cmap w!! w !sudo tee % >/dev/null

set pastetoggle=<F2>

" default command to invoke CtrlP:
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
"
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
		set spell spelllang=
	else
		set spell spelllang=en
	endif
endfunction
" hi Function ctermfg=blue
" set rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/

" Always show statusline
" set laststatus=2

set runtimepath+=~/.vim/plugged/vim-snippets/UltiSnips

