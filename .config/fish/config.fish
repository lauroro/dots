if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting ""
fish_config theme choose fish\ default

set PATH $PATH ~/.local/bin

#eval ~/miniconda3/bin/conda "shell.fish" "hook" $argv | source
