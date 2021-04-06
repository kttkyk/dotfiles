" Required:
"dein Scripts-----------------------------
if &compatible
    set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.config/nvim/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.config/nvim/dein')
    call dein#begin('~/.config/nvim/dein')

    let s:toml_dir = expand('~/.config/nvim/dein/toml')

    " Let dein manage dein
    " Required:
    call dein#add('~/.config/nvim/dein/repos/github.com/Shougo/dein.vim')

    " Execute command asynchronously
    call dein#load_toml(s:toml_dir . '/vimproc.vim.toml')
    " Collection of common configurations for Neovim's built-in language server client
    call dein#load_toml(s:toml_dir . '/nvim-lspconfig.toml')
    " Auto completion framework for nvim built-in lsp
    call dein#load_toml(s:toml_dir . '/completion-nvim.toml')
    " Filer
    call dein#load_toml(s:toml_dir . '/nerdtree.toml')
    " Color scheme
    call dein#load_toml(s:toml_dir . '/Apprentice.toml')
    call dein#load_toml(s:toml_dir . '/nord.toml')
    " Status bar
    call dein#load_toml(s:toml_dir . '/vim-airline.toml')
    call dein#load_toml(s:toml_dir . '/vim-airline-themes.toml')
    " Understand jsx format
    call dein#load_toml(s:toml_dir . '/vim-jsx.toml')
    " Completion preview window based on neovim's floating window
    call dein#load_toml(s:toml_dir . '/float-preview.nvim.toml')

    " GNU global
    if executable('global')
        " To use Gtags command execute GenGTags before it
        call dein#load_toml(s:toml_dir . '/gen_tags.vim.toml')
        call dein#add('~/.config/nvim/dein/local/gtags')
    endif

    " Required:
    call dein#end()
    call dein#save_state()

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
endif

"End dein Scripts-------------------------
