local nvim_lsp = require('lspconfig')
local on_attach = function(client, bufnr)
    -- https://github.com/nvim-lua/completion-nvim#setup
    require('completion').on_attach(client)
    -- https://github.com/nvim-lua/completion-nvim#recommended-setting
    -- Set completeopt to have a better completion experience
    -- set completeopt=menuone,noinsert,noselect
    vim.o.completeopt='menuone,noinsert,noselect'
    -- Avoid showing message extra message when using completion
    -- set shortmess+=c
    vim.o.shortmess = vim.o.shortmess .. 'c'

    -- Disable virtual text diagnostics
    -- :help lsp-handler-configuration
    -- https://zenn.dev/garypippi/articles/fe72e26c25563e4c44a9#virtual-text%E3%81%A7%E8%A1%A8%E7%A4%BA%E3%81%97%E3%81%AA%E3%81%84%E8%A8%AD%E5%AE%9A
    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = false })
    -- Open diagnostic window when the cursor moved to a line with some diagnostics.
    -- CursorMoved event could be slow, since it's hooked everytime the cursor moves.
    -- vim.cmd('autocmd CursorMoved * lua vim.lsp.util.show_line_diagnostics()')
    -- CursorHold event may be more efficient,
    vim.cmd('autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()')
    -- although I will have to wait for 4 seconds until the window pops up.
    -- vim.cmd('autocmd CursorHold * lua vim.lsp.util.show_line_diagnostics()')
    -- The time can be configured by changing updatetime.
    -- But since updatetime is used to check whether to write swap file or not,
    -- configuring it could also slow neovim down.
    vim.o.updatetime = 500 -- 0.5 sec


    -- See :help nvim_buf_set_keymap() for info
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    -- buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    local opts = { noremap=true, silent=true }
    buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

    -- Configure the appearance of diagnostics.
    -- :help lsp-highlight-diagnostics
    -- https://vim-jp.org/vimdoc-ja/sign.html
    -- https://coffeeandcontemplation.dev/
    -- https://zenn.dev/garypippi/articles/fe72e26c25563e4c44a9
    vim.api.nvim_exec([[
        sign define LspDiagnosticsSignError text=✘
        sign define LspDiagnosticsSignWarning text=●
        sign define LspDiagnosticsSignInformation text=●
        sign define LspDiagnosticsSignHint text=●
        hi LspDiagnosticsSignError ctermfg=red
        hi LspDiagnosticsSignWarning ctermfg=yellow
        hi LspDiagnosticsSignInformation ctermfg=blue
        hi LspDiagnosticsSignHint ctermfg=green
    ]], false)
end


function system(cmd)
    local handle = io.popen(cmd)
    local result = handle:read("*a")
    handle:close()
    return result
end


function load_pyls_ms(nvim_lsp, python_path, site_packages_path, python_ver)
    -- Reference: https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#pyls_ms
    -- Becareful that the config snippet found above, doesn't exactly follow the lua grammer.
    -- "Default values" show the default values, when the attribute is not manually set.
    -- You also need to add commas between the attributes.
    nvim_lsp["pyls_ms"].setup{
        cmd = { "dotnet", "exec", "/opt/python-language-server/output/bin/Debug/Microsoft.Python.LanguageServer.dll" },
        on_attach = on_attach,
        filetypes = { "python" },
        init_options = {
            analysisUpdates = true,
            asyncStartup = true,
            displayOptions = {},
            interpreter = {
                properties = {
                    InterpreterPath = python_path,
                    Version = python_ver
                }
            },
            searchPaths = {
                site_packages_path,
            }
        },
        -- root_dir = vim's starting directory
        settings = {
            python = {
                analysis = {
                    disabled = {},
                    errors = {},
                    info = {}
                }
            }
        }
    }
end

function load_ccls(nvim_lsp)
    -- root_dir has to be a function which returns the root directory
    -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/lspconfig.txt
    function getcwd(fname)
        -- just ignore fname argument
        -- it's just required to match callback function signature
        -- remove new line from the end
        return system("pwd"):gsub("\n", "")
    end
    function root_dir(fname)
        return nvim_lsp.util.root_pattern("compile_commands.json", "compile_flags.txt", ".git")(fname) or getcwd(fname)
    end
    nvim_lsp['ccls'].setup{
        cmd = { "ccls" },
        on_attach = on_attach,
        init_options = {
            cache = { directory = ".ccls-cache" }
        },
        root_dir = root_dir
    }
end

local venv = os.getenv("VIRTUAL_ENV")
if venv ~= nil then -- not equal is '~=', and not '!=' in lua
    local python_path = venv .. "/bin/python"
    local site_packages_path = system("ls " .. venv .. "/lib | head -n 1") .. "/site-packages"
    local python_ver = system(python_path .. " --version | cut -d ' ' -f 2")
    load_pyls_ms(nvim_lsp, python_path, site_packages_path, python_ver)
else
    local python_path = "/usr/bin/python3"
    local site_packages_path = "/usr/lib/python3/dist-packages"
    local python_ver = system(python_path .. " --version | cut -d ' ' -f 2")
    load_pyls_ms(nvim_lsp, python_path, site_packages_path, python_ver)
end

load_ccls(nvim_lsp)
