#!/usr/bin/fish
# vi: ft=fish

# what directories should be installable by all users including the root user
# run the stow command for the passed in directory ($2) in location $1
function stowit
    set -l cmd $argv[1]
    if  [ "$cmd" = "-d" ]
        set cmd "-D"
        set -e argv[1]
    else
        if [ "$cmd" = "-r" ]
            set -e argv[1]
        end
        set cmd "-R"
    end

    set -l usr $argv[1]
    set -l app $argv[2]

    mkdir -p $usr
    # -v verbose
    # -R recursive
    # -t target
    if [ "$argv[3]" = "-s" ]
        echo "sudo stow -v $cmd -t $usr $app"
        sudo stow -v $cmd -t $usr $app
    else
        echo "stow -v $cmd -t $usr $app"
        stow -v $cmd -t $usr $app
    end
end

# install apps available to local users and root
function stowdir
    set -l cmd $argv[1]
    if  [ "$cmd" = "-d" ]
        set -e argv[1]
    else
        if [ "$cmd" = "-r" ]
            set -e argv[1]
        else
            set cmd "-r"
        end
    end
    set -l dir $argv[2]
    cd "$DOT/$dir"
    set -l base (fd -d 1 -td)
    set -l target $argv[1] # target directory in the system
    set -l is_home (test $target != $HOME; echo $status)
    for app in $base
        set -l len (math (string length $app) - 1)
        set -l source (string sub --length $len $app)
        if [ $is_home -eq 0 ]
            stowit $cmd $target/$source $source $argv[3]
        else
            stowit $cmd $target $source $argv[3]
        end
        echo ''
    end
    echo ''
end

echo ""
echo "#### Stowing apps for user: "(whoami)
set cmd $argv[1]
if  [ "$cmd" = "-d" ]
    set -e argv[1]
else
    if [ "$cmd" = "-r" ]
        set -e argv[1]
    end
    set cmd "-r"
end
echo ''
echo "stowing shell configs"
stowdir $cmd $HOME term
echo ''
echo "stowing configs in .config"
stowdir $cmd $HOME/".config" config
echo ''
echo "stowing configs in ~"
stowdir $cmd $HOME home
echo ''
# echo "stowing configs in /etc"
# stowdir $cmd /etc etc -s
#

echo ""
echo "##### ALL DONE"

