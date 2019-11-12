" configs for ALE
" let g:ale_sign_error = '⨉'
" let g:ale_sign_warning = '⚠'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

let g:ale_sign_column_always = 1

" set when to lint
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 'never'

" Tell ALE not to overwrite QuickFix an Location List
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 0
let g:ale_open_list = 0
let g:ale_keep_list_window_open = 0

" linters
let g:ale_linters = {
            \   'python': ['flake8'],
            \   'javascript.jsx': ['eslint'],
            \}

" jump to ALE errors
" nmap <silent> <C-k> <Plug>(ale_previous_wrap)
" nmap <silent> <C-j> <Plug>(ale_next_wrap)

" Tell airline to cooporate with ALE
let g:airline#extensions#ale#enabled = 1

" No highlighting
let g:ale_set_highlights = 0
