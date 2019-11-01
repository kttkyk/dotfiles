" Required:
"dein Scripts-----------------------------
if &compatible
    set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.config/nvim/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.config/nvim/dein')
    call dein#begin('~/.config/nvim/dein', vimrcs)

    " Let dein manage dein
    " Required:
    call dein#add('~/.config/nvim/dein/repos/github.com/Shougo/dein.vim')

    " Plugin manager
    call dein#add('Shougo/dein.vim')
    " Execute command asynchronously
    call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
    " File manager
    call dein#add('scrooloose/nerdtree')
    " Color scheme
    call dein#add('romainl/Apprentice')
    " Load current virtualenv to PYTHONPATH
    call dein#add('plytophogy/vim-virtualenv')
    " Status bar
    call dein#add('vim-airline/vim-airline')
    call dein#add('vim-airline/vim-airline-themes')
    " Understand jsx format
    call dein#add('mxw/vim-jsx')
    " Linter
    call dein#add('w0rp/ale')
    " Language server protocol client
    call dein#add('neoclide/coc.nvim', {'build': './install.sh nightly'})

    " GNU global
    if executable('global')
        " To use Gtags command execute GenGTags before it
        call dein#add('~/.config/nvim/dein/local/gtags')
        call dein#add('jsfaint/gen_tags.vim') " GenGtags
    endif


    " Required:
    call dein#end()
    call dein#save_state()
endif

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

"End dein Scripts-------------------------
