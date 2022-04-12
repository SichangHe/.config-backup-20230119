set -gx PATH /usr/local/bin $PATH
set PATH -gx /opt/homebrew/bin $PATH
set PATH -gx ~/.cargo/bin $PATH
set PATH -gx /Applications/Julia-1.7.app/Contents/Resources/julia/bin $PATH
set PATH -gx /opt/homebrew/opt/llvm/bin $PATH
set PATH -gx ~/.local/bin $PATH

# starship
starship init fish | source 

# DKU proxy
set http_proxy 10.200.13.85:3128

# SAG client
set PATH -gx /Users/sichanghe/Desktop/COMP\ 301/sag_client_install/bin $PATH

set -gx EDITOR "nvim"

#! my alias {
alias i="arch -x86_64"

alias py=python3
alias vi=nvim
alias e=exit
alias c=clear
alias rsy='rsync --recursive --inplace --times --compress --exclude "**.DS_STORE" -hP'

# ls
alias l="exa"
alias la="exa -a"
alias lla="exa -la"
alias lt="exa -T"
alias llt="exa -lT"
alias lat="exa -aT"
alias llat="exa -laT"
alias ld="exa -D"
alias lad="exa -aD"
alias lld="exa -lD"
alias llad="exa -laD"

# VSCodium
alias co="codium"
#! }
