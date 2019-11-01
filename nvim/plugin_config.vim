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

" set height of cmd area to 2 so echodoc can be shown
" set cmdheight=2

nnoremap <silent><C-e> :NERDTreeToggle<CR>
nnoremap :QR :QuickRun

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
