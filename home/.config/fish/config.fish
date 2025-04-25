set -Ux ANSIBLE_CONFIG $HOME/.config/ansible/ansible.cfg
set -Ux LANG "en_US.UTF-8"
set -gx ZEIT_DB $HOME/.zeit.db
set -Ux UBUNTU_CODENAME ubuntu_codename
set -Ux PKM_DIR $HOME/git/pkm
set -Ux GCAL_SECRET "$HOME/Documents/credentials/tw_gcal_syncall_client.json"

if status is-interactive
    set -gx ROS_OS_OVERRIDE "ubuntu"
    set -xg MULTIPLEXER "tmux"
    set -Ux EDITOR nvim

    bass source ~/.nvm/nvm.sh
    fish_add_path --append /usr/local/go/bin
    fish_add_path --append /opt/lua-language-server/bin
    fish_vi_key_bindings
    source (status dirname)/.fish_aliases
    set -Ux EDITOR nvim
    fzf --fish | source
    [ -f "$HOME/.cargo/env.fish" ] && . "$HOME/.cargo/env.fish"
    set -xg DOT $HOME/git/dotfiles

    set -Ux FORGIT_INSTALL_DIR ~/git/forgit
    fish_add_path --prepend $DOT/bin HOME/.local/bin /usr/local/go/bin $HOME/git/scripts/lua $HOME/git/scripts $HOME/git/scripts/treesitter/node_modules/.bin $FORGIT_INSTALL_DIR/bin /opt/lualanguageserver/bin ~/go/bin/ $HOME/.local/share/gem/ruby/3.2.0/bin
    set -gpx GZ_SIM_RESOURCE_PATH $HOME/.gazebo/models $HOME/.gazebo/worlds

    set -xg HOST $(hostname)

    set -gx CONAN_PROVIDER $HOME/git/cmake-conan/conan_provider.cmake

    eval "$(luarocks path --bin | sed 's/export \(.*\)/set -xg \1/g' | sed 's/=/ /g')"
    set -Ux LUA_PATH "$LUA_PATH;$HOME/git/scripts/lua/?.lua;$HOME/git/scripts/lua/?/init.lua;$HOME/git/scripts/lua/?.lua"

    set -xga FZF_DEFAULT_OPTS "--color=fg:#ebdbb2,bg:#282828,hl:#b16286 --color=fg+:#689d6a,bg+:#32302f,hl+:#d3869b --color=info:#d65d0e,prompt:#458588,pointer:#fe8019 --color=marker:#8ec07c,spinner:#cc241d,header:#fabd2f --reverse --multi --info=inline"
    set -xg FZF_DEFAULT_COMMAND "fd . --type f --hidden --follow --exclude .git --exclude .gtags"
    set -Ux FZF_CTRL_T_OPTS "
    --walker-skip .git,node_modules,target
    --preview 'bat -n --color=always {}'
    --bind 'ctrl-/:change-preview-window(down|hidden|)'"

    # CTRL-Y to copy the command into clipboard using pbcopy
    set -Ux FZF_CTRL_R_OPTS "
    --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
    --color header:italic
    --header 'Press CTRL-Y to copy command into clipboard'"

    # Print tree structure in the preview window
    set -Ux FZF_ALT_C_OPTS "--walker-skip .git,node_modules,target, --preview \"tree -C {}\""
    set FZF_PREVIEW_CMD --preview "bat --style=numbers --color=always {}" --preview-window "60%,wrap"
    bind -M insert \cf "fd -tf | fzf"



    set -xg TEXMFHOME "$HOME/.texmf"
    fish_add_path -p /usr/local/texlive/2024/bin/x86_64-linux
    set -xag INFOPATH /usr/local/texlive/2024/texmf-dist/doc/info
    [ -f $HOME/git/buku/completions/fish/buku.fish ] && . $HOME/git/buku/completions/fish/buku.fish

    set -xU fzf_preview_command "bat --style=numbers --color=always --theme=gruvbox-dark --highlight-line=$(echo {} | cut -d: -f2) $(echo {} | cut -d: -f1)"


    [ -f ~/lscolors.csh ] && . ~/lscolors.csh
    zoxide init fish | source

    # pnpm
    set -gx PNPM_HOME "$HOME/.local/share/pnpm"
    if not string match -q -- $PNPM_HOME $PATH
        fish_add_path --prepend "$PNPM_HOME"
    end

    # multiplexers section
    if not test -z "$MULTIPLEXER"
        if [ $MULTIPLEXER = "zellij" ]
            set -gx ZELLIJ_AUTO_ATTACH true
            if not set -q ZELLIJ
                zellij delete-all-sessions -y
                set N_SESSIONS $(zellij list-sessions | grep -v EXITED | wc -l)
                if test $N_SESSIONS -eq 0
                    zellij
                else
                    set Z_SESSION $(zellij list-sessions -s | grep -v EXITED | head -n1)
                    zellij  attach $(echo $Z_SESSION)
                end
            end
        else
            if tmux has-session 2>/dev/null
                tmux attach
            else
                tmux new-session -s main
            end
        end
    end
    . $HOME/git/pyautoenv/pyautoenv.fish
