function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export BEAUTIFUL_STAR='\[\033[33m\]☆ '

export PS1='\[\033[34m\]$(rbenv version-name) \[\033[31m\]♥ \[\033[36m\]\w\[\033[32m\]$(parse_git_branch)\[\033[m\]\$ '
export CLICOLOR=1
export LSCOLORS='ExFxBxDxCxegedabagacad'
