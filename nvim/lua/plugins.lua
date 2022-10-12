local M = {}
local g = vim.g

function M.set()
    require("scrollbar").setup {}
    require("scrollbar.handlers.search").setup {}
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
    local onedark = require('onedark')
    onedark.setup {
        style = 'light',
        highlights = {
            rainbowcol2 = {fg = 'Black'},
            rainbowcol3 = {fg = 'DarkGreen'},
            rainbowcol4 = {fg = 'DarkMagenta'},
            rainbowcol5 = {fg = 'DarkBlue'},
            rainbowcol6 = {fg = 'DarkRed'},
            rainbowcol7 = {fg = 'DarkGray'},
        },
    }
    onedark.load()
    require('lualine').setup {
        sections = {
            lualine_a = {'mode'},
            lualine_b = {'filename'},
            lualine_c = {'diagnostics'},
            lualine_x = {'filetype'},
            lualine_y = {'progress', 'location', 'diff'},
            lualine_z = {'branch'},
        },
    }
    g.vim_markdown_folding_disabled = true
    g.mkdp_auto_close = false
    g.mkdp_markdown_css = NvimConfigPath .. 'markdown.css'
    g.gitgutter_sign_modified = '█'
    g.gitgutter_sign_added = '█'
end

return M