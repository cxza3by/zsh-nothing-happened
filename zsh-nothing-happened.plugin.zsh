_silent_void_executed=0

_silent_void_preexec() {
    # Сохраняем оригинальный статус, чтобы хук ничего не сбросил
    local last_status=$? 
    _silent_void_executed=1
    
    # Запрашиваем позицию ДО выполнения команды (без ломающих таймаутов)
    echo -ne "\e[6n" && read -sdR _silent_void_start_pos < /dev/tty
    
    return $last_status
}

_silent_void_precmd() {
    # Сразу же перехватываем ЧЕСТНЫЙ код возврата команды пользователя
    local exit_code=$?

    if [ $_silent_void_executed -eq 0 ]; then
        return $exit_code
    fi
    _silent_void_executed=0

    # Запрашиваем позицию ПОСЛЕ выполнения команды
    echo -ne "\e[6n" && read -sdR _silent_void_end_pos < /dev/tty

    # Сравниваем реальные координаты
    if [ "$_silent_void_start_pos" = "$_silent_void_end_pos" ]; then
        echo -e "\e[38;2;255;255;0m | Nothing Happened, or Program exited with Code $exit_code\e[0m"
    fi
    
    return $exit_code
}

autoload -Uz add-zsh-hook
add-zsh-hook preexec _silent_void_preexec
add-zsh-hook precmd _silent_void_precmd
