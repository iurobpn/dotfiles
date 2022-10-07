alias fzt='fzf-tmux'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# apt aliases
alias apti='sudo apt-get install -y'
alias aptu='sudo apt-get update'
alias aptdu='sudo apt-get dist-upgrade'
alias aptug='sudo apt-get upgrade'
alias apta='sudo apt-get autoremove'
alias add-repo='sudo add-apt-repository'
alias apts='apt-cache search'
alias aptp='sudo apt-get purge'

# pacman 
alias pac='sudo pacman -S'
alias pacu='sudo pacman -Syu'
alias pacs='pacman -Ss'
alias pacr='sudo pacman -R'

alias em='emacs -nw'
alias helgrind='valgrind --tool=helgrind'
alias cgr="find . -name '*.h' -or -name '*.c' -or -name '*.cpp' -or -name '*.cc' | xargs grep \!* /dev/null"
alias check='/home/gagarin/git/kernel/linux/scripts/checkpatch.pl'
alias cm='catkin_make'
alias vim='nvim'

alias gs='git status '
alias ga='git add '
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
# alias go='git checkout '
alias got='git checkout'
alias gr='git remote'
alias gk='gitk --all&'
alias gx='gitx --all'
alias gu='git unstage'
alias gln='git log --oneline -n'
alias gl='git log --oneline'
alias gsl='git stash list'

alias cls='clear'
alias tmux='tmux -2'
alias pdflatex='pdflatex -shell-escape'
alias mpad='mousepad'
# alias vim='vim --servername vim'
# alias vim='nvim'

alias v='nvim'
alias sv='sudo nvim'
alias vrc='vim ~/.vimrc'
alias vbrc='vim ~/.bashrc'
# unalias fd
alias zat='zathura'
alias term_size='echo "Rows=$(tput lines) Cols=$(tput cols)"'
alias free='free -h'
alias zt='zathura'
# alias git='hub'
alias vw='vim -c VimwikiIndex'
alias jn='jupyter notebook'
# source ~/.aliasme/aliasme.sh
# ENACOM aliases
alias fw='python flask_wrapper.py'
alias we='workon enacom'
alias de='deactivate'
alias py='python3'

