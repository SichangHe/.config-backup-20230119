return function(use)
    use {
        'iamcco/markdown-preview.nvim',
        run = 'cd app && yarn',
        config = function()
            U.g.mkdp_auto_close = false
            U.g.mkdp_preview_options = {
                disable_filename = true,
                sync_scroll_type = 'relative',
            }
            U.g.mkdp_markdown_css = U.conf_loc .. 'markdown.css'
            U.g.mkdp_page_title = '${name}'
        end,
    }
    use {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup()
        end,
    }
    use {
        'nvim-lualine/lualine.nvim',
        config = function()
            require('lualine').setup {
                options = {
                    theme = 'onelight',
                },
                sections = {
                    lualine_a = { 'mode' },
                    lualine_b = { { 'filename', path = 1 } },
                    lualine_c = { 'diagnostics' },
                    lualine_x = { 'filetype' },
                    lualine_y = { 'progress', 'location', 'diff' },
                    lualine_z = { 'branch' },
                },
            }
        end,
    }
    use {
        'navarasu/onedark.nvim',
        config = function()
            local onedark = require('onedark')
            onedark.setup {
                style = 'light',
                highlights = {
                    rainbowcol1 = { fg = 'Black' },
                    rainbowcol2 = { fg = 'DarkGreen' },
                    rainbowcol3 = { fg = 'DarkMagenta' },
                    rainbowcol4 = { fg = 'DarkBlue' },
                    rainbowcol5 = { fg = 'DarkRed' },
                    rainbowcol6 = { fg = 'DarkGray' },
                },
            }
            onedark.load()
        end,
    }
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function()
            require('nvim-treesitter.configs').setup {
                highlight = {
                    enable = true,
                },
                ensure_installed = {
                    'bash',
                    'c',
                    'fish',
                    'javascript',
                    'jsonc',
                    'julia',
                    'latex',
                    'lua',
                    'markdown',
                    'python',
                    'ruby',
                    'rust',
                    'typescript',
                },
                auto_install = true,
                rainbow = {
                    enable = true,
                },
            }
        end,
    }
    use { 'mrjones2014/nvim-ts-rainbow' }
    use {
        'petertriho/nvim-scrollbar',
        config = function()
            require('scrollbar').setup()
            require('scrollbar.handlers.search').setup()
        end,
    }
    use {
        'preservim/vim-markdown',
        config = function()
            U.g.vim_markdown_folding_disabled = true
        end,
    }
    use {
        'folke/noice.nvim',
        requires = {
            'rcarriga/nvim-notify',
            'MunifTanjim/nui.nvim',
        },
        config = function()
            require('notify').setup {
                top_down = false,
                stages = 'static',
            }
            require('noice').setup {}
        end,
    }
    use {
        'williamboman/mason.nvim',
        config = function()
            require('mason').setup {}
        end,
    }
    use {
        'folke/neodev.nvim',
        config = function()
            require('neodev').setup {}
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
        'neovim/nvim-lspconfig',
        requires = {
            'williamboman/mason-lspconfig.nvim',
            'folke/neodev.nvim',
        },
    }
    use {
        'hrsh7th/nvim-cmp',
        requires = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
        config = function()
            local cmp = require('cmp')
            local snip = require('luasnip')
            cmp.setup {
                snippet = {
                    expand = function(args)
                        snip.lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert {
                    ['<Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.confirm {
                                behavior = cmp.ConfirmBehavior.Replace,
                                select = true,
                            }
                        else
                            fallback()
                        end
                    end, { 'i', 's' }),
                    ['<C-j>'] = cmp.mapping(function()
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif snip.expand_or_jumpable() then
                            snip.expand_or_jump()
                        else
                            cmp.complete {}
                        end
                    end, { 'i', 's' }),
                    ['<C-k>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif snip.jumpable(-1) then
                            snip.jump(-1)
                        else
                            fallback()
                        end
                    end, { 'i', 's' }),
                },
                sources = {
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' },
                    { name = 'buffer' },
                },
            }
        end,
    }
    use {
        'lukas-reineke/indent-blankline.nvim',
        config = function()
            require('indent_blankline').setup {}
        end,
    }
end
