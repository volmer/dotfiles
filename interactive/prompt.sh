autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '%F{77}(%b)%f'
setopt prompt_subst

export PROMPT='%B%F{31}%~%b%f ${vcs_info_msg_0_} %B%F{227}%#%b%f '
