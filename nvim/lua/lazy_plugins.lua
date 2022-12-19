return function(use)
    use {
        'ibhagwan/fzf-lua',
        event = 'CmdLineEnter',
        requires = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('fzf-lua').setup {
                fullscreen = true,
                previewers = {
                    builtin = {
                        extensions = {
                            ["png"] = { "viu" },
                            ["jpg"] = { "viu" },
                        },
                    },
                },
            }
        end,
    }
    use {
        'numToStr/Comment.nvim',
        event = 'CmdLineEnter',
        config = function() require('Comment').setup {} end,
    }
    use {
        'nvim-tree/nvim-web-devicons',
        event = 'CmdLineEnter',
        config = function()
            require('nvim-web-devicons').setup {
                default = true
            }
        end,
    }
    use {
        'sindrets/diffview.nvim',
        event = 'CmdLineEnter',
        requires = {
            'nvim-tree/nvim-web-devicons',
            'nvim-lua/plenary.nvim',
        },
    }
    use {
        'machakann/vim-swap',
        event = 'InsertEnter',
    }
    use {
        'tpope/vim-fugitive',
        event = 'CmdLineEnter',
    }
    use {
        'windwp/nvim-autopairs',
        event = 'InsertEnter',
        config = function() require('nvim-autopairs').setup {} end,
    }
end