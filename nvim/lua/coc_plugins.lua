return function(use)
    use { 'neoclide/coc.nvim', branch = 'master', run = 'yarn install --frozen-lockfile' }
    -- Extensions
    use { 'elixir-lsp/coc-elixir', run = 'yarn && yarn prepack' }
    local extensions = {
        'clangd/coc-clangd',
        'fannheyward/coc-julia',
        'neoclide/coc-json',
        'josa42/coc-lua',
        'fannheyward/coc-markdownlint',
        'fannheyward/coc-pyright',
        'fannheyward/coc-rust-analyzer',
        'neoclide/coc-snippets',
        'neoclide/coc-solargraph',
        'neoclide/coc-tabnine',
        'neoclide/coc-tsserver',
    }
    for _, v in ipairs(extensions) do
        use { v, run = 'yarn' }
    end
end
