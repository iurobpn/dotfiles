if status is-interactive
    theme_gruvbox dark hard
    source $HOME/git/dotfiles/.fish_aliases
    set -gx EDITOR nvim
    fzf --fish | source
    source "$HOME/.cargo/env.fish"

    set -axg PATH $HOME/.rbenv/versions/3.3.4/bin $HOME/.local/bin /usr/local/go/bin $HOME/git/scripts/lua $HOME/git/scripts

    set -xg HOST $(hostname)

    if [ $HOST = "dplagueis" ]
        set -gx PYTHON_ENV_DIR python3.12
    else
        set -gx PYTHON_ENV_DIR py3.12

        # ---- conda config init
        # !! Contents within this block are managed by 'conda init' !!
        if test -f $HOME/sdd/anaconda3/bin/conda
            eval $HOME/sdd/anaconda3/bin/conda "shell.fish" "hook" $argv | source
        else

            if test -f "$HOME/sdd/anaconda3/etc/fish/conf.d/conda.fish"
                . "$HOME/sdd/anaconda3/etc/fish/conf.d/conda.fish"
            else
                set -x PATH "$HOME/sdd/anaconda3/bin" $PATH
            end
        end  # ---- conda config end
    end # ---- host check end

    source "$HOME/.env/$PYTHON_ENV_DIR/bin/activate.fish"

    source /opt/ros/noetic/share/rosbash/rosfish
    bass source $HOME/catkin_ws/devel/setup.bash

    set -gx CONAN_PROVIDER $HOME/git/cmake-conan/conan_provider.cmake
    set -gx CMAKE_PREFIX_PATH "$CMAKE_PREFIX_PATH:/usr/local/lib/cmake/absl:/usr/local/share/Tracy"

    set -gx ZELLIJ_AUTO_ATTACH true
    if not set -q ZELLIJ
        zellij delete-all-sessions -y
        set N_SESSIONS $(zellij list-sessions | grep -v EXITED | wc -l)
        if test $N_SESSIONS -eq 0
            zellij
        else
            set Z_SESSION $(zellij list-sessions -s | grep -v EXITED | head -n1)
            zellij  attach $(echo $Z_SESSION)
        end
    end

    if [ $HOST = "dplagueis" ]
        eval "$(luarocks path --bin | sed 's/export \(.*\)/set -xg \1/g' | sed 's/=/ /g')"
    else
        eval "$($HOME/.luarocks51/bin/luarocks path --bin | sed 's/export \(.*\)/set -xg \1/g' | sed 's/=/ /g')"
    end

    set -xg FZF_DEFAULT_OPTS "--reverse --multi --info=inline"
    # --preview 'bat --color=always --style=header,grid --line-range :500 {}' --preview-window=right:60%:wrap"
    set -xg FZF_DEFAULT_COMMAND 'fd . --type f --hidden --follow --exclude .git --exclude .gtags'
    set -xg LUA_PATH "$LUA_PATH;$HOME/git/scripts/lua/?.lua;$HOME/git/scripts/lua/?/init.lua;$HOME/git/scripts/lua/?.lua"

    source $HOME/git/scripts/scripts.fish
    set -xg TEXMFHOME '$HOME/.texmf'
end
source $HOME/git/dotfiles/gruvbox.fish
set -xg PATH $PATH $HOME/git/scripts/treesitter/node_modules/.bin

set -gx tide_character_icon          ∫
set -gx tide_character_color         $neutral_green
set -gx tide_character_failure_color $bright_red
set -gx tide_git_icon                
set -gx tide_git_color_untracked     $bright_red
set -gx tide_git_color_staged        $bright_green
set -gx tide_git_color_unstaged      $bright_yellow
set -gx tide_git_color_ahead         $bright_blue
set -gx tide_git_color_behind        $bright_magenta
set -gx tide_git_color_dirty         $bright_red
set -gx tide_git_color_clean         $bright_green
set -gx tide_git_color_conflicted    $bright_orange
set -gx tide_git_color_branch        $neutral_blue
set -gx tide_git_color_stash         $bright_yellow
set -gx tide_pwd_color_dirs          $neutral_blue
set -gx tide_pwd_color_truncated_dirs          $faded_red
set -gx tide_pwd_color_anchors          $bright_blue

