source "$HOME/.cargo/env.fish"

if status is-interactive
    theme_gruvbox dark hard
    source ~/git/dotfiles/.fish_aliases
    set -gx EDITOR nvim
end

fzf --fish | source

set -gx PATH /home/gagarin/.rbenv/versions/3.3.4/bin $PATH /home/gagarin/.local/bin /usr/local/go/bin
set -xg HOST $(hostname)
if status is-interactive
    if [ $HOST != "dplagueis" ]
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
        source $HOME/.env/py3.12/bin/activate.fish
        # <<< conda initialize <<<
    else
        source $HOME/.env/python3.12/bin/activate.fish
        #echo "host is $HOST"
    end
end

source /opt/ros/noetic/share/rosbash/rosfish
bass source $HOME/catkin_ws/devel/setup.bash
set -gx CONAN_PROVIDER /home/gagarin/git/cmake-conan/conan_provider.cmake
set -gx CMAKE_PREFIX_PATH "$CMAKE_PREFIX_PATH:/usr/local/lib/cmake/absl:/usr/local/share/Tracy"
set -gx ZELLIJ_AUTO_ATTACH true

if status is-interactive
    if set -q ZELLIJ
    else
        zellij delete-all-sessions -y
        set N_SESSIONS $(zellij list-sessions | grep -v EXITED | wc -l)
        if test $N_SESSIONS -eq 0
            zellij
        else
            set Z_SESSION $(zellij list-sessions -s | grep -v EXITED | head -n1)
            zellij  attach $(echo $Z_SESSION)
        end
    end
end

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# set -xg TEXMFCNF '~/.texmf'
set -xg TEXMFHOME '~/.texmf'
