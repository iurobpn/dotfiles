# vim: set ft=bash:
################# commented out ########################
# export GOPATH=$HOME/go
# export QT_SELECT=qt5
# export QTDIR=/usr/share/qt5
# export XDG_CONFIG_DIRS=$XDG_CONFIG_DIRS:$HOME/.config
# export XDG_CONFIG_HOME=$XDG_CONFIG_HOME:$HOME/.config
# export GUROBI_VERSION=10.0
#export INCLUDEPATH=/home/gagarin/Qt/5.5/gcc_64/include:$INCLUDEPATH
# export CLASSPATH=$CLASSPATH:/home/gagarin/opt/weka-3-8-0/
#export CLASSPATH=$WEKAHOME:$WEKAHOME/weka.jar:$WEKAHOME/libsvm.jar
#export FONTCONFIG_FILE=$CONDA_PREFIX/etc/fonts/fonts.conf
#export FONTCONFIG_PATH=$CONDA_PREFIX/etc/fonts/
#export BSTINPUTS=/usr/share/texlive/texmf-dist/bibtex/bst/IEEEtran/:$BSTINPUT
#export BIBINPUTS=/usr/share/texlive/texmf-dist/bibtex/bib/IEEEtran/:$BIBINPUTS


 #
 #   L E S S   C O L O R S   F O R   M A N   P A G E S
 #

 # CHANGE FIRST NUMBER PAIR FOR COMMAND AND FLAG COLOR
 # currently 0;33 a.k.a. brown, which is dark yellow for me
 # export LESS_TERMCAP_md=$'\E[0;33;5;74m'  # begin bold

 # CHANGE FIRST NUMBER PAIR FOR PARAMETER COLOR
 # currently 0;36 a.k.a. cyan
 # export LESS_TERMCAP_us=$'\E[0;36;5;146m' # begin underline

 # don't change anything here
 # export LESS_TERMCAP_mb=$'\E[1;31m'       # begin blinking
 # export LESS_TERMCAP_me=$'\E[0m'           # end mode
 # export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
 # export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box
 # export LESS_TERMCAP_ue=$'\E[0m'           # end underline

 #########################################
 # Colorcodes:
 # Black       0;30     Dark Gray     1;30
 # Red         0;31     Light Red     1;31
 # Green       0;32     Light Green   1;32
 # Brown       0;33     Yellow        1;33
 # Blue        0;34     Light Blue    1;34
 # Purple      0;35     Light Purple  1;35
 # Cyan        0;36     Light Cyan    1;36
 # Light Gray  0;37     hite         1;37
 #########################################
################# commented out ########################

bind TAB:menu-complete
export PATH=$HOME/bin:$PATH
export EDITOR=nvim
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib

source ~/.bash_aliases
[ -f $HOME/.vim/bundle/gruvbox/gruvbox_256palette.sh ] && . "$HOME/.vim/bundle/gruvbox/gruvbox_256palette.sh"
[ -f "$HOME/.local/share/nvim/lazy/gruvbox/gruvbox_256palette.sh" ] && . "$HOME/.local/share/nvim/lazy/gruvbox/gruvbox_256palette.sh"
#
[ -f ~/lscolors.sh ] && . ~/lscolors.sh
[ -f ~/bin/sensible.bash ] && . ~/bin/sensible.bash


if [ -f /usr/share/git/completion/git-completion.bash ]; then
    . /usr/share/git/completion/git-completion.bash
fi
if [ -f /usr/share/bash-completion/completions/git ]; then
    . /usr/share/bash-completion/completions/git
fi

export FZF_DEFAULT_OPTS="--color=fg:#ebdbb2,bg:#282828,hl:#b16286 --color=fg+:#689d6a,bg+:#32302f,hl+:#d3869b --color=info:#d65d0e,prompt:#458588,pointer:#fe8019 --color=marker:#8ec07c,spinner:#cc241d,header:#fabd2f --reverse --multi --info=inline"
 export FZF_DEFAULT_COMMAND='fd . --type f --hidden --follow --exclude .git --exclude .gtags'
 export FZF_CTRL_T_OPTS="
     --walker-skip .git,node_modules,target
     --preview 'bat -n --color=always {}'
     --bind 'ctrl-/:change-preview-window(down|hidden|)'"
 # CTRL-Y to copy the command into clipboard using pbcopy
 export FZF_CTRL_R_OPTS="
     --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
     --color header:italic
     --header 'Press CTRL-Y to copy command into clipboard'"
 # Print tree structure in the preview window
 export FZF_ALT_C_OPTS="
     --walker-skip .git,node_modules,target
     --preview 'tree -C {}'"

[ -f $HOME/.luapaths ] && . $HOME/.luapaths
if [ -f $HOME/.cargo/env ]; then
    . $HOME/.cargo/env
elif [ -d $HOME/.cargo/bin ]; then
    export PATH=$HOME/.cargo/bin:$PATH
fi

[ -f $HOME/.env/base/bin/activate ] && . $HOME/.env/base/bin/activate
[ -f $HOME/.nvm/nvm.sh ] && . $HOME/.nvm/nvm.sh
[ -f ~/.fzf.bash ] && . ~/.fzf.bash
[ -f ~/.gita-completion.bash ] && . ~/.gita-completion.bash

[ -f /opt/ros/jazzy/setup.bash ] && . /opt/ros/jazzy/setup.bash
[ -f $HOME/rmf_ws/setup.bash ] && . $HOME/rmf_ws/setup.bash
[ -f ~/.bash_completion.d/task.sh ] && . ~/.bash_completion.d/task.sh
[ -f ~/.bash_completion.d/timew-completion.bash ] && . ~/.bash_completion.d/timew-completion.bash

eval "$(starship init bash)"
command -v zoxide > /dev/null 2>&1 && eval "$(zoxide init bash)"

#[ -f $HOME/.nix-profile/etc/profile.d/hm-session-vars.sh ] && . $HOME/.nix-profile/etc/profile.d/hm-session-vars.sh
[ -f $HOME/git/pyautoenv/pyautoenv.bash ] && . $HOME/git/pyautoenv/pyautoenv.bash

if [ -z "$TMUX" ]; then
    if tmux has-session > /dev/null 2>&1; then
        tmux attach
    else
        tmux new-session -s main
    fi
fi

export NODE_PATH=$HOME/.local/lib/node_modules
export NODE_PATH=/usr/local/lib/node_modules
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

