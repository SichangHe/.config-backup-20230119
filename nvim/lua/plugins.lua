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
    }
    local onedark = require('onedark')
    onedark.setup {
        style = 'light',
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
    g.rainbow_active = 1
    g.rainbow_conf = {
        ctermfgs = {'DarkBlue', 'DarkGreen', 'DarkYellow', 'DarkMagenta', 'DarkRed'},
    }
end

return M