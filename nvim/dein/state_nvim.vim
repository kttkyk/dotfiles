if g:dein#_cache_version !=# 150 || g:dein#_init_runtimepath !=# '/home/ty/.config/nvim,/etc/xdg/xdg-ubuntu/nvim,/etc/xdg/nvim,/home/ty/.local/share/nvim/site,/usr/share/ubuntu/nvim/site,/usr/local/share/nvim/site,/usr/share/nvim/site,/var/lib/snapd/desktop/nvim/site,/usr/share/nvim/runtime,/var/lib/snapd/desktop/nvim/site/after,/usr/share/nvim/site/after,/usr/local/share/nvim/site/after,/usr/share/ubuntu/nvim/site/after,/home/ty/.local/share/nvim/site/after,/etc/xdg/nvim/after,/etc/xdg/xdg-ubuntu/nvim/after,/home/ty/.config/nvim/after,/home/ty/.config/nvim/dein/repos/github.com/Shougo/dein.vim' | throw 'Cache loading error' | endif
let [plugins, ftplugin] = dein#load_cache_raw([''])
if empty(plugins) | throw 'Cache loading error' | endif
let g:dein#_plugins = plugins
let g:dein#_ftplugin = ftplugin
let g:dein#_base_path = '/home/ty/.config/nvim/dein'
let g:dein#_runtime_path = '/home/ty/.config/nvim/dein/.cache/init.vim/.dein'
let g:dein#_cache_path = '/home/ty/.config/nvim/dein/.cache/init.vim'
let &runtimepath = '/home/ty/.config/nvim,/etc/xdg/xdg-ubuntu/nvim,/etc/xdg/nvim,/home/ty/.local/share/nvim/site,/usr/share/ubuntu/nvim/site,/usr/local/share/nvim/site,/usr/share/nvim/site,/var/lib/snapd/desktop/nvim/site,/home/ty/.config/nvim/dein/local/gtags,/home/ty/.config/nvim/dein/repos/github.com/Shougo/vimproc.vim,/home/ty/.config/nvim/dein/repos/github.com/Shougo/dein.vim,/home/ty/.config/nvim/dein/repos/github.com/neoclide/coc.nvim,/home/ty/.config/nvim/dein/.cache/init.vim/.dein,/usr/share/nvim/runtime,/home/ty/.config/nvim/dein/.cache/init.vim/.dein/after,/var/lib/snapd/desktop/nvim/site/after,/usr/share/nvim/site/after,/usr/local/share/nvim/site/after,/usr/share/ubuntu/nvim/site/after,/home/ty/.local/share/nvim/site/after,/etc/xdg/nvim/after,/etc/xdg/xdg-ubuntu/nvim/after,/home/ty/.config/nvim/after'
filetype off
