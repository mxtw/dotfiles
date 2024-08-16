# global vars
set -gx EDITOR nvim

# path
fish_add_path $HOME/.local/bin
fish_add_path $HOME/.krew/bin

# set theme with choose to avoid having to deal with fish_variables file
fish_config theme choose "Catppuccin Mocha"
