" vim settings
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

" Dein settings
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim/

call dein#begin(expand('~/.vim/dein'))

"call dein#disable('Shougo/neocomplete.vim')
"call dein#disable('alvan/vim-closetag')
"call dein#disable('nanotech/jellybeans.vim')
"call dein#disable('godlygeek/tabular')
"call dein#disable('plasticboy/vim-markdown')

"call dein#add('nanotech/jellybeans.vim')
"call dein#add('thinca/vim-quickrun')
"call dein#add('alvan/vim-closetag')
"
call dein#add('Shougo/dein.vim')
call dein#add('Shougo/neocomplete.vim')
call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
call dein#add('scrooloose/nerdtree')
call dein#add('vim-syntastic/syntastic')
call dein#add('romainl/Apprentice')
call dein#add('heavenshell/vim-pydocstring')
call dein#add('rust-lang/rust.vim')
call dein#add('whatyouhide/vim-gotham')
call dein#add('davidhalter/jedi-vim')
call dein#add('plytophogy/vim-virtualenv')
call dein#add('shime/vim-livedown')
call dein#add('tpope/vim-markdown')
call dein#add('zchee/deoplete-jedi')
call dein#add('wokalski/autocomplete-flow')
call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')
call dein#add('pangloss/vim-javascript')
call dein#add('mxw/vim-jsx')
" call dein#add('Shougo/echodoc.vim')

" Deoplete
call dein#add('Shougo/deoplete.nvim')
if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
endif

call dein#end()

" path to python
let g:python2_host_prog = '/home/ty/.virtualenvs/neovim2/bin/python'
let g:python3_host_prog = '/home/ty/.virtualenvs/neovim3/bin/python'

"transparent
hi NonText ctermbg=None
hi Normal ctermfg=252 ctermbg=None

colorscheme gotham256

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

"syntastic config
"let g:syntastic_python_checkers = ['pyflakes', 'pep8']
"autocmd BufNewFile,BufRead *.py let g:syntastic_check_on_open = 1
let g:syntastic_mode_map = { 'mode': 'passive' }
"let g:syntastic_python_checkers = ['pyflakes']

" Deoplete config
let g:deoplete#enable_at_startup = 1
" Disable jedi completion to use deoplete completion
let g:jedi#completions_enabled = 0 
" Required when not using neosnippet for autocomplete-flow plugin
let g:autocomplete_flow#insert_paren_after_function = 0
" Disable preview window
set completeopt-=preview

" set height of cmd area to 2 so echodoc can be shown
" set cmdheight=2

nnoremap <silent><C-e> :NERDTreeToggle<CR>
nnoremap <silent> <F6> :SyntasticCheck<CR>
nnoremap <silent> <F7> :SyntasticReset<CR>
nnoremap :QR :QuickRun

" Press F6 to open markdown preview
autocmd FileType markdown nnoremap <silent> <F6> :LivedownPreview<CR>
" Press F7 to close markdown preview
autocmd FileType markdown nnoremap <silent> <F7> :LivedownKill<CR>

" For indenting in python
autocmd FileType python :inoremap # X#
" For django template
autocmd BufRead,BufNewFile *.html set filetype=htmldjango

" No docstring pop up for jedi-vim
autocmd FileType python setlocal completeopt-=preview
" Do not show vim mode for function signature
" autocmd FileType python set noshowmode
" Stop auto filling import statement
" let g:jedi#smart_auto_mappings = 0
" Location of function signature in jedi-vim
" let g:jedi#show_call_signatures = 2


" NerdTree
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'


" tex related
let g:tex_flavor = "latex"
autocmd BufNewFile,BufRead *.tex set spell

" linker script
autocmd BufRead,BufNewFile *.scr set filetype=ld


if &compatible
    set nocompatible
endif

filetype plugin indent on
set t_Co=256
syntax on


" Status line
" Copied from https://itchyny.hatenablog.com/entry/20120609/1339249777
" Maybe useful when airline is not available
" set statusline=%{expand('%:p:t')}\ %<[%{expand('%:p:h')}]%=\ %m%r%y%w[%{&fenc!=''?&fenc:&enc}][%{&ff}][%3l,%3c,%3p]

" vim-airline config
" Don't forget to install powerline fonts
let g:airline_powerline_fonts = 1


