set -xg TODO_PATH $HOME/sync/tlua
if status is-interactive
    theme_gruvbox dark hard
    source ~/git/dotfiles/.fish_aliases
    set -gx EDITOR nvim
    fzf --fish | source
    source "$HOME/.cargo/env.fish"

    set -gx PATH /home/gagarin/.rbenv/versions/3.3.4/bin $PATH /home/gagarin/.local/bin /usr/local/go/bin 
    set -xg HOST $(hostname)

    if [ $HOST = "dplagueis" ]
        set -gx PYTHON_ENV_DIR python3.12
    else
        set -gx PYTHON_ENV_DIR py3.12

        # ---- conda config init
        # !! Contents within this block are managed by 'conda init' !!
        if test -f /home/gagarin/sdd/anaconda3/bin/conda
            eval /home/gagarin/sdd/anaconda3/bin/conda "shell.fish" "hook" $argv | source
        else

            if test -f "/home/gagarin/sdd/anaconda3/etc/fish/conf.d/conda.fish"
                . "/home/gagarin/sdd/anaconda3/etc/fish/conf.d/conda.fish"
            else
                set -x PATH "/home/gagarin/sdd/anaconda3/bin" $PATH
            end
        end  # ---- conda config end
    end # ---- host check end

    source "$HOME/.env/$PYTHON_ENV_DIR/bin/activate.fish"

    source /opt/ros/noetic/share/rosbash/rosfish
    bass source $HOME/catkin_ws/devel/setup.bash

    set -gx CONAN_PROVIDER /home/gagarin/git/cmake-conan/conan_provider.cmake
    set -gx CMAKE_PREFIX_PATH "$CMAKE_PREFIX_PATH:/usr/local/lib/cmake/absl:/usr/local/share/Tracy"

    set -gx ZELLIJ_AUTO_ATTACH true
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

    set -gx PLOT_DIR /home/gagarin/git/utils-lib/plot
    eval "$(luarocks5.1 path --bin | sed 's/export \(.*\)/set -xg \1/g' | sed 's/=/ /g')"

end


# set -xg TEXMFCNF '~/.texmf'
set -xg TEXMFHOME '~/.texmf'
