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
            rainbowcol1 = {fg = 'Black'},
            rainbowcol2 = {fg = 'DarkGreen'},
            rainbowcol3 = {fg = 'DarkMagenta'},
            rainbowcol4 = {fg = 'DarkBlue'},
            rainbowcol5 = {fg = 'DarkRed'},
            rainbowcol6 = {fg = 'DarkGray'},
        },
    }
    onedark.load()
    require('lualine').setup {
        options = {
            theme = 'onelight',
        },
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
    g.ale_disable_lsp = true
end

return M