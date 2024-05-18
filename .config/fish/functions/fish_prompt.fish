function fish_prompt --description 'Write out the prompt'
		# Git
		set -g __fish_git_prompt_show_informative_status 1
		set -g __fish_git_prompt_hide_untrackedfiles 1
		set -g __fish_git_prompt_color_branch magenta --bold
		set -g __fish_git_prompt_showupstream informative
		set -g __fish_git_prompt_color_dirtystate blue
		set -g __fish_git_prompt_char_dirtystate "*"
		set -g __fish_git_prompt_color_stagedstate yellow
		set -g __fish_git_prompt_color_invalidstate red
		set -g __fish_git_prompt_color_untrackedfiles $fish_color_normal
		set -g __fish_git_prompt_color_cleanstate green --bold

		# Pwd extended
		set -q fish_prompt_pwd_dir_length
    or set -lx fish_prompt_pwd_dir_length 0

		# Build the prompt
    set_color yellow
		echo -n (prompt_pwd)
    set_color normal
    printf '%s ' (fish_vcs_prompt)
		echo
    echo "> "
end


# Function to echo a blank line after command execution
function _fish_commandline_postexec --on-event fish_postexec
    echo
end

# Attach the function above to the commandline event
if not functions -q _fish_commandline_postexec
    __fish_postexec_handler _fish_commandline_postexec
end
