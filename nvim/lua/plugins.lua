Plugins = {}
local g = vim.g

function Plugins.set()
    require("nvim-autopairs").setup {}
    require('nvim-web-devicons').setup {
        default = true;
    }
    g.vim_markdown_folding_disabled = true
    g.mkdp_auto_close = false
    g.mkdp_port = '7445'
    g.mkdp_markdown_css = NvimConfigPath .. 'markdown.css'
    g.gitgutter_sign_modified = '█'
    g.gitgutter_sign_added = '█'
end

return Plugins
