# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi


# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

bind TAB:menu-complete

# export PS1="$(get_color_ret) $green_pmt \u@\h $blue_pmt\W$(__git_ps1 " (%s)") $white_pmt"

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi


alias fzh='cat ~/.bash_history | fzf-tmux'
# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
# alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

export GOPATH=$HOME/go
export PATH=$PATH:~/opt/gnu-mcu-eclipse/arm-none-eabi-gcc/7.2.1-1.1-20180401-0515/bin:~/opt/LanguageTool-4.4:$GOPATH/bin
# export PATH=$PATH:/usr/lib/x86_64-linux-gnu/qt5/bin
export PATH=~/opt/Qt/5.12.1/gcc_64/bin:$PATH
export QT_SELECT=qt5
export QTDIR=/usr/share/qt5
export XDG_CONFIG_DIRS=$XDG_CONFIG_DIRS:$HOME/.config
export XDG_CONFIG_HOME=$XDG_CONFIG_HOME:$HOME/.config
# export PATH=/home/gagarin/anaconda2/bin:$PATH

export EDITOR=vim
export LD_LIBRARY_PATH=$HOME/opt/boost/boost_1_65_1/stage/lib:$HOME/Qt/5.5/gcc_64/lib:$LD_LIBRARY_PATH:/usr/local/lib

# if [ -f /usr/local/lib/python2.7/dist-packages/powerline/bindings/bash/powerline.sh ]; then
    # source /usr/local/lib/python2.7/dist-packages/powerline/bindings/bash/powerline.sh
# fi


#source /opt/ros/indigo/setup.bash
#source /home/gagarin/catkin_ws/devel/setup.bash

export QT_PLUGIN_PATH=/usr/local/qwt-6.1.3-svn/plugins:$QT_PLUGIN_PATH
export QMAKEFEATURES=/usr/local/qwt-6.1.3-svn/features/:$QMAKEFEATURES
export INCLUDEPATH=/home/gagarin/Qt/5.5/gcc_64/include:$INCLUDEPATH
export BSTINPUTS=/usr/share/texlive/texmf-dist/bibtex/bst/IEEEtran/:$BSTINPUT
export BIBINPUTS=/usr/share/texlive/texmf-dist/bibtex/bib/IEEEtran/:$BIBINPUTS
export BERKELEYDB_DIR=/usr/lib/x86_64-linux-gnu/
# export CLASSPATH=$CLASSPATH:/home/gagarin/opt/weka-3-8-0/
export WEKAHOME=/home/gagarin/opt/weka-3-8-0
export CLASSPATH=$WEKAHOME:$WEKAHOME/weka.jar:$WEKAHOME/libsvm.jar
export FONTCONFIG_FILE=$CONDA_PREFIX/etc/fonts/fonts.conf
export FONTCONFIG_PATH=$CONDA_PREFIX/etc/fonts/
###-begin-npm-completion-###
#
# npm command completion script
#
# Installation: npm completion >> ~/.bashrc  (or ~/.zshrc)
# Or, maybe: npm completion > /usr/local/etc/bash_completion.d/npm
#

# if type complete &>/dev/null; then
#   _npm_completion () {
#     local words cword
#     if type _get_comp_words_by_ref &>/dev/null; then
#       _get_comp_words_by_ref -n = -n @ -w words -i cword
#     else
#       cword="$COMP_CWORD"
#       words=("${COMP_WORDS[@]}")
#     fi
#
#     local si="$IFS"
#     IFS=$'\n' COMPREPLY=($(COMP_CWORD="$cword" \
#                            COMP_LINE="$COMP_LINE" \
#                            COMP_POINT="$COMP_POINT" \
#                            npm completion -- "${words[@]}" \
#                            2>/dev/null)) || return $?
#     IFS="$si"
#   }
#   complete -o default -F _npm_completion npm
# elif type compdef &>/dev/null; then
#   _npm_completion() {
#     local si=$IFS
#     compadd -- $(COMP_CWORD=$((CURRENT-1)) \
#                  COMP_LINE=$BUFFER \
#                  COMP_POINT=0 \
#                  npm completion -- "${words[@]}" \
#                  2>/dev/null)
#     IFS=$si
#   }
#   compdef _npm_completion npm
# elif type compctl &>/dev/null; then
#   _npm_completion () {
#     local cword line point words si
#     read -Ac words
#     read -cn cword
#     let cword-=1
#     read -l line
#     read -ln point
#     si="$IFS"
#     IFS=$'\n' reply=($(COMP_CWORD="$cword" \
#                        COMP_LINE="$line" \
#                        COMP_POINT="$point" \
#                        npm completion -- "${words[@]}" \
#                        2>/dev/null)) || return $?
#     IFS="$si"
#   }
#   compctl -K _npm_completion npm
# fi
###-end-npm-completion-###

if [ -z "$TMUX" ]; then
	tmux attach -t default || tmux new -s default
fi
source ~/.aliases
source ~/.profile
source "$HOME/.vim/plugged/gruvbox/gruvbox_256palette.sh"
source /opt/ros/kinetic/setup.bash
source ${HOME}/catkin_ws/devel/setup.bash
source /usr/share/gazebo/setup.sh

# export CPLUS_INCLUDE_PATH=/usr/include/gtest:$CPLUS_INCLUDE_PATH


export OPENOCD_PATH=$HOME/opt/gnu-mcu-eclipse/openocd/0.10.0-8-20180512-1921


if [ -f ~/bin/sensible.bash ]; then
   source ~/bin/sensible.bash
