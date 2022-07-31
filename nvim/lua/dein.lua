local set = vim.opt
local fn = vim.fn
local add = fn['dein#add']
local begin = fn['dein#begin']
local check_install = fn['dein#check_install']
local install = fn['dein#install']
local load_toml = fn['dein#load_toml']
local end_ = fn['dein#end']

function activate_dein(path)
    local dein_path = string.format("%s/dein", path)
    set.runtimepath:append(dein_path)

    local cache_path = string.format("%s/../../.local/share/dein", path)
    begin(cache_path)
    add(dein_path)
    local toml_path = string.format("%s/dein.toml", path)
    load_toml(toml_path)
    local lazy_toml_path = string.format("%s/dein_lazy.toml", path)
    load_toml(lazy_toml_path, { lazy = 1 })
    end_()

    if check_install() == 1 then install() end
end
