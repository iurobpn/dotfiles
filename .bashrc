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
# Prompt functions and definition
green_pmt='\[\033[01;32m\]'
white_pmt='\[\033[00m\]'
blue_pmt='\[\033[01;34m\]'
red_pmt='\[\033[01;31m\]'
green_epmt='\033[01;32m'
white_epmt='\033[00m'
blue_epmt='\033[01;34m'
red_epmt='\033[01;31m'
function nonzero_return() {
	RETVAL=$?
	[ $RETVAL -ne 0 ] && echo "$RETVAL"
}

# get current branch in git repo
function parse_git_branch() {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ ! "${BRANCH}" == "" ]
	then
		STAT=`parse_git_dirty`
		echo "${BRANCH}${STAT}"
	else
		echo ""
	fi
}

function get_color_git_branch() {
	GIT_INFO=`parse_git_branch`
	if [ ! "${GIT_INFO}" == "" ]
	then
		echo -e "${blue_epmt}(${red_epmt}${GIT_INFO}${blue_epmt})"
	else
		echo ""
	fi
}

# get current status of git repo
function parse_git_dirty {
	status=`git status 2>&1 | tee`
	dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
	untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
	ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
	newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
	renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
	deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
	bits=''
	if [ "${renamed}" == "0" ]; then
		bits=">${bits}"
	fi
	if [ "${ahead}" == "0" ]; then
		bits="*${bits}"
	fi
	if [ "${newfile}" == "0" ]; then
		bits="+${bits}"
	fi
	if [ "${untracked}" == "0" ]; then
		bits="?${bits}"
	fi
	if [ "${deleted}" == "0" ]; then
		bits="x${bits}"
	fi
	if [ "${dirty}" == "0" ]; then
		bits="!${bits}"
	fi
	if [ ! "${bits}" == "" ]; then
		echo " ${bits}"
	else
		echo ""
	fi
}
function parse_git_status() {
	status=`git status 2>&1 | tee`
	dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
	untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
	ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
	newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
	renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
	deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
	unstaged=`echo -n "${status}" 2> /dev/null | grep "Changes not staged for commit:" &> /dev/null; echo "$?"`
	staged=`echo -n "${status}" 2> /dev/null | grep "Changes to be committed:" &> /dev/null; echo "$?"`
	clean=`echo -n "${status}" 2> /dev/null | grep "nothing to commit, working directory clean" &> /dev/null; echo "$?"`
	bits=''
	if [ "${dirty}" == "0" ]; then
		bits="${bits}1"
	else
		bits="${bits}0"
	fi
	if [ "${untracked}" == "0" ]; then
		bits="${bits}1"
	else
		bits="${bits}0"
	fi
	if [ "${ahead}" == "0" ]; then
		bits="${bits}1"
	else
		bits="${bits}0"
	fi
	if [ "${newfile}" == "0" ]; then
		bits="${bits}1"
	else
		bits="${bits}0"
	fi
	if [ "${renamed}" == "0" ]; then
		bits="${bits}1"
	else
		bits="${bits}0"
	fi
	if [ "${deleted}" == "0" ]; then
		bits="${bits}1"
	else
		bits="${bits}0"
	fi
	if [ "${unstaged}" == "0" ]; then
		bits="${bits}1"
	else
		if [ "${untracked}" == "0" ]; then
			bits="${bits}1"
		else
			bits="${bits}0"
		fi
	fi
	if [ "${staged}" == "0" ]; then
		bits="${bits}1"
	else
		bits="${bits}0"
	fi
	if [ "${clean}" == "0" ]; then
		bits="${bits}1"
	else
		bits="${bits}0"
	fi
	echo $bits
}
function print_git_status() {
	BITS=$(parse_git_status)
	dirty=${BITS:0:1}
	untracked=${BITS:1:1}
	ahead=${BITS:2:1}
	newfile=${BITS:3:1}
	renamed=${BITS:4:1}
	deleted=${BITS:5:1}
	unstaged=${BITS:6:1}
	staged=${BITS:7:1}
	clean=${BITS:8:1}
	if [ "${dirty}" == "1" ]; then
		echo "modified"
	fi
	if [ "${untracked}" == "1" ]; then
		echo "untracked"
	fi
	if [ "${ahead}" == "1" ]; then
		echo "ahead"
	fi
	if [ "${newfile}" == "1" ]; then
		echo "newfile"
	fi
	if [ "${renamed}" == "1" ]; then
		echo "renamed"
	fi
	if [ "${deleted}" == "1" ]; then
		echo "deleted"
	fi
	if [ "${unstaged}" == "1" ]; then
		echo "unstaged"
	fi
	if [ "${staged}" == "1" ]; then
		echo "staged"
	fi
	if [ "${clean}" == "1" ]; then
		echo "clean"
	fi
}

