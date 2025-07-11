
# vim: set ft=bash:
export GEM_HOME="$(gem env user_gemhome 2>/dev/null)"
export PATH="$HOME/bin:$HOME/.local/bin:$PATH"
export PATH="/usr/local/texlive/2025/bin/x86_64-linux:$PATH"

if [ -d "$GEM_HOME/bin" ]; then
    export PATH="$GEM_HOME/bin:$PATH"
fi
if [ -d "$HOME/.cargo/bin" ]; then
    export PATH="$HOME/.cargo/bin:$PATH"
fi

export FZF_DEFAULT_OPTS="--color=fg:#ebdbb2,bg:#282828,hl:#b16286 --color=fg+:#689d6a,bg+:#32302f,hl+:#d3869b --color=info:#d65d0e,prompt:#458588,pointer:#fe8019 --color=marker:#8ec07c,spinner:#cc241d,header:#fabd2f --reverse --multi --info=inline"
export FZF_DEFAULT_COMMAND="fd . --type f --hidden --follow"
export FZF_CTRL_T_OPTS="
    --walker-skip .git,node_modules,target
    --preview 'bat -n --color=always {}'
    --bind 'ctrl-/:change-preview-window(down|hidden|)'"

    # CTRL-Y to copy the command into clipboard using pbcopy
export FZF_CTRL_R_OPTS="
    --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
    --color header:italic
    --header 'Press CTRL-Y to copy command into clipboard'"

# Print tree structure in the preview window
export FZF_ALT_C_OPTS="--walker-skip .git,node_modules,target, --preview \"tree -C {}\""
export FZF_PREVIEW_CMD='--preview "bat --style=numbers --color=always {}" --preview-window "60%,wrap"'
export fzf_preview_command="bat --style=numbers --color=always --theme=gruvbox-dark --highlight-line=$(echo {} | cut -d: -f2) $(echo {} | cut -d: -f1)"

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# nvm use 22

