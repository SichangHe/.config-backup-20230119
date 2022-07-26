# path
source ~/.config/fish/path.fish

# alias
source ~/.config/fish/alias.sh

# proxy
source ~/.config/fish/proxy.fish

#! kernel specific {

if [ (uname) = Darwin ] #! Darwin {{
    # path
    source ~/.config/fish/Darwin/path.fish

    # alias
    source ~/.config/fish/Darwin/alias.sh

    # proxy
    source ~/.config/fish/Darwin/proxy.fish
    #! }}

else if [ (uname) = Linux ] #! Linux {{
    # path
    source ~/.config/fish/Linux/path.fish
    #! }}
end
#! }

# starship
# starship init fish | source

# default editor
set -gx EDITOR nvim
