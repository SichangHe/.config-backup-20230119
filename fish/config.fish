# path
set -gx PATH /usr/local/bin $PATH
set PATH -gx ~/.cargo/bin $PATH
set PATH -gx /opt/homebrew/bin $PATH
set PATH -gx /opt/homebrew/opt/llvm/bin $PATH
set PATH -gx /Applications/Julia-1.7.app/Contents/Resources/julia/bin $PATH
set PATH -gx ~/.local/bin $PATH
# SAG client
set PATH -gx /Users/sichanghe/Desktop/COMP\ 301/sag_client_install/bin $PATH

# alias, proxy
source ~/.config/fish/conf.d/*.sh

if test (uname)=Darwin;
source ~/.config/fish/Darwin/*.sh;
end

if test (uname)=Linux;
source ~/.config/fish/Darwin/*.sh;
end

# starship
starship init fish | source 

set -gx EDITOR "nvim"
