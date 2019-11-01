" tex related
let g:tex_flavor = "latex"
autocmd BufNewFile,BufRead *.tex set spell

" set indent for xv6
autocmd BufNewFile,BufRead ~/work/xv6-public/*.c set tabstop=2
autocmd BufNewFile,BufRead ~/work/xv6-public/*.c set shiftwidth=2
autocmd BufNewFile,BufRead ~/work/xv6-public/*.c set softtabstop=2
