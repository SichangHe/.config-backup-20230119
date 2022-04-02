set -gx PATH /usr/local/bin $PATH
set PATH -gx /opt/homebrew/bin $PATH
set PATH -gx /Users/sichanghe/.cargo/bin $PATH
#set PATH -gx /Applications/MATLAB_R2021b.app/bin $PATH
set PATH -gx /Applications/Julia-1.7.app/Contents/Resources/julia/bin $PATH
#set -gx LDFLAGS "-L/opt/homebrew/opt/llvm/lib"
#set -gx CPPFLAGS "-I/opt/homebrew/opt/llvm/include"
set PATH -gx /opt/homebrew/opt/llvm/bin $PATH
# starship
starship init fish | source 

# SAG client
set PATH -gx /Users/sichanghe/Desktop/COMP\ 301/sag_client_install/bin $PATH

set -gx EDITOR "vim"

#! below are my alias
alias i="arch -x86_64"

alias py=python3

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
