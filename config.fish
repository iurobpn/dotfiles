if status is-interactive
    theme_gruvbox dark hard
    # source ~/.config/fish/conf.d/gruvbox.fish
    set -gx EDITOR vim
    set -g fish_key_bindings fish_vi_key_bindings
    # Commands to run in interactive sessions can go here
end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /opt/anaconda3/bin/conda
    eval /opt/anaconda3/bin/conda "shell.fish" "hook" $argv | source
else
    if test -f "/opt/anaconda3/etc/fish/conf.d/conda.fish"
        . "/opt/anaconda3/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "/opt/anaconda3/bin" $PATH
    end
end
# <<< conda initialize <<<

abbr -a -- v vim
abbr -a -- save 'abbr >> ~/.config/fish/config.fish'
abbr -a -- vish 'vim ~/.config/fish/config.fish'
abbr -a -- apti 'sudo apt install'
abbr -a -- aptp 'sudo apt purge'
abbr -a -- aptu 'sudo apt update'
abbr -a -- aptdu 'sudo apt dist-upgrade'
abbr -a -- apta 'sudo apt autoremove'
abbr -a -- aptc 'sudo apt autoclean && sudo apt clean'
abbr -a -- apts 'apt-cache search'
abbr -a -- gs 'git status'
abbr -a -- ga 'git add'
abbr -a -- gci 'git commit'
abbr -a -- gb 'git branch'
abbr -a -- gr 'git remote'
abbr -a -- gsl 'git stash list'
abbr -a -- lg 'lazygit'

