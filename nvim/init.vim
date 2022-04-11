if exists('g:vscode')
    " VSCode extension
else
    " ordinary neovim, load SpaceVim
    execute 'source' fnamemodify(expand('<sfile>'), ':h').'/../../.SpaceVim/main.vim'
    " overwrites
    execute 'source' fnamemodify(expand('<sfile>'), ':h').'/overwrites.vim'
endif 
