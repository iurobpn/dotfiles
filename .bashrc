bind TAB:menu-complete
export GOPATH=$HOME/go
export PATH=$HOME/bin:$PATH
export QT_SELECT=qt5
export QTDIR=/usr/share/qt5
export XDG_CONFIG_DIRS=$XDG_CONFIG_DIRS:$HOME/.config
export XDG_CONFIG_HOME=$XDG_CONFIG_HOME:$HOME/.config
export GUROBI_VERSION=10.0


export EDITOR=vim
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib

export INCLUDEPATH=/home/gagarin/Qt/5.5/gcc_64/include:$INCLUDEPATH
export BSTINPUTS=/usr/share/texlive/texmf-dist/bibtex/bst/IEEEtran/:$BSTINPUT
export BIBINPUTS=/usr/share/texlive/texmf-dist/bibtex/bib/IEEEtran/:$BIBINPUTS
# export CLASSPATH=$CLASSPATH:/home/gagarin/opt/weka-3-8-0/
export CLASSPATH=$WEKAHOME:$WEKAHOME/weka.jar:$WEKAHOME/libsvm.jar
export FONTCONFIG_FILE=$CONDA_PREFIX/etc/fonts/fonts.conf
export FONTCONFIG_PATH=$CONDA_PREFIX/etc/fonts/

# if [ -z "$TMUX" ]; then
# 	tmux attach -t default || tmux new -s default
# fi

source ~/.bash_aliases
# source ~/.profile
source "$HOME/.vim/plugged/gruvbox/gruvbox_256palette.sh"

export OPENOCD_PATH=$HOME/opt/xPacks/@xpack-dev-tools/openocd/0.10.0-14/


# if [ -f ~/bin/sensible.bash ]; then
#    source ~/bin/sensible.bash
# fi

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
 # Light Gray  0;37     hite         1;37
 #########################################
# add_venv_info () {
#     if [ -z "$VIRTUAL_ENV_DISABLE_PROMPT" ] ; then
#         _OLD_VIRTUAL_PS1="$PS1"
#
#         if [ "`basename \"$VIRTUAL_ENV\"`" = "__" ] ; then
#             # special case for Aspen magic directories
#             # see http://www.zetadev.com/software/aspen/
#             PS1="[`basename \`dirname \"$VIRTUAL_ENV\"\``] $PS1"
#         elif [ "$VIRTUAL_ENV" != "" ]; then
#             PS1="(`basename \"$VIRTUAL_ENV\"`)$PS1"
#         fi
#     fi
#     export PS1
# }
# to fix matlab garbled terminal
# export J2D_D3D=false
# export MATLAB_JAVA=/usr/bin/java

if [ -f /usr/share/git/completion/git-completion.bash ]; then
	. /usr/share/git/completion/git-completion.bash
else
	if [ -f /usr/share/bash-completion/completions/git ]; then
		. /usr/share/bash-completion/completions/git
	fi
fi
. /home/gagarin/git/dotfiles/.gitprompt.sh

eval "$(lua /home/gagarin/git/z.lua/z.lua --init bash enhanced once fzf)"
