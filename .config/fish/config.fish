if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting ""
fish_config theme choose fish\ default

set --global fish_key_bindings fish_default_key_bindings

set PATH $PATH ~/.local/bin

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
