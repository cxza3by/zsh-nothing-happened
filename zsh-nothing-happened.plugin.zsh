_silent_void_executed=0
_silent_void_snapshot=""

_silent_void_preexec() {
    local last_status=$?
    _silent_void_executed=1

    if _silent_void_remote_available; then
        _silent_void_snapshot="$(kitty @ get-text --extent screen 2>/dev/null)"
    else
        _silent_void_snapshot=""
    fi

    return $last_status
}

_silent_void_precmd() {
    local exit_code=$?

    if [ $_silent_void_executed -eq 0 ]; then
        return $exit_code
    fi
    _silent_void_executed=0

    if ! _silent_void_remote_available; then
        return $exit_code
    fi

    local after_snapshot
    after_snapshot="$(kitty @ get-text --extent screen 2>/dev/null)"

    if [[ "$_silent_void_snapshot" == "$after_snapshot" ]]; then
        echo -e "\e[38;2;255;255;0m | Nothing Happened, or Program exited with Code $exit_code\e[0m"
    fi

    return $exit_code
}


_silent_void_remote_available() {
    kitty @ get-text --extent screen 1>/dev/null 2>&1
}

autoload -Uz add-zsh-hook
add-zsh-hook preexec _silent_void_preexec
add-zsh-hook precmd _silent_void_precmd
