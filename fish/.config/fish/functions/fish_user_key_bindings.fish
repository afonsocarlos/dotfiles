function fish_user_key_bindings
    # Search back/forward for history commands matching the current prefix
    bind up up-or-search
    bind down history-prefix-search-forward

    bind --mode insert ctrl-q push-line

    set -g fish_key_bindings fish_vi_key_bindings
end

function up-or-search -d "Depending on cursor position and current mode, either search backward or move up one line"
    # If we are already in search mode, continue
    if commandline --search-mode
        commandline -f history-prefix-search-backward
        return
    end

    # If we are navigating the pager, then up always navigates
    if commandline --paging-mode
        commandline -f up-line
        return
    end

    # We are not already in search mode.
    # If we are on the top line, start search mode,
    # otherwise move up
    set lineno (commandline -L)

    switch $lineno
        case 1
            commandline -f history-prefix-search-backward
            history merge # <-- ADDED THIS

        case '*'
            commandline -f up-line
    end
end

function push-line
    set -g __fish_pushed_line (commandline)
    commandline ""
    function after-next-prompt --on-event fish_postexec
        commandline $__fish_pushed_line
        functions --erase after-next-prompt
    end
end