end

[ -f ~/.config/fish/git-forgit.fish ] && . ~/.config/fish/git-forgit.fish
# echo "non-interactive fish"

[ -f $DOT/gruvbox/gruvbox.fish ] && . $DOT/gruvbox/gruvbox.fish

set -gx tide_character_icon           ∫
set -gx tide_character_vi_icon_default ξ
set -gx tide_character_vi_icon_visual ν
set -gx tide_character_vi_icon_replace σ
set -gx tide_character_color          $neutral_green
set -gx tide_character_failure_color  $bright_red
set -gx tide_git_icon                 
set -gx tide_git_color_untracked      $bright_red
set -gx tide_git_color_staged         $bright_green
set -gx tide_git_color_unstaged       $bright_yellow
set -gx tide_git_color_ahead          $bright_blue
set -gx tide_git_color_behind         $bright_magenta
set -gx tide_git_color_dirty          $bright_red
set -gx tide_git_color_clean          $bright_green
set -gx tide_git_color_conflicted     $bright_orange
set -gx tide_git_color_branch         $neutral_blue
set -gx tide_git_color_stash          $bright_yellow
set -gx tide_pwd_color_dirs           $neutral_blue
set -gx tide_pwd_color_truncated_dirs $faded_red
set -gx tide_pwd_color_anchors        $bright_blue



# pnpm
set -gx PNPM_HOME "/home/gagarin/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
set -Ux SOFT_SERVE_DATA_PATH "$HOME/hds/hdd/data/soft-serve"

set -Ux GITEA_WORK_DIR "$HOME/hds/hdd/data/gitea"

if [ (hostname) = "lyapunov" ]
    set -Ux NOTES_DIR "$HOME/hdd/sync/obsidian"
else
    set -Ux NOTES_DIR "$HOME/sync/obsidian"
end
#path to cache directory
set -gx FZF_BIBTEX_CACHEDIR ~/.bibtex-fzf/cache 
#paths to .bib files, separated by ":"
set -gx FZF_BIBTEX_SOURCES ~/.bibtex-fzf/bib

set -gx WEZ_FONT_SIZE 12


set -x PATH /home/gagarin/perl5/bin $PATH 2>/dev/null;
set -q PERL5LIB; and set -x PERL5LIB /home/gagarin/perl5/lib/perl5:$PERL5LIB;
set -q PERL5LIB; or set -x PERL5LIB /home/gagarin/perl5/lib/perl5;
set -q PERL_LOCAL_LIB_ROOT; and set -x PERL_LOCAL_LIB_ROOT /home/gagarin/perl5:$PERL_LOCAL_LIB_ROOT;
set -q PERL_LOCAL_LIB_ROOT; or set -x PERL_LOCAL_LIB_ROOT /home/gagarin/perl5;
set -x PERL_MB_OPT --install_base\ \"/home/gagarin/perl5\";
set -x PERL_MM_OPT INSTALL_BASE=/home/gagarin/perl5;


set -Ux FONTCONFIG_PATH /etc/fonts
set -Ux FONTCONFIG_FILE /etc/fonts/fonts.conf
set -gx CALDAV_USERNAME gagarin
set -gx CALDAV_PASSWD "1f3e4c"
[ -f $HOME/git/scripts/scripts.fish ] && . $HOME/git/scripts/scripts.fish
