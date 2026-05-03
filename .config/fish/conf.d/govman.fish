# GOVMAN - Go Version Manager
fish_add_path -p "$HOME/.govman/bin"
set -gx GOTOOLCHAIN local

# Ensure GOBIN and GOPATH/bin are available
if test -n "$GOBIN"; and test -d "$GOBIN"; fish_add_path -p "$GOBIN"; end
if type -q go; set -l gopath (go env GOPATH 2>/dev/null); if test -n "$gopath"; and test -d "$gopath/bin"; fish_add_path -p "$gopath/bin"; end; end
set -l homegobin "$HOME/go/bin"; if test -d "$homegobin"; fish_add_path -p "$homegobin"; end

# Wrapper function for automatic PATH execution
function govman
    set govman_bin "$HOME/.govman/bin/govman"
    if test "$argv[1]" = "refresh"; or begin; test "$argv[1]" = "use"; and test (count $argv) -ge 2; and test "$argv[2]" != "--help"; and test "$argv[2]" != "-h"; end
        set output ($govman_bin $argv 2>&1)
        set exit_code $status
        if test $exit_code -eq 0
            for line in $output
                if string match -qr '^fish_add_path' -- $line
                    eval $line
                    echo "✓ Go version switched successfully"
                    return 0
                end
            end
        else
            for line in $output
                echo $line >&2
            end
            return $exit_code
        end
    end
    $govman_bin $argv
end

# Auto-switch Go versions based on .govman-goversion file
function govman_auto_switch
    set config_file "$HOME/.govman/config.yaml"
    set auto_switch_enabled "true"
    if test -f "$config_file"
        set auto_switch_enabled (awk '/^auto_switch:/,/^[^ ]/ {if (/^[[:space:]]*enabled:/) {print $2; exit}}' "$config_file" 2>/dev/null | tr -d '[:space:]')
        test -z "$auto_switch_enabled"; and set auto_switch_enabled "true"
    end
    if test "$auto_switch_enabled" != "true"
        return 0
    end

    # Check file exists and is non-empty (-s), handle permission/empty errors
    if test -s .govman-goversion
        set required_version (string trim < .govman-goversion 2>/dev/null)
        if test -z "$required_version"
            return 0
        end

        # Validate version format (e.g., 1.25, 1.25.1, 1.25rc1)
        if not string match -qr '^[0-9]+\.[0-9]+(\.?[0-9]*)(-?(rc|beta|alpha)[0-9]*)?$' -- "$required_version"
            echo "Warning: Invalid version format in .govman-goversion: $required_version" >&2
            return 0
        end

        # Skip go version call if we already matched this version
        if set -q __govman_last_version; and test "$required_version" = "$__govman_last_version"
            return 0
        end

            if not command -v go >/dev/null 2>&1
                echo "Go not found. Switching to Go $required_version..."
                govman use "$required_version" >/dev/null 2>&1; or begin
                    echo "Warning: Failed to switch to Go $required_version. Install it with 'govman install $required_version'" >&2
                end
                return
            end

            set current_version (go version 2>/dev/null | awk '{print $3}' | sed -E 's/^go//; s/([0-9]+\.[0-9]+(\.[0-9]+)?).*/\1/')
            if not string match -qr '^[0-9]+\.[0-9]+(\.[0-9]+)?$' -- "$current_version"; set current_version ""; end
            if test -n "$current_version"; and test "$current_version" != "$required_version"
                echo "Auto-switching to Go $required_version (required by .govman-goversion)"
                govman use "$required_version" >/dev/null 2>&1; or begin
                    echo "Warning: Failed to switch to Go $required_version. Install it with 'govman install $required_version'" >&2
                end
                set -g __govman_last_version "$required_version"
            else if test -n "$current_version"
                set -g __govman_last_version "$required_version"
            end
    end
end

# Fish-specific: Hook into directory changes
functions -q __govman_cd_hook; and functions -e __govman_cd_hook
function __govman_cd_hook --on-variable PWD
    govman_auto_switch
end

# Run auto-switch on shell startup
govman_auto_switch
# END GOVMAN
