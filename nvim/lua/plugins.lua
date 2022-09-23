Plugins = {}
local g = vim.g

function Plugins.set()
    require('nvim-autopairs').setup {}
    require('nvim-web-devicons').setup {
        default = true,
    }
    require("scrollbar").setup {}
    require("scrollbar.handlers.search").setup {}
    require('Comment').setup {}
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
    g.vim_markdown_folding_disabled = true
    g.mkdp_auto_close = false
    g.mkdp_markdown_css = NvimConfigPath .. 'markdown.css'
    g.gitgutter_sign_modified = '█'
    g.gitgutter_sign_added = '█'
    g.rainbow_active = 1
    g.rainbow_conf = {
        ctermfgs = {'DarkBlue', 'DarkGreen', 'DarkYellow', 'DarkMagenta', 'DarkRed'},
    }
    g.airline_theme = 'google_light'
end

return Plugins