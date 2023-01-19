return function(use)
    use {
        'williamboman/mason.nvim',
        config = function()
            require('mason').setup {}
        end,
    }

    use {
        'williamboman/mason-lspconfig.nvim',
        requires = {
            'williamboman/mason.nvim',
            'hrsh7th/cmp-nvim-lsp',
        },
        config = function()
            local servers = {
                clangd = {},
                elixirls = {},
                jsonls = {},
                julials = {},
                sumneko_lua = {},
                pyright = {},
                rust_analyzer = {},
                solargraph = {},
                tsserver = {},
            }
            local capabilities = require('cmp_nvim_lsp')
                .default_capabilities(U.lsp.protocol.make_client_capabilities())
            require('mason-lspconfig').setup {
                ensure_installed = U.tbl_keys(servers)
            }
            require('mason-lspconfig').setup_handlers {
                function(name)
                    require('lspconfig')[name].setup {
                        capabilities = capabilities,
                        settings = servers[name],
                    }
                end
            }
        end,
    }

    use {
        'folke/neodev.nvim',
        config = function()
            require('neodev').setup {}
        end,
    }

    use {
        'neovim/nvim-lspconfig',
        requires = {
            'williamboman/mason-lspconfig.nvim',
            'folke/neodev.nvim',
        },
    }
end
