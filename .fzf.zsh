# Setup fzf
# ---------
if [[ ! "$PATH" == */home/gagarin/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/gagarin/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/gagarin/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/gagarin/.fzf/shell/key-bindings.zsh"
