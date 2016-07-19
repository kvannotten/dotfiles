" Add plugins
call plug#begin('~/.config/nvim/plugged')
" {{{
" General Plugins
" =================
" >> Interface enhancement
  Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }           " file side bar
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " fuzzy searcher
  Plug 'vim-airline/vim-airline'                                    " status bar
  Plug 'vim-airline/vim-airline-themes'                             " themes for airline
  Plug 'airblade/vim-gitgutter'                                     " add git info in gutter

" >> Code enhancement
  Plug 'benekastah/neomake'           " auto complete
  Plug 'Shougo/deoplete.nvim'         " auto complete
  Plug 'tpope/vim-surround'           " enable stuff as yss'
  Plug 'Townk/vim-autoclose'          " automatically complete ( { ...
  Plug 'terryma/vim-multiple-cursors' " multiple cursors
  Plug 'justinmk/vim-sneak'           " missing motion for vim (s)
  Plug 'tpope/vim-endwise'            " end structures like if, def, ...
  Plug 'junegunn/vim-easy-align'      " align code on chars
  Plug 'godlygeek/tabular'            " tabularize stuff

" >> Functionality
  Plug 'ctrlpvim/ctrlp.vim'                                             " file searcher
  Plug 'ervandew/supertab'                                              " tab completion
  Plug 'xolox/vim-misc' | Plug 'xolox/vim-easytags'                     " ctags support
  Plug 'majutsushi/tagbar'                                              " tagbar
  Plug 'othree/eregex.vim'                                              " allows perl regex
  Plug 'simnalamburt/vim-mundo'                                         " visualize undo tree
  Plug 'chaoren/vim-wordmotion'                                         " camelcase motions
  Plug 'SirVer/ultisnips'                                               " snippets
  Plug 'Shougo/vimproc.vim', { 'do': 'make' } | Plug 'Shougo/unite.vim' " unite actions

" >> Misc
  Plug 'Shougo/echodoc.vim'                               " show method prototype in echo window
  Plug 'luochen1990/rainbow'                              " give each matching parens different colors

" >> Colors
  Plug 'morhetz/gruvbox'                                  " gruvbox colors
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'          " colors for nerdtree

" Ruby Plugins
" ==============
  Plug 'osyo-manga/vim-monster', { 'for': ['rb', 'erb', 'ruby'] } " ruby code completion
  Plug 'KurtPreston/vim-autoformat-rails'                         " rails formatting
  Plug 'tpope/vim-rails'                                          " rails plugin

" Golang Plugins
" ================
  Plug 'fatih/vim-go', { 'for': ['golang', 'go'] }        " go integration
  Plug 'zchee/deoplete-go', { 'do': 'make'}               " deoplete for go
  Plug 'nsf/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }

" HTML plugins
" ==============
  Plug 'mattn/emmet-vim/'                                                  " html shortcuts
  Plug 'jelera/vim-javascript-syntax', { 'for': ['js', 'jsx'] }            " js syntax stuff
  Plug 'pangloss/vim-javascript', { 'for': ['js', 'jsx'] }                 " more js stuff + css
  Plug 'ternjs/tern_for_vim', { 'do': 'npm install', 'for': ['js', 'jsx']} " javascript syntax checking
  Plug 'mxw/vim-jsx'                                                       " jsx syntax checking
  Plug 'carlitux/deoplete-ternjs', { 'for': ['js', 'jsx'] }                " deoplete ternjs

" Elm plugins
" ============
  Plug 'ElmCast/elm-vim', { 'for': ['elm'] }              " elm syntax

" Other plugins
" ==============
  Plug 'elzr/vim-json', { 'for': ['json'] }                      " json syntax
  Plug 'suan/vim-instant-markdown'                               " markdown preview
  Plug 'zchee/deoplete-clang', { 'for': ['c', 'h'] }             " c complete
  Plug 'Shougo/neoinclude.vim', { 'for': ['c', 'h'] } " header completion
  Plug 'ryanoasis/vim-devicons'                                  " add little icons in nerdtree

"}}}
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=700

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" :W sudo saves the file
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
    set wildignore+=.git\*,.hg\*,.svn\*
endif

" Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=0
set tm=500

" Add a bit extra margin to the left
set foldcolumn=1

" Preview window settings
set completeopt-=preview " don't open top pane for preview
set pumheight=10 " max height for pum


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

try
    let g:gruvbox_italic=1
    colorscheme gruvbox
catch
endtry

set background=dark

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2

set sts=2

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines


""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <leader>bd :Bclose<cr>

" buffer navigation control
nmap <leader>l :bnext<CR>
nmap <leader>h :bprevious<CR>
nmap <leader>bl :ls<CR>
nmap <leader>bq :bp <BAR> bd #<CR>

" Close all the buffers
map <leader>ba :1,1000 bd!<cr>

" Useful mappings for managing tabs
" map <leader>tn :tabnew<cr>
" map <leader>to :tabonly<cr>
" map <leader>tc :tabclose<cr>
" map <leader>tm :tabmove
" map <leader>t<leader> :tabnext

" Keep the cursor where it was when yanking something
vnoremap <expr>y "my\"" . v:register . "y`y"

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
" map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%


""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
map 0 ^

" Move a line of text using Ctrl+[jk]
vmap <C-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <C-k> :m'<-2<cr>`>my`<mzgv`yo`z

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()
autocmd BufWrite *.rb :call DeleteTrailingWS()
nmap <leader>s :call DeleteTrailingWS()<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scribble
map <leader>q :e ~/buffer<cr>

" Quickly open a markdown buffer for scribble
map <leader>x :e ~/buffer.md<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Omni complete functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Command mode related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Smart mappings on the command line
cno $h e ~/
cno $d e ~/Desktop/
cno $j e ./
cno $c e <C-\>eCurrentFileDir("e")<cr>

