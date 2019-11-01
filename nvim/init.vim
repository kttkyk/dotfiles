" vim basic config
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
set listchars=tab:\ \ ,eol:↩ " leftwards arrow with hook
set cursorline
set nohlsearch
filetype on
filetype plugin on
filetype indent on

" porject specific .vimrc
set exrc
set secure

highlight CursorLine cterm=NONE ctermbg=black

filetype plugin indent on
syntax enable

" Load external vim files
" Load dein
source ~/.config/nvim/loaddein.vim
" Load python path
source ~/.config/nvim/pythonpath.vim

" Load config for ALE
source ~/.config/nvim/ale_config.vim
" Load config for other plugins
source ~/.config/nvim/plugin_config.vim

" tex related
let g:tex_flavor = "latex"
autocmd BufNewFile,BufRead *.tex set spell

if &compatible
    set nocompatible
endif

" Don't know why but moving these commands above will break filetype?
filetype plugin indent on
set t_Co=256 " 256 color
syntax on

" set indent for xv6
autocmd BufNewFile,BufRead ~/work/xv6-public/*.c set tabstop=2
autocmd BufNewFile,BufRead ~/work/xv6-public/*.c set shiftwidth=2
autocmd BufNewFile,BufRead ~/work/xv6-public/*.c set softtabstop=2
