if status is-interactive
	theme_gruvbox dark hard
	fish_vi_key_bindings
	source (status dirname)/.fish_aliases
	set -Ux EDITOR nvim
	fzf --fish | source
	set -xg DOT $HOME/git/dotfiles

	# set -axg PATH $HOME/.rbenv/versions/3.3.4/bin $HOME/.local/bin /usr/local/go/bin $HOME/git/scripts/lua $HOME/git/scripts
	fish_add_path --prepend $DOT/bin HOME/.local/bin $HOME/.venv/bin /usr/local/go/bin $HOME/git/scripts/lua $HOME/git/scripts $HOME/git/scripts/treesitter/node_modules/.bin


	set -xg HOST $(hostname)

	eval "$(luarocks path --bin | sed 's/export \(.*\)/set -xU \1/g' | sed 's/=/ /g')"
	#eval "$($HOME/.luarocks51/bin/luarocks path --bin | sed 's/export \(.*\)/set -xg \1/g' | sed 's/=/ /g')"

	set -xg FZF_DEFAULT_OPTS "--reverse --multi --info=inline"
	# --preview 'bat --color=always --style=header,grid --line-range :500 {}' --preview-window=right:60%:wrap"
	set -xg FZF_DEFAULT_COMMAND 'fd . --type f --hidden --follow --exclude .git --exclude .gtags'
	set -Ux LUA_PATH "$LUA_PATH;$HOME/git/scripts/lua/?.lua;$HOME/git/scripts/lua/?/init.lua;$HOME/git/scripts/lua/?.lua"

	source $HOME/git/scripts/scripts.fish
	set -xg TEXMFHOME '$HOME/.texmf'
    if tmux has-session
	    tmux attach 
    else
        tmux new-session -s base
    end
	source ~/.venv/bin/activate.fish
end
# echo 'non-interactive fish'

source $DOT/gruvbox/gruvbox.fish

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

set -xg fzf_preview_command 'bat --style=numbers --color=always --theme=gruvbox-dark --highlight-line=$(echo {} | cut -d: -f2) $(echo {} | cut -d: -f1)'

zoxide init fish | source

#if not set -q TMUX
	#tmux new-session -d -s base
	#set -g TMUX (tmux new-session -d -s base)
	#tmux attach -t base
#else
	#tmux attac
#end
# starship init fish | source
