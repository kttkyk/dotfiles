" path to python
if filereadable("/home/ty/.virtualenvs/pynvim2/bin/python")
    " sym link /usr/local/bin/python2-neovim -> /home/ty/.virtualenvs/neovim2/bin/python
    let g:python2_host_prog = '/home/ty/.virtualenvs/pynvim2/bin/python'
else
    let g:python2_host_prog = '/usr/bin/python2.7'
endif
if filereadable("/home/ty/.virtualenvs/pynvim2/bin/python")
    " sym link /usr/local/bin/python2-neovim -> /home/ty/.virtualenvs/neovim2/bin/python
    let g:python3_host_prog = '/home/ty/.virtualenvs/pynvim3/bin/python'
else
    let g:python2_host_prog = '/usr/bin/python3.6'
endif
