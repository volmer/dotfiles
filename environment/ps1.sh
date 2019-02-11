function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1='💎 \[\033[31m\]$(ruby -e "print RUBY_VERSION") 🔷 \[\033[32m\]$(node -v) \[\033[36m\]\w\[\033[32m\]$(parse_git_branch)\[\033[m\]\$ '
export CLICOLOR=1
export LSCOLORS='ExFxBxDxCxegedabagacad'
