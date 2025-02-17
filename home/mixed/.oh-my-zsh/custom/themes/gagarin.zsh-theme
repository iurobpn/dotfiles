local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
# %{$fg_bold[green]%}
# PROMPT='${ret_status} %{%F{34}%}%n@%M %{$fg[blue]%}%c%{$reset_color%} $(git_prompt_info)%{%F{34}%}$%{$reset_color%} '
PROMPT='${ret_status}%{%F{28}%}%n@%M %{$fg[blue]%}%c%{$reset_color%} $(git_prompt_info)%{$fg_bold[green]%}∫ %{$reset_color%}'
# PROMPT='%B%m%~%b$(git_super_status) %# '
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX=" "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

