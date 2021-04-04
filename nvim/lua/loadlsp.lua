local nvim_lsp = require('lspconfig')
local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

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

    -- Set some keybinds conditional on server capabilities
    if client.resolved_capabilities.document_formatting then
        buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
    elseif client.resolved_capabilities.document_range_formatting then
        buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
    end

    -- Set autocommands conditional on server_capabilities
    if client.resolved_capabilities.document_highlight then
        vim.api.nvim_exec([[
        hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
        hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
        hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
        augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
        augroup END
        ]], false)
    end
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
