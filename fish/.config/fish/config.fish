if status --is-interactive
    atuin init fish --disable-up-arrow | source

    fzf --fish | FZF_CTRL_R_COMMAND= source

    starship init fish | source

    zoxide init --cmd cd fish | source
end

set -gx EDITOR nvim
set -gx MANPAGER 'nvim --clean "+colorscheme vim" +Man!'