fi

# source ~/bin/.bash-powerline.sh

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
# Prompt
# RBW_PATH=$HOME/.rainbow-bash
# source $RBW_PATH/init.sh
# rbw_load_theme simple
# Path to the bash it configuration
export BASH_IT="/home/gagarin/git/bash_it"

# Lock and Load a custom theme file.
# Leave empty to disable theming.
# location /.bash_it/themes/
export BASH_IT_THEME=''

# (Advanced): Change this to the name of your remote repo if you
# cloned bash-it with a remote other than origin such as `bash-it`.
# export BASH_IT_REMOTE='bash-it'

# Your place for hosting Git repos. I use this for private repos.
# export GIT_HOSTING='git@git.domain.com'

# Don't check mail when opening terminal.
# unset MAILCHECK

# Change this to your console based IRC client of choice.
# export IRC_CLIENT='irssi'

# Set this to the command you use for todo.txt-cli
# export TODO="t"

# Set this to false to turn off version control status checking within the prompt for all themes
# export SCM_CHECK=true

# Set Xterm/screen/Tmux title with only a short hostname.
# Uncomment this (or set SHORT_HOSTNAME to something else),
# Will otherwise fall back on $HOSTNAME.
#export SHORT_HOSTNAME=$(hostname -s)

# Set Xterm/screen/Tmux title with only a short username.
# Uncomment this (or set SHORT_USER to something else),
# Will otherwise fall back on $USER.
#export SHORT_USER=${USER:0:8}

# Set Xterm/screen/Tmux title with shortened command and directory.
# Uncomment this to set.
#export SHORT_TERM_LINE=true

# Set vcprompt executable path for scm advance info in prompt (demula theme)
# https://github.com/djl/vcprompt
#export VCPROMPT_EXECUTABLE=~/.vcprompt/bin/vcprompt

# (Advanced): Uncomment this to make Bash-it reload itself automatically
# after enabling or disabling aliases, plugins, and completions.
# export BASH_IT_AUTOMATIC_RELOAD_AFTER_CONFIG_CHANGE=1

# Uncomment this to make Bash-it create alias reload.
# export BASH_IT_RELOAD_LEGACY=1
 #
 #   L E S S   C O L O R S   F O R   M A N   P A G E S
 #

 # CHANGE FIRST NUMBER PAIR FOR COMMAND AND FLAG COLOR
 # currently 0;33 a.k.a. brown, which is dark yellow for me
    export LESS_TERMCAP_md=$'\E[0;33;5;74m'  # begin bold

 # CHANGE FIRST NUMBER PAIR FOR PARAMETER COLOR
 # currently 0;36 a.k.a. cyan
    export LESS_TERMCAP_us=$'\E[0;36;5;146m' # begin underline

 # don't change anything here
    export LESS_TERMCAP_mb=$'\E[1;31m'       # begin blinking
    export LESS_TERMCAP_me=$'\E[0m'           # end mode
    export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
    export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box
    export LESS_TERMCAP_ue=$'\E[0m'           # end underline

 #########################################
 # Colorcodes:
 # Black       0;30     Dark Gray     1;30
 # Red         0;31     Light Red     1;31
 # Green       0;32     Light Green   1;32
 # Brown       0;33     Yellow        1;33
 # Blue        0;34     Light Blue    1;34
 # Purple      0;35     Light Purple  1;35
 # Cyan        0;36     Light Cyan    1;36
 # Light Gray  0;37     White         1;37
 #########################################
# if command -v shellhistory-location &>/dev/null; then
#     . $(shellhistory-location)
#     shellhistory enable
# fi
eval $(thefuck --alias)
# You can use whatever you want as an alias, like for Mondays:
eval $(thefuck --alias FUCK)
# Load Bash It
# Helper function loading various enable-able files
function _load_bash_it_files() {
  subdirectory="$1"

  if [ ! -d "${BASH_IT}/${subdirectory}/enabled" ]
  then
    continue
  fi
  FILES="${BASH_IT}/${subdirectory}/enabled/*.bash"
  for config_file in $FILES
  do
    echo ${config_file}

    if [ -e "${config_file}" ]; then
      time source $config_file
    fi
  done
}

# echo "$BASH_IT"'/bash_it.sh'
# source "$BASH_IT"/bash_it.sh

# source ~/.bash_prompt
source ~/.gitprompt.sh
source /usr/share/autojump/autojump.sh
# to fix matlab garbled terminal
export J2D_D3D=false
export MATLAB_JAVA=/usr/bin/java
# source ~/bin/gruvbox-dark.sh
# bind '"^[[18~":"\C-k \C-u_load_bash_it_files\n"'
# bind -x '"^[[18~":"_load_bash_it_files"'
# bind -x '"^[[18~": "_load_bash_it_files"'
export PROVANT_ROS=/home/gagarin/catkin_ws/src
export TILT_STRATEGIES=/home/gagarin/catkin_ws/devel/lib/
export TILT_PROJECT=/home/gagarin/catkin_ws/src/ProVANT-Simulator_Developer
export TILT_MATLAB=/home/gagarin/catkin_ws/src/ProVANT-Simulator_Developer/source/Structure/Matlab/
export PROVANT_DATABASE=/home/gagarin/catkin_ws/src/ProVANT-Simulator_Developer/source/Database
export GAZEBO_MODEL_PATH=/home/gagarin/catkin_ws/src/ProVANT-Simulator_Developer/source/Database/models
export DIR_ROS=/home/gagarin/catkin_ws


export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
