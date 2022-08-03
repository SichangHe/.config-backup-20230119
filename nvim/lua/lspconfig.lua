LspConfig = {}
local key = vim.keymap.set
local lsp = vim.lsp.buf

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    key('n', 'gD', lsp.declaration, bufopts)
    key('n', 'gd', lsp.definition, bufopts)
    key('n', 'K', lsp.hover, bufopts)
    key('n', 'gi', lsp.implementation, bufopts)
    key('n', '<C-k>', lsp.signature_help, bufopts)
    key('n', '<space>wa', lsp.add_workspace_folder, bufopts)
    key('n', '<space>wr', lsp.remove_workspace_folder, bufopts)
    key('n', '<space>wl', function()
        print(vim.inspect(lsp.list_workspace_folders()))
    end, bufopts)
    key('n', '<space>D', lsp.type_definition, bufopts)
    key('n', '<space>rn', lsp.rename, bufopts)
    key('n', '<space>ca', lsp.code_action, bufopts)
    key('n', 'gr', lsp.references, bufopts)
    key('n', '<space>f', lsp.formatting, bufopts)
end

function LspConfig.default()
    -- Mappings.
    -- See `:help vim.diagnostic.*` for documentation on any of the below functions
    local opts = { noremap = true, silent = true }
    key('n', '<space>e', vim.diagnostic.open_float, opts)
    key('n', '[d', vim.diagnostic.goto_prev, opts)
    key('n', ']d', vim.diagnostic.goto_next, opts)
    key('n', '<space>q', vim.diagnostic.setloclist, opts)

    local lsp_flags = {
        -- This is the default in Nvim 0.7+
        debounce_text_changes = 150,
    }
    -- require('lspconfig')['pyright'].setup {
    --     on_attach = on_attach,
    --     flags = lsp_flags,
    -- }
    -- require('lspconfig')['tsserver'].setup {
    --     on_attach = on_attach,
    --     flags = lsp_flags,
    -- }
    require('lspconfig')['rust_analyzer'].setup {
        on_attach = on_attach,
        flags = lsp_flags,
        -- Server-specific settings...
        settings = {
            ["rust-analyzer"] = {}
        }
    }
end

return LspConfig
