require('plugins')

local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.config/nvim/plugged')
Plug 'neovim/nvim-lspconfig'
Plug 'simrat39/rust-tools.nvim'
vim.call('plug#end')
