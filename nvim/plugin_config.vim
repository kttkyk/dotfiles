nnoremap <silent><C-e> :NERDTreeToggle<CR>

" NerdTree
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'

" Status line
" Copied from https://itchyny.hatenablog.com/entry/20120609/1339249777
" Maybe useful when airline is not available
" set statusline=%{expand('%:p:t')}\ %<[%{expand('%:p:h')}]%=\ %m%r%y%w[%{&fenc!=''?&fenc:&enc}][%{&ff}][%3l,%3c,%3p]
" vim-airline config
" Don't forget to install powerline fonts
let g:airline_powerline_fonts = 1

" float-preview.nvim
" https://github.com/ncm2/float-preview.nvim
" TODO: Switch to builtint completeopt if it's implemented.
" Something like `completeopt=popup` ini vim 8.1.1880
" https://github.com/neovim/neovim/issues/10996
let g:float_preview#docked = 0

