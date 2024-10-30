#!/usr/bin/fish

# what directories should be installable by all users including the root user
# run the stow command for the passed in directory ($2) in location $1
function stowit
    set usr $argv[1]
    set app $argv[2]
    # -v verbose
    # -R recursive
    # -t target
    stow -v -R -t $usr $app
end

function unstowit
    set usr $argv[1]
    set app $argv[2]
    # -v verbose
    # -R recursive
    # -t target
    stow -v -R -t $usr $app
end

echo ""
echo "#### Stowing apps for user: "(whoami)

# install apps available to local users and root
function stowdir
    set dir $argv[2]
    cd "$DOT/$dir"
    set base (fd -d 1 -td)
    set target $argv[1] # target directory in the system
    set is_home (test $target != $HOME; echo $status)
    for app in $base
        if test $is_home -eq 0
            stowit $target/$app $app
        else
            stowit $target $app
        end
        echo ''
    end
    echo ''
end

echo ''
echo "stowing shell configs"
stowdir $HOME term
echo ''
echo "stowing configs in .config"
stowdir $HOME/".config" config
echo ''
echo "stowing configs in ~"
stowdir $HOME home
echo ''
echo "stowing configs in /etc"
stowdir $HOME "/etc"


echo ""
echo "##### ALL DONE"

