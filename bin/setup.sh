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

    # Ensure target directory exists
    if not test -d "$usr"
        echo "Creating directory: $usr"
        mkdir -p "$usr"
    end



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

# check dependencies
# fd-find through apt or cargo
# cargo?


#check directories and create the unexisting ones

#check if $DOT is set, if not set DOT to the default
set -g DOT "$HOME/git/dotfiles"

# backup current config.fish
cp ~/.config/fish/config.fish ~/.config/fish/config.fish.bkp

echo 'checking dependecies ...'
if not fc-list | grep 'FiraCode' > /dev/null
    wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/FiraCode.tar.xz
    set -l fontdir /usr/local/share/fonts/ttf
    # install nerd font
    sudo mkdir -p $fontdir
    sudo tar -xvf FiraCode.tar.xz -C $fontdir
    sudo fc-cache -fv
end


mkdir -p ~/git

if not which cargo
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
end

if not which fd
    cargo install fd-find
end
if not which rg
    cargo install ripgrep
end
# install lua, luajit and luarocks
if not which lua > /dev/null
    curl -O https://www.lua.org/ftp/lua-5.1.tar.gz
    tar -xvf lua-5.1.tar.gz ~/git/
    make -C ~/git/lua-5.1.5/ linux test
    sudo make -C ~gagarin/git/lua-5.1 install
    rm lua-5.1.tar.gz
end
if not which luajit > /dev/null
    git clone https://luajit.org/git/luajit.git ~/git/luajit
    make -C ~/git/luajit/
    sudo make install
    
end
if not which luarocks > /dev/null
    curl -O https://luarocks.github.io/luarocks/releases/luarocks-3.11.1.tar.gz
    tar -xvf luarocks-3.11.1.tar.gz -C ~/git/
    make -C ~/git/luarocks-3.11.1/
    cd ~/git/luarocks-3.11.1
    ./configure
    make 
    sudo make install
    cd
end

if not which stow > /dev/null
    ./install_pearl.sh
    ./install_stow.sh
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
rm -f ~/.config/fish/config.fish
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

