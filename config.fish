source $HOME/.cargo/env.fish

if status is-interactive
    theme_gruvbox dark hard
    source ~/git/dotfiles/.fish_aliases
    set -gx EDITOR nvim
end

fzf --fish | source


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /home/gagarin/sdd/anaconda3/bin/conda
    eval /home/gagarin/sdd/anaconda3/bin/conda "shell.fish" "hook" $argv | source
else
    if test -f "/home/gagarin/sdd/anaconda3/etc/fish/conf.d/conda.fish"
        . "/home/gagarin/sdd/anaconda3/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "/home/gagarin/sdd/anaconda3/bin" $PATH
    end
end
# <<< conda initialize <<<

