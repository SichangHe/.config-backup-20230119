if test (uname)=Darwin;
source ~/.config/fish/Darwin/*.sh;
end

if test (uname)=Linux;
source ~/.config/fish/Darwin/*.sh;
end

# starship
starship init fish | source 

set -gx EDITOR "nvim"

# alias, proxy
source ~/.config/fish/conf.d/*.sh
