# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
# Vi mode
  if [ "$TMUX" = "" ]; then
    tmux attach -t default || tmux new -s default;
  fi
# Path to your oh-my-zsh installation.
  export ZSH="/home/gagarin/.oh-my-zsh"

bindkey -v
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="robbyrussell"
# ZSH_THEME="agnoster"
# ZSH_THEME="dracula"
# ZSH_THEME="gruvbox-powerline"
# ZSH_THEME="blinks"
# ZSH_THEME="spaceship"
ZSH_THEME="gagarin"
# ZSH_THEME="avit"
# ZSH_THEME="gruvbox"
# SOLARIZED_THEME="dark"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  git-extras
  mercurial
  common-aliases
  compleat
  dirhistory
  sudo
  systemd
  tmux
  web-search
  vi-mode
)
  # npm
  # pip
  # debian

source $ZSH/oh-my-zsh.sh
unalias fd
source ~/.aliases
source ~/.profile
# source ~/bin/zshrc.sh


# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# User configuration
# Always work in a tmux session if tmux is installed
# https://github.com/chrishunt/dot-files/blob/master/.zshrc
# if which tmux 2>&1 >/dev/null; then
  # if [ "$TMUX" = "" ]; then
  #   tmux attach -t default || tmux new -s default;
  # fi
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export PATH=$PATH:~/opt/gnu-mcu-eclipse/arm-none-eabi-gcc/7.2.1-1.1-20180401-0515/bin
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

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source "$HOME/.vim/plugged/gruvbox/gruvbox_256palette.sh"
source /opt/ros/kinetic/setup.zsh
source ${HOME}/catkin_ws/devel/setup.zsh
source /usr/share/gazebo/setup.sh

export OPENOCD_PATH=$HOME/opt/gnu-mcu-eclipse/openocd/0.10.0-8-20180512-1921

export PROVANT_ROS=/home/gagarin/catkin_ws/src
export TILT_STRATEGIES=/home/gagarin/catkin_ws/devel/lib/
export TILT_PROJECT=/home/gagarin/catkin_ws/src/ProVANT-Simulator
export TILT_MATLAB=/home/gagarin/catkin_ws/src/ProVANT-Simulator/source/Structure/Matlab/
export PROVANT_DATABASE=/home/gagarin/catkin_ws/src/ProVANT-Simulator/source/Database
export GAZEBO_MODEL_PATH=/home/gagarin/catkin_ws/src/ProVANT-Simulator/source/Database/models
export DIR_ROS=/home/gagarin/catkin_ws


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[[ -s /home/gagarin/.autojump/etc/profile.d/autojump.sh ]] && source /home/gagarin/.autojump/etc/profile.d/autojump.sh

autoload -U compinit && compinit -u