" $q is super useful when browsing on the command line
" it deletes everything until the last slash
cno $q <C-\>eDeleteTillSlash()<cr>

" Bash like keys for the command line
cnoremap <C-A>		<Home>
cnoremap <C-E>		<End>
cnoremap <C-K>		<C-U>

cnoremap <C-P> <Up>
cnoremap <C-N> <Down>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fast editing and reloading of vimrc configs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>e :e! ~/.config/nvim/configs/my_configs.vim<cr>
autocmd! bufwritepost vimrc source ~/.config/nvim/configs/my_configs.vim


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Turn persistent undo on
"    means that you can undo even when you close a buffer/VIM
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
try
    set undodir=~/.config/nvim/temp_dirs/undodir
    set undofile
catch
endtry


"===========================
" PLUGINS
" ==========================

""""""""""""""""""""""""""""""
" => CTRL-P
""""""""""""""""""""""""""""""
" {{{
let g:ctrlp_working_path_mode = 0

let g:ctrlp_map = '<c-f>'
map <C-b> :CtrlPBuffer<cr>
" let g:ctrlp_cmd = 'CtrlPMRU'

let g:ctrlp_max_height = 20
let g:ctrlp_custom_ignore = 'node_modules\|^\.DS_Store\|^\.git\|^\.coffee'
" use ag for ctrlp
let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
      \ --ignore .git
      \ --ignore .svn
      \ --ignore .hg
      \ --ignore .DS_Store
      \ --ignore "**/*.pyc"
      \ -g ""'

let g:webdevicons_enable_ctrlp = 1
" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerd Tree && Devicons
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {{{
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark
map <leader>nf :NERDTreeFind<cr>

let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Deoplete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"{{{
let g:deoplete#enable_at_startup = 1
"let g:deoplete#disable_auto_complete = 1
"inoremap <silent><expr><C-Space> deoplete#mappings#manual_complete()

" vim-monster
let g:monster#completion#rcodetools#backend = "async_rct_complete"
let g:deoplete#sources#omni#input_patterns = {
\   "ruby" : '[^. *\t]\.\w*\|\h\w*::',
\}
"}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Echodoc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:echodoc_enable_at_startup = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => EasyAlign
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-multiple-cursors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {{{
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-z>'
let g:multi_cursor_quit_key='<Esc>'
" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-airline config (force color)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {{{
let g:airline_theme="gruvbox"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_powerline_fonts = 1
" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => supertab
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:SuperTabClosePreviewOnPopupClose = 1
let g:SuperTabDefaultCompletionType = "<c-n>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-json
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vim_json_syntax_conceal = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-go
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {{{
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 0
let g:go_fmt_autosave = 1
" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => syntastic/neomake
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {{{
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

autocmd! BufWritePost * Neomake
let g:neomake_javascript_jshint_maker = {
      \ 'args': ['--verbose'],
      \ 'errorformat': '%A%f: line %1\, col %v, %m \(%t%*\d\)',
      \}
let g:neomake_javascript_enabled_makers = ['jshint']
"}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-mundo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <F6> :MundoToggle<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => tagbar
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {{{
nmap <leader>t :TagbarToggle<cr>
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
    \ }
" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => rainbow
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {{{
let g:rainbow_active = 1
let g:rainbow_conf = {
\   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
\   'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
\   'operators': '_,_',
\   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\   'separately': {
\       '*': {},
\       'tex': {
\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
\       },
\       'lisp': {
\           'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
\       },
\       'vim': {
\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
\       },
\       'html': {
\           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
\       },
\       'eruby': {
\           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
\       },
\       'css': 0,
\   }
\}
" }}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => deoplete-clang
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"{{{
let g:deoplete#sources#clang#libclang_path = '/usr/lib/libclang.so'
let g:deoplete#sources#clang#clang_header  = '/usr/lib/clang'
let g:deoplete#sources#clang#sort_algo = 'priority'
"}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => easytags
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"{{{
let g:easytags_languages = {
\   'go': {
\     'cmd': 'gotags',
\     'args': [],
\     'fileoutput_opt': '-f',
\     'stdout_opt': '-L=-',
\     'recurse_flag': '-R'
\   }
\}
"}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ultisnips
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"{{{
inoremap <silent><expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
"}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => unite
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"{{{
call unite#filters#matcher_default#use(['matcher_fuzzy'])
let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts =
              \ '-i --vimgrep --hidden --ignore ' .
              \ '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
nnoremap <leader>a :Unite grep:.<cr>
nnoremap <leader>f :Unite file_rec<cr>
"}}}

"==============================================================
" HELPER FUNCTIONS
"==============================================================
" {{{
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("Ack \"" . l:pattern . "\" " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction


" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

func! DeleteTillSlash()
    let g:cmd = getcmdline()

    if has("win16") || has("win32")
        let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\]\\).*", "\\1", "")
    else
        let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*", "\\1", "")
    endif

    if g:cmd == g:cmd_edited
        if has("win16") || has("win32")
            let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\\]\\).*\[\\\\\]", "\\1", "")
        else
            let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*/", "\\1", "")
        endif
    endif

    return g:cmd_edited
endfunc

func! CurrentFileDir(cmd)
    return a:cmd . " " . expand("%:p:h") . "/"
endfunc

" }}}
""""""""""""""""""""""""""""""""""""""""""""""""""""
" END OF CONFIG
""""""""""""""""""""""""""""""""""""""""""""""""""""

" allow some quick fixes in separate file
try
  source ~/.config/nvim/configs/my_configs.vim
catch
endtry
