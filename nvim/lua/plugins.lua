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
            U.g.mkdp_markdown_css = NvimConfigPath .. 'markdown.css'
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
                    lualine_b = { 'filename' },
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
    use { 'p00f/nvim-ts-rainbow' }
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
        end
    }
end