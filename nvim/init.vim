" vim basic config
set number
set title
set ruler
set list
set showmatch
set cindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smartindent
set listchars=tab:\ \ ,eol:↩ " leftwards arrow with hook
set cursorline
set nohlsearch
set t_Co=256 " 256 color
set signcolumn=yes " Show sign column on the left, even if there is no sign to show
filetype plugin indent on
set clipboard=unnamedplus " Enable yanking to system clipboard (require xcopy or xsel)

" Stop opening preview window when selecting from omnicompletion menu
" float-preview.nvim instead
" https://github.com/neovim/nvim-lspconfig/issues/378
" TODO: Switch to completeopt=popup if it's implemented
set completeopt-=preview
" When using omnicomplete don't select the first item,
" but select the item with the longest common string.
" Show menu even if there is only one item.
" https://vim.fandom.com/wiki/Make_Vim_completion_popup_menu_work_just_like_in_an_IDE
" https://vim-jp.org/vimdoc-ja/options.html#'completeopt'
" https://note.com/yasukotelin/n/na87dc604e042
set completeopt+=longest,menuone

" highlight CursorLine cterm=NONE ctermbg=black
" switching buffers
nnoremap <silent> <C-j> :bnext<CR>
nnoremap <silent> <C-k> :bprev<CR>

" set assembly syntax to nasm  for *.asm files
" *.S files will be treated as gas syntax
autocmd BufNewFile,BufRead *.asm let g:asmsyntax = 'nasm'

" porject specific .vimrc
set exrc
set secure

" Load external vim files
" Load dein
source ~/.config/nvim/loaddein.vim
" Syntax and colorscheme commands must be after the loading of dein (probably).
" https://github.com/Shougo/dein.vim/blob/master/doc/dein.txt#L1064
" https://qiita.com/mnbd/items/f9b0249a9d415e28bdd6
syntax enable
syntax on
silent! colorscheme nord

" Load python path
source ~/.config/nvim/pythonpath.vim

" Load config for other plugins
source ~/.config/nvim/plugin_config.vim

" Others
source ~/.config/nvim/misc.vim


lua << EOF
require('loadlsp')
EOF
