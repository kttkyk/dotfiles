if filereadable(expand("~/venvs/pynvim3/bin/python"))
    let g:python3_host_prog = expand("~/venvs/pynvim3/bin/python")
else
    let g:python3_host_prog = system("which python3")
endif
