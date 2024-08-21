# global vars
set -gx EDITOR nvim
set -gx FZF_DEFAULT_OPTS "\
--color=bg+:#313244,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
--color=selected-bg:#45475a \
--multi"

# path
fish_add_path $HOME/.local/bin
fish_add_path $HOME/.krew/bin
fish_add_path $HOME/go/bin
fish_add_path $HOME/cargo/bin

# set theme with choose to avoid having to deal with fish_variables file
fish_config theme choose "Catppuccin Mocha"
set fish_greeting
