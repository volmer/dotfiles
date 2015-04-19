#!/bin/bash

echo "Symlinking $PWD..."
ln -s -f $PWD ~/.dotfiles

for file in ~/.dotfiles/dotfiles/*; do
  echo "Installing $(basename $file)..."
  ln -s -f $file ~/.$(basename $file)
done

if type "subl" > /dev/null 2>&1 ; then
  echo "Installing Sublime Text 3 user prefrences..."
  ln -s -i ~/.dotfiles/Sublime\ Text\ 3/Packages/User ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/
fi

if type "defaults" > /dev/null 2>&1 ; then
  echo "Installing iTerm prefrences..."
  defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder 1
  defaults write com.googlecode.iterm2.plist PrefsCustomFolder '~/.dotfiles/iTerm'
fi
