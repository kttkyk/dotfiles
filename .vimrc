set number
set title
set ruler
set list
set showmatch
set autoindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smartindent
set listchars=tab:\ \ ,eol:$
set cursorline
filetype on
filetype plugin on
filetype indent on


nnoremap <silent><C-e> :NERDTreeToggle<CR>
nnoremap :qr :QuickRun


autocmd FileType python :inoremap # X#


let g:tex_flavor = "latex"

if &compatible
    set nocompatible
endif

set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim/

call dein#begin(expand('~/.vim/dein'))

call dein#disable('Shougo/neocomplete.vim')
call dein#disable('alvan/vim-closetag')
call dein#disable('scrooloose/syntastic')

call dein#add('Shougo/dein.vim')
call dein#add('Shougo/neocomplete.vim')
call dein#add('nanotech/jellybeans.vim')
call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
"call dein#add('thinca/vim-quickrun')
"call dein#add('alvan/vim-closetag')
call dein#add('scrooloose/nerdtree')
"call dein#add('scrooloose/syntastic')
call dein#add('romainl/Apprentice')
call dein#add('heavenshell/vim-pydocstring')
call dein#add('rust-lang/rust.vim')
call dein#add('whatyouhide/vim-gotham')

call dein#end()

filetype plugin indent on
set t_Co=256
syntax on


let g:quickrun_config = get(g:, 'quickrun_config', {})
let g:quickrun_config._ = {
      \ 'runner'    : 'vimproc',
      \ 'runner/vimproc/updatetime' : 60,
      \ 'outputter' : 'error',
      \ 'outputter/error/success' : 'buffer',
      \ 'outputter/error/error'   : 'quickfix',
      \ 'outputter/buffer/split'  : ':rightbelow 8sp',
      \ 'outputter/buffer/close_on_empty' : 1,
      \ }
nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"

colorscheme gotham256

"transparent
hi NonText ctermbg=None
hi Normal ctermfg=252 ctermbg=None

let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute 'set rtp^=' . g:opamshare . '/ocp-indent/vim'
