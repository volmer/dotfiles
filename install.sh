#!/bin/bash

echo "Installing Brew bundle..."
brew bundle

echo "Symlinking $PWD..."
ln -s -f $PWD ~/.dotfiles

for file in ~/.dotfiles/dotfiles/*; do
  echo "Installing $(basename $file)..."
  ln -s -f $file ~/.$(basename $file)
done

if type "atom" > /dev/null 2>&1 ; then
  echo "Installing Atom prefrences..."
  for file in ~/.dotfiles/atom/*; do
    echo "Installing $(basename $file)..."
    ln -s -f $file ~/.atom/$(basename $file)
  done

  echo "Installing Atom packages..."
  # To generate: apm list --installed --bare > ~/.dotfiles/atom/packages.txt
  apm install --packages-file ~/.dotfiles/atom/packages.txt
else
  echo "Atom not found! Install Atom and re-run this command."
fi
