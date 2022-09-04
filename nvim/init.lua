NvimConfigPath = debug.getinfo(1).source:match("@?(.*/)")
HomeDir = os.getenv('HOME')
local fn = vim.fn
local vscode_exists = fn.exists('g:vscode') == 1
local source = function(path) vim.cmd("source " .. NvimConfigPath .. path) end

local function use(module)
    package.loaded[module] = nil
    return require(module)
end

function AllConfig()
    use('general_options')
    use('general_keymaps')
    GeneralOptions.set()
    GeneralKeymaps.set()

    if vscode_exists then
        -- Running inside vscode
    else
        use('options')
        use('keymaps')
        use('dein')
        use('autocmd')
        use('plugins')

        Options.set()
        Keymaps.set()
        Au.set()

        Dein.activate()
        if fn['coc#math#min'] then
            use('coc')
            Coc.setup()
        end

        Plugins.set()
        source("one_half_light.vim")
    end
end

AllConfig()
