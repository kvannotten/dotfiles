" use numbers in gutter
set nu

" Get rid of stupid typo
command! -bang -nargs=* -complete=file W w<bang> <args>

" Hide the split bar
hi Vertsplit gui=NONE guibg=fg guifg=bg

" use <leader>y to copy to system clipboard
vmap <leader>y "+y

" Toggle between relative line numbers and normal line numbers
nmap <F3> :exec &nu==&rnu? "se nu!" : "se rnu!"<CR>

" Make the 81st column stand out but just on the line that offends -------------
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

" Show $ on change
set cpoptions+=$

" Ident wrapped lines
if v:version > 704 || v:version == 704 && has("patch338")
    set breakindent
endif
let &showbreak = '↳ '

" Autoclose autocomplete window
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif

" disable netrw
let g:loaded_netrw=1
let g:loaded_netrwPlugin=1

set mouse=a " enable mouse in all modes

let g:jsx_ext_required=0

set foldmethod=marker

let g:elm_detailed_complete = 1

set tags=./tags
let g:easytags_dynamic_files = 1

