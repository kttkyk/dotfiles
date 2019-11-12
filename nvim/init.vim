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
set t_Co=256 " 256 color
filetype plugin indent on
" highlight CursorLine cterm=NONE ctermbg=black
" switching buffers
nnoremap <silent> <C-j> :bprev<CR>
nnoremap <silent> <C-k> :bnext<CR>

" porject specific .vimrc
set exrc
set secure

" Load external vim files
" Load dein
source ~/.config/nvim/loaddein.vim
" Syntax and colorscheme commands must be after the loading of dein(probably).
" https://github.com/Shougo/dein.vim/blob/master/doc/dein.txt#L1064
" https://qiita.com/mnbd/items/f9b0249a9d415e28bdd6
syntax enable
syntax on
colorscheme nord

" Load python path
source ~/.config/nvim/pythonpath.vim

" Load config for ALE
source ~/.config/nvim/ale_config.vim
" Load config for other plugins
source ~/.config/nvim/plugin_config.vim

" Others
source ~/.config/nvim/misc.vim
