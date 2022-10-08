alias c=clear
alias e=exit
alias rsy='rsync --recursive --inplace --times --compress --exclude "**.DS_STORE" -hP'

# Code - Insiders
if type -q code-insiders
    alias co=code-insiders
end

# Python3
if type -q ipython
    alias py=ipython
else
    alias py=python3
end

# Neovim
if type -q nvim
    alias vi=nvim
end

# Git
alias ga='git add . && git status'
alias gc='git commit -am '
alias gs='git push && git pull'

# exa
if type -q exa
    alias l='exa --icons'
    alias la='exa -a --icons'
    alias ll='exa -lh --git --icons'
    alias lla='exa -lah --git --icons'
    alias lt='exa -T --icons'
    alias llt='exa -lTh --git --icons'
    alias lat='exa -ahT --icons'
    alias llat='exa -lahT --git --icons'
    alias ld='exa -D --icons'
    alias lad='exa -aD --icons'
    alias lld='exa -lhD --git --icons'
    alias llad='exa -lahD --git --icons'
end
