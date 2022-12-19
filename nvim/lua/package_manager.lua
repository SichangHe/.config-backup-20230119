-- Install packer
local install_path = U.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = U.fn.empty(U.fn.glob(install_path)) == 1
if is_bootstrap then
    print('Bootstrapping.')
    U.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
    U.cmd [[packadd packer.nvim]]
end

local packer = require('packer')

if is_bootstrap then
    packer.sync()
    print('Please wait and then restart.')
end

return packer
