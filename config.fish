source "$HOME/.cargo/env.fish"

if status is-interactive
    theme_gruvbox dark hard
    source ~/git/dotfiles/.fish_aliases
    set -gx EDITOR nvim
end

fzf --fish | source


set -gx PATH $PATH /home/gagarin/.local/bin
set -xg HOST $(hostname)
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
    # <<< conda initialize <<<
else
    echo "host is $HOST"
end

source /opt/ros/noetic/share/rosbash/rosfish
bass source $HOME/catkin_ws/devel/setup.bash
set -gx CONAN_PROVIDER /home/gagarin/git/cmake-conan/conan_provider.cmake
set -gx CMAKE_PREFIX_PATH "$CMAKE_PREFIX_PATH:/usr/local/lib/cmake/absl:/usr/local/share/Tracy"
set xg ZELLIJ_AUTO_ATTACH true

if set -q ZELLIJ
else
  zellij attach -c
end


