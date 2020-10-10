function! LoadPythonCocConfig(python_path, site_packages_path, python3_ver)
    call coc#config('languageserver', {
                \ "mpls": {
                \   "command": "dotnet",
                \   "args": [
                \     "exec",
                \     "/opt/python-language-server/output/bin/Debug/Microsoft.Python.LanguageServer.dll"
                \   ],
                \   "filetypes": ["python"],
                \   "initializationOptions": {
                \     "interpreter": {
                \       "properties": {
                \         "InterpreterPath": expand(a:python_path),
                \         "DatabasePath": "/opt/python-language-server/output",
                \         "Version": a:python3_ver
                \       }
                \     },
                \     "searchPaths": [
                \         expand(a:site_packages_path)
                \     ],
                \     "testEnvironment": "false",
                \     "analysisUpdates": "true",
                \     "traceLogging": "true",
                \     "asyncStartup": "true",
                \   }
                \ }
                \})
    " Only restart if coc is already loaded
    if exists(":CocRestart")
        CocRestart
    endif
endfunction


function! LoadVenvCocConfig(venv_path)
    let python_path = a:venv_path . "/bin/python"
    let site_packages_path = system("ls " . a:venv_path . " /lib | head -n 1") . "/site-packages"
    let python3_ver = system(python_path . " --version | cut -d ' ' -f 2")
    call LoadPythonCocConfig(python_path, site_packages_path, python3_ver)
endfunction


function! LoadVenv()
    if strlen($VIRTUAL_ENV) > 0
        call LoadVenvCocConfig($VIRTUAL_ENV)
    endif
endfunction

" Register as command
command! LoadVenv :call LoadVenv()


function! LoadDefaultPythonCocConfig()
    let python3_ver = system("/usr/bin/python3 --version | cut -d ' ' -f 2")
    call LoadPythonCocConfig("/usr/bin/python3", "/usr/lib/python3/dist-packages", python3_ver)
endfunction


" At setup enable default config
call LoadDefaultPythonCocConfig()