RET=''
function get_color_ret() {
	RETVAL=$?
	if [ ${RETVAL} -ne 0 ]; then
		# echo  "$red_pmt ➜ ops"
		echo  "➜ ops"
	else
		# echo  "$blue_pmt ➜ ola"
		echo  "➜ ola"
	fi
	# echo "➜"
}
# export PS1="\[\e[32m\]\u\[\e[m\]\[\e[32m\]@\[\e[m\]\[\e[32m\]\h\[\e[m\] \[\e[34m\]\W\[\e[m\] \[\e[32m\]\`parse_git_branch\`\[\e[m\] \[\e[31m\]\`nonzero_return\`\[\e[m\]\[\e[32m\]\\$\[\e[m\] "
#
# if [ "$color_prompt" = yes ]; then
#     export PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
# else
#     export PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
# fi
# unset color_prompt force_color_prompt
#
# # If this is an xterm set the title to user@host:dir
# case "$TERM" in
# xterm*|rxvt*)
#     export PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
#     ;;
# *)
#     ;;
# esac
#
# export PS1="\`get_color_ret\` $RET $green_pmt \u@\h $blue_pmt\W \`get_color_git_branch\` $white_pmt"
source ~/bin/git-prompt.sh

function test_status() {
	RETVAL=$?
	if [ $RETVAL -ne 0 ]; then
		echo "carai"
	else
		echo "ola"
	fi

}
function reset_ps1() {
	local RETVAL=$?
	PS1=''
	if [ $RETVAL -ne 0 ]; then
		PS1="$red_pmt➜"$PS1
	else
		PS1="$blue_pmt➜"$PS1
		# PS1="$blue_pmt ➜ $green_pmt  \u@\h $blue_pmt\W$(__git_ps1 " (%s)") ∫$white_pmt "
	fi
	GIT_BRANCH=$(__git_ps1 "%s")
	GIT_STATUS=$(parse_git_status)
	PS1=$PS1"$green_pmt \u@\h $blue_pmt\W"
	unstaged=${GIT_STATUS:6:1}
	staged=${GIT_STATUS:7:1}
	clean=${GIT_STATUS:8:1}

	glyph_color=''
	branch_color=''
	if [ ! "${GIT_BRANCH}" == "" ]; then
		if [ "${clean}" == "1" ]; then
			glyph_color="$white_pmt"
			branch_color="$white_pmt"
		fi
		if [ "${unstaged}" == "1" ]; then
			if [ "${staged}" == "1" ]; then
				glyph_color="$green_pmt"
			else
				glyph_color="$red_pmt"
			fi
			branch_color="$red_pmt"
		else
			if [ "${staged}" == "1" ]; then
				glyph_color="$green_pmt"
				branch_color="$green_pmt"
			fi
		fi
		PS1=$PS1" ($glyph_color $branch_color$GIT_BRANCH$blue_pmt)"
	fi
	PS1=$PS1" $green_pmt∫ $white_pmt"

}
export PROMPT_COMMAND='reset_ps1; history -a'

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
###-begin-npm-completion-###
#
# npm command completion script
#
# Installation: npm completion >> ~/.bashrc  (or ~/.zshrc)
# Or, maybe: npm completion > /usr/local/etc/bash_completion.d/npm
#

if type complete &>/dev/null; then
  _npm_completion () {
    local words cword
    if type _get_comp_words_by_ref &>/dev/null; then
      _get_comp_words_by_ref -n = -n @ -w words -i cword
    else
      cword="$COMP_CWORD"
      words=("${COMP_WORDS[@]}")
    fi

    local si="$IFS"
    IFS=$'\n' COMPREPLY=($(COMP_CWORD="$cword" \
                           COMP_LINE="$COMP_LINE" \
                           COMP_POINT="$COMP_POINT" \
                           npm completion -- "${words[@]}" \
                           2>/dev/null)) || return $?
    IFS="$si"
  }
  complete -o default -F _npm_completion npm
elif type compdef &>/dev/null; then
  _npm_completion() {
    local si=$IFS
    compadd -- $(COMP_CWORD=$((CURRENT-1)) \
                 COMP_LINE=$BUFFER \
                 COMP_POINT=0 \
                 npm completion -- "${words[@]}" \
                 2>/dev/null)
    IFS=$si
  }
  compdef _npm_completion npm
elif type compctl &>/dev/null; then
  _npm_completion () {
    local cword line point words si
    read -Ac words
    read -cn cword
    let cword-=1
    read -l line
    read -ln point
    si="$IFS"
    IFS=$'\n' reply=($(COMP_CWORD="$cword" \
                       COMP_LINE="$line" \
                       COMP_POINT="$point" \
                       npm completion -- "${words[@]}" \
                       2>/dev/null)) || return $?
    IFS="$si"
  }
  compctl -K _npm_completion npm
fi
###-end-npm-completion-###
# Yavide alias
alias yavide="gvim --servername yavide -f -N -u /home/gagarin/opt/yavide/yavide/.vimrc"

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

export PROVANT_ROS=/home/gagarin/catkin_ws/src
export TILT_STRATEGIES=/home/gagarin/catkin_ws/devel/lib/
export TILT_PROJECT=/home/gagarin/catkin_ws/src/ProVANT-Simulator
export TILT_MATLAB=/home/gagarin/catkin_ws/src/ProVANT-Simulator/source/Structure/Matlab/
export PROVANT_DATABASE=/home/gagarin/catkin_ws/src/ProVANT-Simulator/source/Database
export GAZEBO_MODEL_PATH=/home/gagarin/catkin_ws/src/ProVANT-Simulator/source/Database/models
export DIR_ROS=/home/gagarin/catkin_ws

if [ -f ~/bin/sensible.bash ]; then
   source ~/bin/sensible.bash
fi

# source ~/bin/.bash-powerline.sh

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
# Prompt
# RBW_PATH=$HOME/.rainbow-bash
# source $RBW_PATH/init.sh
# rbw_load_theme simple
