bind TAB:menu-complete
export GOPATH=$HOME/go
export PATH=$PATH:~/opt/gnu-mcu-eclipse/arm-none-eabi-gcc/7.2.1-1.1-20180401-0515/bin:~/opt/LanguageTool-4.4:$GOPATH/bin
export PATH=~/opt/Qt/5.12.1/gcc_64/bin:$PATH
export QT_SELECT=qt5
export QTDIR=/usr/share/qt5
export XDG_CONFIG_DIRS=$XDG_CONFIG_DIRS:$HOME/.config
export XDG_CONFIG_HOME=$XDG_CONFIG_HOME:$HOME/.config


export EDITOR=vim
export LD_LIBRARY_PATH=$HOME/opt/boost/boost_1_65_1/stage/lib:$HOME/Qt/5.5/gcc_64/lib:$LD_LIBRARY_PATH:/usr/local/lib


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

if [ -z "$TMUX" ]; then
	tmux attach -t default || tmux new -s default
fi

source ~/.bash_aliases
# source ~/.profile
source "$HOME/.vim/plugged/gruvbox/gruvbox_256palette.sh"

# source /opt/ros/kinetic/setup.bash
# source ${HOME}/catkin_ws/devel/setup.bash
# source /usr/share/gazebo/setup.sh

# export CPLUS_INCLUDE_PATH=/usr/include/gtest:$CPLUS_INCLUDE_PATH


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
add_venv_info () {
    if [ -z "$VIRTUAL_ENV_DISABLE_PROMPT" ] ; then
        _OLD_VIRTUAL_PS1="$PS1"

        if [ "`basename \"$VIRTUAL_ENV\"`" = "__" ] ; then
            # special case for Aspen magic directories
            # see http://www.zetadev.com/software/aspen/
            PS1="[`basename \`dirname \"$VIRTUAL_ENV\"\``] $PS1"
        elif [ "$VIRTUAL_ENV" != "" ]; then
            PS1="(`basename \"$VIRTUAL_ENV\"`)$PS1"
        fi
    fi
    export PS1
}
PROMPT_COMMAND=add_venv_info
# source ~/.bash_prompt
source ~/.gitprompt.sh
# source /usr/share/autojump/autojump.sh
# to fix matlab garbled terminal
# export J2D_D3D=false
# export MATLAB_JAVA=/usr/bin/java

# source ~/bin/gruvbox-dark.sh
# bind '"^[[18~":"\C-k \C-u_load_bash_it_files\n"'
# bind -x '"^[[18~":"_load_bash_it_files"'
# bind -x '"^[[18~": "_load_bash_it_files"'

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:/home/gagarin/hdd/opt/Mathematica/11.3/Executables:$PATH"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/home/gagarin/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/home/gagarin/anaconda3/etc/profile.d/conda.sh" ]; then
#         . "/home/gagarin/anaconda3/etc/profile.d/conda.sh"
#     else
#         export PATH="/home/gagarin/anaconda3/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# <<< conda initialize <<<

# export PYTHONPATH=$PYTHONPATH:/usr/lib/python2.7/dist-packages

