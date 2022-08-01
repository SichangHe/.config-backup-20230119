Dein = {}
local set = vim.opt
local fn = vim.fn
local add = fn['dein#add']
local begin = fn['dein#begin']
local check_install = fn['dein#check_install']
local end_ = fn['dein#end']
local install = fn['dein#install']
local load_state = fn['dein#min#load_state']
local load_toml = fn['dein#load_toml']
local save_state = fn['dein#save_state']

function Dein.activate()
    local dein_path = NvimConfigPath .. "dein"
    set.runtimepath:append(dein_path)

    if load_state(dein_path) == 1 then
        local cache_path = HomeDir .. "/.local/share/dein"
        begin(cache_path)
        add(dein_path)
        local toml_path = NvimConfigPath .. "dein.toml"
        load_toml(toml_path)
        local lazy_toml_path = NvimConfigPath .. "dein_lazy.toml"
        load_toml(lazy_toml_path, { lazy = 1 })
        end_()
        save_state()
    end

    if check_install() == 1 then install() end
end

return Dein
