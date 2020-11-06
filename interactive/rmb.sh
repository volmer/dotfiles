function rmb () {
  current_branch=$(git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')

  echo "Fetching merged branches..."

  git remote prune origin

  branches=$(git branch --merged | grep -v 'master$' | grep -v "$current_branch$")

  if [ -z "$branches" ]; then
    echo "No existing branches have been merged into $current_branch."
  else
    echo "This will remove the following branches:"

    if [ -n "$branches" ]; then
      echo "$branches"
    fi

    if read -q "choice?Continue? (y/n): "; then
      echo "\n"
      git branch -d `git branch --merged | grep -v 'master$' | grep -v "$current_branch$" | sed 's/origin\///g' | tr -d '\n'`
    else
      echo "No branches removed."
    fi
  fi
}
